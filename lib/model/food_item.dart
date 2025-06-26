class FoodItem {
  final String name;
  final String image;
  final double price;
  final int calories;
   int quantity;

  FoodItem({
    required this.name,
    required this.image,
    required this.price,
    required this.calories,
    required this.quantity,
  });

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: double.tryParse(map['price'].toString()) ?? 0.0,
      calories: int.tryParse(map['calories'].toString()) ?? 0,
      quantity: int.tryParse(map['quantity'].toString()) ?? 0,
    );
  }
}
