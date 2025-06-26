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
              fontSize: 11.5.sp, // Approx 14px
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
                hintStyle: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 10.5.sp,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2.w),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
