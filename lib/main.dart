import 'package:flutter/material.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/aboutus_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/productcard.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/head.dart';
import 'package:union_shop/repositories/collection_repository.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: HomeScreen(),
      initialRoute: '/',
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutUs(),
        '/collections': (context) => const Collections(),
        '/collection': (context) => const CollectionPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Product data for Featured section - pulled from repository
  List<Product> get _featuredProducts {
    return allCollections
        .expand((collection) => collection.products)
        .where((product) => product.isPopular)
        .take(4)
        .toList();
  }

  // Product data for New Arrivals section
  final List<Product> _newArrivals = [
    Product(
      title: 'Summer T-Shirt',
      price: 3.00,
      imagePath: 'assets/images/fridge-magnet.png',
      isPopular: false,
      description: 'Perfect for summer wear',
    ),
    Product(
      title: 'Winter Jacket',
      price: 45.00,
      imagePath: 'assets/images/jack.jpg',
      isPopular: true,
      description: 'Warm and cozy jacket',
    ),
    Product(
      title: 'Writing Pens',
      price: 5.00,
      imagePath: 'assets/images/pen.png',
      description: 'Casual everyday shirt',
    ),
    Product(
      title: 'Athletic Headband',
      price: 40.00,
      imagePath: 'assets/images/headband.png',
      isPopular: true,
      description: 'Perfect for workouts',
    ),
  ];

  // Product data for Best Sellers section - pulled from repository
  List<Product> get _bestSellers {
    return allCollections
        .expand((collection) => collection.products)
        .where((product) => product.isPopular)
        .skip(0)
        .take(4)
        .toList();
  }

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Head(),
            // Hero Section
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/hoodie.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                  // Content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Fashion Feel',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Checkout our latest clothing!",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: placeholderCallbackForButtons,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Text(
                            'BROWSE PRODUCTS',
                            style: TextStyle(fontSize: 14, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Featured Products Section
            _buildProductSection(
              context,
              'FEATURED PRODUCTS',
              _featuredProducts,
            ),

            // New Arrivals Section
            _buildProductSection(
              context,
              'NEW ARRIVALS',
              _newArrivals,
            ),

            // Best Sellers Section
            _buildProductSection(
              context,
              'BEST SELLERS',
              _bestSellers,
            ),

            // Footer
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection(
    BuildContext context,
    String title,
    List<Product> products,
  ) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 48),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 2;
                if (constraints.maxWidth < 600) crossAxisCount = 1;
                if (constraints.maxWidth > 1200) crossAxisCount = 4;

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 48,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: products[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
