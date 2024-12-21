import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/cart_item.dart';
// Assuming you have a CartItem model

class OrdersProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => [..._orders]; // Expose a copy of the orders list

  void addOrder(List<CartItem> cartItems, double totalAmount) {
    final newOrder = Order(
      id: DateTime.now().toString(),
      items: cartItems,
      totalAmount: totalAmount,
      date: DateTime.now(),
    );
    _orders.insert(0, newOrder); // Add the new order at the top
    notifyListeners(); // Notify widgets to rebuild
  }
}
