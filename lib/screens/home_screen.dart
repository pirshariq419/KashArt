import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../screens/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Search and filter state
  String searchQuery = '';
  String selectedCategory = 'All Categories';

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemCount = cartProvider.cartItems.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'KashArt',
          style: TextStyle(
            fontSize: 28, // Larger font size
            fontWeight: FontWeight.bold, // Bold font weight
            color: Colors.black54, // Eye-catching color
            fontFamily: 'Pacifico', // Custom font (Make sure to include this in your pubspec.yaml)
            letterSpacing: 2.0, // Spacing between letters
          ),
        ),

        actions: [
          // Cart icon with item count (red circle)
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.shopping_cart, size: 30),
                if (cartItemCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartItemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(cartItems: cartProvider.cartItems),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange[50],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text(
                'Categories',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ..._buildCategoryList(),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            _buildCategorySelector(),
            const SizedBox(height: 10),
            _buildPromoBanner(),
            const SizedBox(height: 16),
            _buildProductGrid(),
          ],
        ),
      ),
    );
  }

  // Search Bar Widget
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onChanged: (query) {
          setState(() {
            searchQuery = query;
          });
        },
        decoration: InputDecoration(
          hintText: 'Search for products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  // Category Selector Widget
  Widget _buildCategorySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Category: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        DropdownButton<String>(
          value: selectedCategory,
          items: <String>['All Categories', 'Grocery', 'Mobiles', 'Appliances', 'Fashion', 'Home and Furniture', 'Electronics', 'Clothing', 'Beauty and Health']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue!;
            });
          },
        ),
      ],
    );
  }

  // Promo Banner Widget
  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Limited Time Offer! 20% off on all products!',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }

  // Build the Product Grid
  Widget _buildProductGrid() {
    final filteredProducts = dummyProducts.where((product) {
      final categoryMatch = selectedCategory == 'All Categories' || product.category == selectedCategory;
      final searchMatch = product.name.toLowerCase().contains(searchQuery.toLowerCase());
      return categoryMatch && searchMatch;
    }).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Adjust grid columns
        childAspectRatio: 0.90, // Aspect ratio of the items
        mainAxisSpacing: 7,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product),
              ),
            );
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build the category list for the Drawer
  List<Widget> _buildCategoryList() {
    List<String> categories = [
      'Grocery', 'Mobiles', 'Appliances', 'Fashion', 'Home and Furniture', 'Electronics', 'Clothing', 'Beauty and Health'
    ];

    return categories.map((category) {
      return ListTile(
        leading: const Icon(Icons.category),
        title: Text(category),
        onTap: () {
          setState(() {
            selectedCategory = category;
          });
          Navigator.pop(context); // Close the drawer after selection
        },
      );
    }).toList();
  }
}
