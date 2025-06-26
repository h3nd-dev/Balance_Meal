import 'food_item.dart';

class FoodCategory {
  final String category;
  final List<FoodItem> foods;

  FoodCategory({required this.category, required this.foods});

  factory FoodCategory.fromMap(Map<String, dynamic> map) {
    return FoodCategory(
      category: map['category'] ?? '',
      foods: (map['foods'] as List)
          .map((item) => FoodItem.fromMap(item))
          .toList(),
    );
  }
}
