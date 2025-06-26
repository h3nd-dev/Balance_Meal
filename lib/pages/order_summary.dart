import 'package:balanced_meal/Methods/api_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../components/food_card2.dart';
import '../components/order_button.dart';
import '../model/food_item.dart';
import '../utils/colors.dart';

class FoodConfirmationPage extends StatefulWidget {
  final List<FoodItem> selectedItems;
  final int maxCalories;

  const FoodConfirmationPage({
    super.key,
    required this.selectedItems,
    required this.maxCalories,
  });

  @override
  State<FoodConfirmationPage> createState() => _FoodConfirmationPageState();
}

class _FoodConfirmationPageState extends State<FoodConfirmationPage> {
  late List<FoodItem> selectedItems;
  final OrderService orderService = OrderService();

  @override
  void initState() {
    super.initState();
    selectedItems = List.from(widget.selectedItems);
  }

  void _increment(FoodItem item) {
    setState(() {
      item.quantity += 1;
    });
  }

  void _decrement(FoodItem item) {
    if (item.quantity > 0) {
      setState(() {
        item.quantity -= 1;
      });
    }
  }

  int get totalCalories => selectedItems.fold(
    0,
        (sum, item) => sum + (item.calories * item.quantity),
  );

  double get totalPrice => selectedItems.fold(
    0.0,
        (sum, item) => sum + (item.price * item.quantity),
  );

  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(context);

    final filteredItems =
    selectedItems.where((item) => item.quantity > 0).toList();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Order summary',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        leading: const BackButton(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: FoodCard2(
                        name: item.name,
                        calories: item.calories,
                        price: item.price,
                        imageUrl: item.image,
                        quantity: item.quantity,
                        onIncrement: () => _increment(item),
                        onDecrement: () => _decrement(item),
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
                onPressed: () {
               if  ( orderService.isLoading){
                 return;
               }

                  orderService.handleConfirm(context, selectedItems);
                },
                buttonText: orderService.isLoading? 'Placing Order...':'Confirm',
                isEnabled: totalCalories >= widget.maxCalories * 0.9 &&
                    totalCalories <= widget.maxCalories * 1.1 || orderService.isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
