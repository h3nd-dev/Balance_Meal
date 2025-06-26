import 'package:balanced_meal/components/navigate_animation.dart';
import 'package:balanced_meal/components/primary_button.dart';
import 'package:balanced_meal/pages/create_order.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_dropdown.dart';
import '../components/custom_input.dart';
import '../components/toast.dart';
import '../utils/colors.dart';



class EnterDetailsPage extends StatefulWidget {
  const EnterDetailsPage({super.key});

  @override
  State<EnterDetailsPage> createState() => _EnterDetailsPageState();
}

class _EnterDetailsPageState extends State<EnterDetailsPage> {
  String selectedGender = 'Male';
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _age = TextEditingController();

  void handleDetails() {
    final double? weight = double.tryParse(_weight.text);
    final double? height = double.tryParse(_height.text);
    final int? age = int.tryParse(_age.text);


    if (weight == null || height == null || age == null) {
      showTopToast(context, "Please fill in all details correctly.");


      return;
    }


    double calories;
    if (selectedGender == 'Female') {
      calories = 655.1 + (9.56 * weight) + (1.85 * height) - (4.67 * age);
    } else {
      calories = 666.47 + (13.75 * weight) + (5 * height) - (6.75 * age);
    }





    Navigator.push(
      context,
      SlidePageRoute(
        page: FoodSelectionPage(
          maxCalories: calories.toInt(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Sizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(86),
            child:
            AppBar(
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
                        'Enter your details',
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


            ),),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.67.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // GENDER

                 GenderDropdown(),

                SizedBox(height: 3.h),

                // HEIGHT

                CustomInputField(
                  label: 'Weight',
                  hint: 'Enter your Weight',
                  suffix: Text('Kg'),
                  controller: _weight,
                ),

                SizedBox(height: 3.h),

                // HEIGHT

                 CustomInputField(
                  label: 'Height',
                  hint: 'Enter your height',
                  suffix: Text('Cm'),
                   controller: _height,
                ),


                SizedBox(height: 3.h),

                // HEIGHT

                CustomInputField(
                  label: 'Age',
                  hint: 'Enter your age',
                  controller: _age,
                  
                ),

                const Spacer(),

                // DISABLED BUTTON
                PrimaryButton(text: 'Next', onPressed: handleDetails),

              ],
            ),
          ),
        );
      },
    );
  }
}
