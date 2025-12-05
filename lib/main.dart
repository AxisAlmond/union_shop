import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:union_shop/pages/product_page.dart';
import 'package:union_shop/pages/aboutus_page.dart';
import 'package:union_shop/pages/collections_page.dart';
import 'package:union_shop/pages/collection_page.dart';
import 'package:union_shop/pages/authentication_page.dart';
import 'package:union_shop/pages/signup_page.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/widgets/productcard.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/head.dart';
import 'package:union_shop/repositories/collection_repository.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '/');
        final pathSegments = uri.pathSegments;

        // Home route: /
        if (pathSegments.isEmpty) {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }

        // About route: /about
        if (pathSegments.length == 1 && pathSegments[0] == 'about') {
          return MaterialPageRoute(builder: (_) => const AboutUs());
        }

        // Login route: /login
        if (pathSegments.length == 1 && pathSegments[0] == 'login') {
          return MaterialPageRoute(builder: (_) => const AuthenticationPage());
        }

        // Signup route: /signup
        if (pathSegments.length == 1 && pathSegments[0] == 'signup') {
          return MaterialPageRoute(builder: (_) => const SignupPage());
        }

        // Collections list route: /collections
        if (pathSegments.length == 1 && pathSegments[0] == 'collections') {
          return MaterialPageRoute(builder: (_) => const Collections());
        }

        // Cart route: /cart
        if (pathSegments.length == 1 && pathSegments[0] == 'cart') {
          return MaterialPageRoute(builder: (_) => const CartPage());
        }

        // Product detail route (fallback): /product
        if (pathSegments.length == 1 && pathSegments[0] == 'product') {
          return MaterialPageRoute(
            builder: (_) => const ProductPage(),
            settings: settings,
          );
        }

        // Collection detail route: /collections/{collectionId}
        if (pathSegments.length == 2 && pathSegments[0] == 'collections') {
          final collectionId = pathSegments[1];
          final collection = getCollectionById(collectionId);

          if (collection != null) {
            return MaterialPageRoute(
              builder: (_) => const CollectionPage(),
              settings:
                  RouteSettings(name: settings.name, arguments: collection),
            );
          }
        }

        // Product detail route: /collections/{collectionId}/{productTitle}
        if (pathSegments.length == 3 && pathSegments[0] == 'collections') {
          final collectionId = pathSegments[1];
          final productTitle = Uri.decodeComponent(pathSegments[2]);

          final collection = getCollectionById(collectionId);
          final product = collection?.products.firstWhere(
            (p) =>
                p.title.toLowerCase().replaceAll(' ', '-') ==
                productTitle.toLowerCase(),
            orElse: () => collection.products.first,
          );

          if (product != null) {
            return MaterialPageRoute(
              builder: (_) => const ProductPage(),
              settings: RouteSettings(name: settings.name, arguments: product),
            );
          }
        }

        // 404 fallback
        return MaterialPageRoute(builder: (_) => HomeScreen());
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
      title: 'Fridge Magnet',
      price: 3.00,
      imagePath: 'assets/images/fridge-magnet.png',
      description: 'The UoP logo as a magnet',
    ),
    Product(
      title: 'Winter Jacket',
      price: 45.00,
      imagePath: 'assets/images/jacket.png',
      isPopular: true,
      description: 'Warm and cozy jacket',
      availableSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
    ),
    Product(
      title: 'Writing Pens',
      price: 5.00,
      imagePath: 'assets/images/pen.png',
      description: 'UoP logo writing pen',
    ),
    Product(
      title: 'Athletic Headband',
      price: 40.00,
      imagePath: 'assets/images/headband.png',
      isPopular: true,
      description: 'Perfect for workouts',
      availableSizes: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
      availableColors: ['Black', 'Grey'],
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
                          onPressed: () {
                          Navigator.pushNamed(context, '/collections/apparel');
                          },
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
              null,
            ),

            // New Arrivals Section
            _buildProductSection(
              context,
              'NEW ARRIVALS',
              _newArrivals,
              null, // These don't belong to a specific collection
            ),

            // Best Sellers Section
            _buildProductSection(
              context,
              'BEST SELLERS',
              _bestSellers,
              null,
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
    String? collectionId, // Add this parameter
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
                      return ProductCard(
                        product: products[index],
                        collectionId: collectionId,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
