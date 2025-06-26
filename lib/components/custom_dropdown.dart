import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final Function(T?) onChanged;
  final String hint;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.hint,
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
              fontSize: 11.5.sp, // ~14px
              fontWeight: FontWeight.w500,
              height: 22 / 14, // ~1.57 line-height
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 1.h),
          Container(
            height: 6.5.h, // ~52px
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(2.w),
              color: Colors.white,
            ),
            child: DropdownButtonFormField<T>(
              value: value,
              items: items,
              onChanged: onChanged,
              decoration: const InputDecoration.collapsed(hintText: ''),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              style: GoogleFonts.poppins(
                fontSize: 10.5.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
              hint: Text(
                hint,
                style: GoogleFonts.poppins(
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(2.w),
            ),
          ),
        ],
      ),
    );
  }
}
