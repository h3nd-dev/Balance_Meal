import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../model/food_item.dart';

class OrderService extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> handleConfirm(
      BuildContext context,
      List<FoodItem> selectedItems,
      ) async {
    _setLoading(true);

    final url = Uri.parse("https://uz8if7.buildship.run/placeOrder");

    final payload = {
      "items": selectedItems.map((item) => {
        "name": item.name,
        "total_price": (item.price * item.quantity).toInt(),
        "quantity": item.quantity,
        "ordered_at": DateTime.now().toIso8601String()
      }).toList()
    };

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      final isSuccess =
          response.statusCode == 200 && response.body.contains('true');

      if (isSuccess) {
        final box = await Hive.openBox('orders');
        await box.put('last_order', payload);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Order confirmed successfully!"),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Failed to confirm order. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      log(e.toString());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      _setLoading(false);
    }
  }
}
