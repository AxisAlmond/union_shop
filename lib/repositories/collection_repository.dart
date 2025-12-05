import 'package:union_shop/models/collection.dart';
import 'package:union_shop/models/product.dart';

final List<Collection> allCollections = [
  Collection(
    id: 'apparel',
    title: 'Clothing Collection',
    description: 'Stylish clothing for every occasion',
    products: [
      Product(
        title: 'Classic Hoodie',
        price: 35.00,
        imagePath: 'assets/images/hoodie.jpg',
        isPopular: true,
        description: 'A stylish hoodie for all sizes',
      ),
      Product(
        title: 'Premium Polo Shirt',
        price: 25.00,
        imagePath: 'assets/images/polo.jpg',
        isPopular: true,
        description: 'A polo shirt which comes in multiple colours',
      ),
      // ... more products
    ],
  ),
  Collection(
    id: 'sales',
    title: 'Sales Collection',
    description: 'Limited time offers and discounts',
    products: [
      Product(
        title: 'Discounted Polo',
        price: 15.00,
        imagePath: 'assets/images/polo.jpg',
        isPopular: true,
        description: 'Was £25, now £15!',
      ),
      // ... more sale products
    ],
  ),
];

// Helper function to get collection by id
Collection? getCollectionById(String id) {
  try {
    return allCollections.firstWhere((collection) => collection.id == id);
  } catch (e) {
    return null;
  }
}