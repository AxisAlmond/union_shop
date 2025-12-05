import 'package:flutter/material.dart';
import 'package:union_shop/widgets/head.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/models/productcard.dart';
import 'package:union_shop/models/collection.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  String _selectedFilter = 'All products';

  List<Product> _getFilteredProducts(Collection? collection) {
    final products = collection?.products ?? [];

    if (_selectedFilter == 'Popular') {
      return products.where((product) => product.isPopular).toList();
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final collection =
        ModalRoute.of(context)?.settings.arguments as Collection?;
    final filteredProducts = _getFilteredProducts(collection);

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
                  Text(
                    collection?.title ?? 'Collection',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (collection?.description != null &&
                      collection!.description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      collection.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),

                  // Filter dropdown
                  Row(
                    children: [
                      const Text(
                        'Filter: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
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
                        itemCount: filteredProducts.length,
                        itemBuilder: (context, index) {
                          final product = filteredProducts[index];
                          return ProductCard(product: product);
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
