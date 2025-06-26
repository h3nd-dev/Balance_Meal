import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String name;
  final int calories;
  final double price;
  final String? imageUrl;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const FoodCard({
    super.key,
    required this.name,
    required this.calories,
    required this.price,
    this.imageUrl,
    required this.quantity,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: imageUrl != null
                  ? Image.network(imageUrl!, fit: BoxFit.cover)
                  : null,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: const TextStyle(fontSize: 16)),
                Text('$calories Cal',
                    style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$$price', style: const TextStyle(fontSize: 16)),
                quantity == 0
                    ? ElevatedButton(
                  onPressed: onAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Add'),
                )
                    : Row(
                  children: [
                    _circleButton("-", onDecrement),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(quantity.toString()),
                    ),
                    _circleButton("+", onIncrement),
                  ],
                ),
              ],
            ),
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
        backgroundColor: Colors.orange,
        child: Text(label,
            style: const TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
