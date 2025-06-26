import 'package:balanced_meal/Database/food.dart';
import 'package:balanced_meal/components/navigate_animation.dart';
import 'package:balanced_meal/model/food_category.dart';
import 'package:balanced_meal/pages/order_summary.dart';
import 'package:balanced_meal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../components/food_card.dart';
import '../components/order_button.dart';

class FoodSelectionPage extends StatefulWidget {
  final int maxCalories;
  const FoodSelectionPage({super.key, required this.maxCalories});

  @override
  State<FoodSelectionPage> createState() => _FoodSelectionPageState();
}

class _FoodSelectionPageState extends State<FoodSelectionPage> {
  late List<FoodCategory> foodCategories;
  int totalCalories = 0;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    final Inventory inventory = Inventory();
    final rawCategories = inventory.rawCategories;
    foodCategories = rawCategories.map((map) => FoodCategory.fromMap(map)).toList();
  }

  void handlePlaceOrder() {
    final selectedFoods = foodCategories
        .expand((category) => category.foods)
        .where((food) => food.quantity > 0)
        .toList();



    Navigator.push(
      context,
      SlidePageRoute(
        page: FoodConfirmationPage(
          selectedItems: selectedFoods, // build this from your food list
          maxCalories: widget.maxCalories,
        ),
      ),
    );
  }


  void updateTotals() {
    int newCalories = 0;
    double newPrice = 0;
    for (var category in foodCategories) {
      for (var food in category.foods) {
        newCalories += food.calories * food.quantity;
        newPrice += food.price * food.quantity;
      }
    }
    setState(() {
      totalCalories = newCalories;
      totalPrice = newPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isWithinRange = totalCalories >= widget.maxCalories * 0.9 && totalCalories <= widget.maxCalories * 1.1;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(86),
        child: AppBar(
          backgroundColor: AppColors.white,
          elevation: 1,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BackButton(color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Create your order',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.67.w, vertical: 2.h),
              child: Text(
                'You need approximately ${widget.maxCalories} calories',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: foodCategories.length,
                itemBuilder: (context, index) {
                  final category = foodCategories[index];
                  final foods = category.foods;

                  return Padding(
                    padding: EdgeInsets.only(left: 6.67.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.category,
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 280,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: foods.length,
                            itemBuilder: (context, foodIndex) {
                              final item = foods[foodIndex];
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                child: SizedBox(
                                  width: 200,
                                  child: FoodCard(
                                    name: item.name,
                                    calories: item.calories,
                                    price: item.price,
                                    imageUrl: item.image,
                                    quantity: item.quantity,
                                    onAdd: () {
                                      setState(() {
                                        item.quantity = 1;
                                      });
                                      updateTotals();
                                    },
                                    onIncrement: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                      updateTotals();
                                    },
                                    onDecrement: () {
                                      setState(() {
                                        if (item.quantity > 0) item.quantity--;
                                      });
                                      updateTotals();
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            OrderSummaryCard(
              calories: totalCalories,
              maxCalories: widget.maxCalories,
              price: totalPrice,
              onPressed: handlePlaceOrder,
              buttonText: 'Place order',
              isEnabled: isWithinRange,
            )
          ],
        ),
      ),
    );
  }
}
