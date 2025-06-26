import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:balanced_meal/utils/colors.dart';

class FoodCard2 extends StatelessWidget {
  final String name;
  final int calories;
  final double price;
  final int quantity;
  final String imageUrl;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const FoodCard2({
    super.key,
    required this.name,
    required this.calories,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: AppColors.white,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                width: 76,
                height: 62,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFF1E1E1E))),
                  Text('$calories Cal',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: AppColors.disabledButton,fontWeight: FontWeight.w400,)),
                ],
              ),
            ),
            Text('\$$price',
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
            const SizedBox(width: 12),
            _circleButton("-", onDecrement),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('$quantity',
                  style: GoogleFonts.poppins(fontSize: 16)),
            ),
            _circleButton("+", onIncrement),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: AppColors.orangeButton,
        child: Text(label,
            style: const TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
