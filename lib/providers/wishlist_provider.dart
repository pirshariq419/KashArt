import 'package:flutter/material.dart';
import '../models/product.dart';

class WishlistProvider with ChangeNotifier {
  // A map to store the wishlist items
  Map<String, Product> _wishlistItems = {};

  // Get all items in the wishlist
  Map<String, Product> get items {
    return {..._wishlistItems};  // Return a copy of the items map
  }

  // Add a product to the wishlist
  void addItem(Product product) {
    if (!_wishlistItems.containsKey(product.id)) {
      _wishlistItems.putIfAbsent(product.id, () => product);
      notifyListeners();  // Notify listeners about the change
    }
  }

  // Remove a product from the wishlist
  void removeItem(String productId) {
    _wishlistItems.remove(productId);
    notifyListeners();  // Notify listeners about the change
  }

  // Clear all items in the wishlist
  void clearWishlist() {
    _wishlistItems.clear();
    notifyListeners();  // Notify listeners about the change
  }
}
