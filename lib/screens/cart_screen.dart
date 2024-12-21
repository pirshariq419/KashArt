import 'package:ecommerce_app/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../providers/orders_provider.dart';
import '/utils/helpers.dart';  // Import helpers.dart

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key, required List<CartItem> cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.items.values.toList(); // Convert map to list of cart items
    final totalAmount = cartProvider.totalAmount; // Calculate total cart amount

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: cartItems.isEmpty
          ? const Center(
        child: Text(
          "Your cart is empty!",
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.title),
                  subtitle: Text('Quantity: ${cartItem.quantity}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        formatCurrency(cartItem.price * cartItem.quantity), // Use helper function
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          cartProvider.removeItem(cartItem.productId); // Remove item from cart
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: ${formatCurrency(totalAmount)}', // Use helper function
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (cartItems.isEmpty) return; // No action if cart is empty
                    showCheckoutConfirmation(context).then((confirmed) {
                      if (confirmed) {
                        // Proceed with checkout
                        Provider.of<OrdersProvider>(context, listen: false).addOrder(
                          cartItems,
                          totalAmount,
                        );

                        // Clear the cart after order placement
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Order placed successfully!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pushNamed(context, '/orders'); // Navigate to OrderScreen
                      }
                    });
                  },
                  child: const Text('Proceed to Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
