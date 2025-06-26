import 'package:balanced_meal/components/primary_button.dart';
import 'package:balanced_meal/utils/colors.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OrderSummaryCard extends StatelessWidget {
  final int calories;
  final int maxCalories;
  final double price;
  final VoidCallback onPressed;
  final String buttonText ;
  final bool isEnabled;

  const OrderSummaryCard({
    super.key,
    required this.calories,
    required this.maxCalories,
    required this.price,
    required this.onPressed,
    required this.buttonText,
    required this.isEnabled
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.05 * 255).toInt()),


            blurRadius: 12,
            offset: const Offset(0, -4), // Shadow goes **upward**
          ),
        ],
      ),
      height: 164,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.67.w),
        child: Column(
          children: [
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cal',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: const Color(0XFF1E1E1E),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '$calories Cal out of $maxCalories Cal',
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: AppColors.disabledButton,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: const Color(0XFF1E1E1E),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '\$${price.toStringAsFixed(0)}',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: AppColors.orangeButton,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: buttonText,
              onPressed: onPressed,
              isEnabled: isEnabled,
            ),
          ],
        ),
      ),
    );
  }
}
