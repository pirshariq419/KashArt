class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category; // Add category field

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category, // Add category parameter
  });
}

final List<Product> dummyProducts = [
  Product(
    id: 'p1',
    name: 'T-Shirt',
    description: 'A stylish t-shirt.',
    price: 19.99,
    imageUrl: 'https://drive.google.com/uc?id=1KJui2wM_2HoLhK3TQtvTBuJCOQZOU_dd',
    category: 'Clothing', // Add category
  ),
  Product(
    id: 'p2',
    name: 'Shoes',
    description: 'Comfortable running shoes.',
    price: 59.99,
    imageUrl: 'https://drive.google.com/uc?id=1QVNbNEPVGlWLRv_zHwYQAV9imAMYsZsn',
    category: 'Fashion', // Add category
  ),
  Product(
    id: 'p3',
    name: 'Smartphone',
    description: 'A high-end smartphone with a powerful camera.',
    price: 179.99,
    imageUrl: 'https://drive.google.com/uc?id=1qPZLt_9HxEce79reHGZPcLNhIqtSF0XH',
    category: 'Electronics', // Add category
  ),
  Product(
    id: 'p4',
    name: 'Camera',
    description: 'A professional DSLR camera for photographers.',
    price: 899.99,
    imageUrl: 'https://drive.google.com/uc?id=1V7y1RP6tTN1j2u1236f2ypK1yZDY3dm6',
    category: 'Electronics', // Add category
  ),
  Product(
    id: 'p5',
    name: 'Laptop',
    description: 'A powerful laptop for work and gaming.',
    price: 699.99,
    imageUrl: 'https://drive.google.com/uc?id=1yZtNIP189Ba8_v5ggYXEznT1TTPJ0wOU',
    category: 'Electronics', // Add category
  ),
  Product(
    id: 'p6',
    name: 'Tablet',
    description: 'A sleek tablet with a vibrant display.',
    price: 399.99,
    imageUrl: 'https://drive.google.com/uc?id=1zcaBrNZbt9AxahWqbBNjhNprUsqsjL3C',
    category: 'Electronics', // Add category
  ),
  Product(
    id: 'p7',
    name: 'Watch',
    description: 'A stylish and durable smartwatch.',
    price: 99.99,
    imageUrl: 'https://drive.google.com/uc?id=1zmTFCDe-zyGWrkr_aLe9fukBeSLL7TJr',
    category: 'Fashion', // Add category
  ),
  Product(
    id: 'p8',
    name: 'Headphones',
    description: 'Noise-canceling headphones with excellent sound quality.',
    price: 59.99,
    imageUrl: 'https://drive.google.com/uc?id=1qNOKn9aHZOPet6XNHSr8iYI2OPgotrL7',
    category: 'Electronics', // Add category
  ),
  Product(
    id: 'p9',
    name: 'Bag',
    description: 'A trendy leather bag for everyday use.',
    price: 39.99,
    imageUrl: 'https://drive.google.com/uc?id=1M_QdumhBaLmqydinBn-k2Xwnia8u5Ddt',
    category: 'Fashion', // Add category
  ),
  Product(
    id: 'p10',
    name: 'Notebook',
    description: 'High-quality notebook.',
    price: 14.99,
    imageUrl: 'https://drive.google.com/uc?id=1l2L3-qLCbyu7g79_2y_bVbvdblL8UdbZ',
    category: 'Clothing', // Add category
  ),
  Product(
    id: 'p11',
    name: 'Bed',
    description: 'Luxury Beds',
    price: 99.99,
    imageUrl: 'https://drive.google.com/uc?id=1hu4mP7HDLm5hhygst_AdKig6GfjxuxJ2',
    category: 'Home and Furniture', // Add category
  ),
  Product(
    id: 'p12',
    name: 'Pants',
    description: 'Premium high-class pants for men',
    price: 49.99,
    imageUrl: 'https://drive.google.com/uc?id=1phMxQuj3SHzHM4oknHrDqd3W-6Xo1ByA',
    category: 'Clothing', // Add category
  ),
];
