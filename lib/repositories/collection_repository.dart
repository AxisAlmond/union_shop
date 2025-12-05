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
        availableSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        availableColors: ['Black', 'White', 'Navy', 'Grey'],
      ),
      Product(
        title: 'Premium Polo Shirt',
        price: 25.00,
        imagePath: 'assets/images/polo.jpg',
        isPopular: true,
        description: 'A polo shirt which comes in multiple colours',
        availableSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        availableColors: ['Black', 'White', 'Navy', 'Grey'],
      ),
      Product(
        title: 'Standard sweatshirt',
        price: 24.00,
        imagePath: 'assets/images/sweatshirt.png',
        description: 'A sweatshirt for yourself',
        availableSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        availableColors: ['Black', 'White', 'Yellow', 'Magenta'],
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
        isSale: true,
        originalPrice: 25.00,
        availableSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        availableColors: ['Navy', 'Grey'],
      ),
      Product(
        title: 'Discounted Mug',
        price: 6.00,
        imagePath: 'assets/images/mug.png',
        isPopular: true,
        description: 'Was £12.00, now £6.00!',
        isSale: true,
        originalPrice: 12.00,
      ),
      Product(
        title: 'Discounted Tie',
        price: 4.50,
        imagePath: 'assets/images/tie.png',
        isPopular: true,
        description: 'Was £9.00, now £4.50!',
        isSale: true,
        originalPrice: 9.00,
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
