import 'package:flutter/material.dart';

// Helper function for currency formatting
String formatCurrency(double amount) {
  return "\$${amount.toStringAsFixed(2)}";
}

// Helper function for validating email format
bool isValidEmail(String email) {
  final RegExp regex = RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$');
  return regex.hasMatch(email);
}

// Helper function to show a simple snackbar
void showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

// Helper function for navigating to a new screen
void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => screen),
  );
}

// Helper function to validate password (length, special characters, etc.)
bool isValidPassword(String password) {
  return password.length >= 6;
}

// Helper function to validate if cart is empty
bool isCartEmpty(List cartItems) {
  return cartItems.isEmpty;
}

// Helper function to calculate the total price of cart items
double calculateTotalPrice(List cartItems) {
  double total = 0.0;
  for (var item in cartItems) {
    total += item.price * item.quantity;
  }
  return total;
}

// Helper function to format a product name (capitalize first letter)
String formatProductName(String productName) {
  return productName[0].toUpperCase() + productName.substring(1).toLowerCase();
}

// Helper function to show confirmation dialog for checkout
Future<bool> showCheckoutConfirmation(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Confirm Checkout"),
      content: const Text("Are you sure you want to proceed with checkout?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text("Proceed"),
        ),
      ],
    ),
  ) ??
      false;
}
