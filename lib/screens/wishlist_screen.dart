import '/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wishlist_provider.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishlistItems = wishlistProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wishlist'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              wishlistProvider.clearWishlist();
            },
          ),
        ],
      ),
      body: wishlistItems.isEmpty
          ? const Center(child: Text("Your wishlist is empty!"))
          : ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          final product = wishlistItems[index];

          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            leading: Image.network(product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () {
                wishlistProvider.removeItem(product.id);
              },
            ),
            onTap: () {
              // Navigate to the product details screen
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ));
            },
          );
        },
      ),
    );
  }
}
