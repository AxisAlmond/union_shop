import 'package:flutter/material.dart';
import 'package:union_shop/widgets/head.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/productcard.dart';
import 'package:union_shop/models/product.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedFilter = 'All products';

  final List<Product> _allProducts = [
    Product(
      title: 'Classic Hoodie',
      price: 35,
      imagePath: 'assets/images/hoodie.jpg',
      isPopular: true,
    ),
    Product(
      title: 'Premium Polo Shirt',
      price: 25,
      imagePath: 'assets/images/polo.jpg',
      isPopular: true,
    ),
    Product(
      title: 'Essential T-Shirt',
      price: 15,
      imagePath: 'assets/images/tshirt.jpg',
      isPopular: false,
    ),
  ];

  List<Product> get _filteredProducts {
    if (_selectedFilter == 'Popular') {
      return _allProducts.where((product) => product.isPopular).toList();
    }
    return _allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Head(),
            // Collection content section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Collection title
                  const Text(
                    'Clothing Collection',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Filter dropdown
                  Row(
                    children: [
                      const Text(
                        'Filter: ',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _selectedFilter,
                        items: const [
                          DropdownMenuItem(
                            value: 'All products',
                            child: Text('All products'),
                          ),
                          DropdownMenuItem(
                            value: 'Popular',
                            child: Text('Popular'),
                          ),
                        ],
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _selectedFilter = value;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Products grid
                  LayoutBuilder(
                    builder: (context, constraints) {
                      int crossAxisCount = 3;
                      if (constraints.maxWidth < 900) crossAxisCount = 2;
                      if (constraints.maxWidth < 600) crossAxisCount = 1;

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        itemCount: _filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = _filteredProducts[index];
                          return ProductCard(
                            title: product.title,
                            price: product.price,
                            imagePath: product.imagePath,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}