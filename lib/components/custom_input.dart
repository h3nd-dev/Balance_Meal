import 'package:balanced_meal/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final Widget? suffix;
  final TextEditingController? controller;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    this.suffix,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14.sp, // Approx 14px
              fontWeight: FontWeight.w500,
              height: 22 / 14, // ≈ 1.57 line-height
              letterSpacing: 0,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 6.5.h, // 52px height with Sizer
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                suffix: suffix,
                hintStyle: GoogleFonts.questrial(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: AppColors.disabledTextColor,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 2.4.w, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFFEAECF0), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.orangeButton, width: 1.2),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
