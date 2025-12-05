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
      Product(
        title: 'Standard sweatshirt',
        price: 24.00,
        imagePath: 'assets/images/sweatshirt.png',
        description: 'A sweatshirt for yourself',
      ),
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
        description: 'Was £25.00, now £15.00!',
      ),
      Product(
        title: 'Discounted Mug',
        price: 6.00,
        imagePath: 'assets/images/mug.png',
        isPopular: true,
        description: 'Was £12.00, now £6.00!',
      ),
      Product(
        title: 'Discounted Tie',
        price: 4.50,
        imagePath: 'assets/images/tie.png',
        isPopular: true,
        description: 'Was £9, now £4.50!',
      ),
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