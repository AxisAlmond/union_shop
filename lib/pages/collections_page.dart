import 'package:flutter/material.dart';
import 'package:union_shop/widgets/footer.dart';
import 'package:union_shop/widgets/head.dart';
import 'package:union_shop/models/collectioncard.dart';

class Collections extends StatelessWidget {
  const Collections({super.key});

  void _navigateToCollection(BuildContext context, String collectionName) {
    // Only "Clothing" is functional; navigate to a real collection detail page
    if (collectionName == 'Clothing') {
      Navigator.pushNamed(context, '/collection/clothing');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$collectionName collection coming soon')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Head(),
            // Collections content section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Collections',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Responsive columns: 3 on wide screens, 2 on tablets, 1 on mobile
                      int crossAxisCount = 3;
                      if (constraints.maxWidth < 900) crossAxisCount = 2;
                      if (constraints.maxWidth < 600) crossAxisCount = 1;

                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: crossAxisCount,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.85,
                        children: [
                          CollectionCard(
                            title: 'Clothing',
                            imagePath: 'assets/images/hoodie.jpg',
                            onTap: () => _navigateToCollection(context, 'Clothing'),
                          ),
                          CollectionCard(
                            title: 'Accessories',
                            imagePath: 'assets/images/coming-soon.jpg',
                            onTap: () => _navigateToCollection(context, 'Accessories'),
                          ),
                          CollectionCard(
                            title: 'Stationery',
                            imagePath: 'assets/images/coming-soon.jpg',
                            onTap: () => _navigateToCollection(context, 'Stationery'),
                          ),
                          CollectionCard(
                            title: 'Gifts',
                            imagePath: 'assets/images/coming-soon.jpg',
                            onTap: () => _navigateToCollection(context, 'Gifts'),
                          ),
                          CollectionCard(
                            title: 'Home & Living',
                            imagePath: 'assets/images/coming-soon.jpg',
                            onTap: () => _navigateToCollection(context, 'Home & Living'),
                          ),
                          CollectionCard(
                            title: 'Sale Items',
                            imagePath: 'assets/images/coming-soon.jpg',
                            onTap: () => _navigateToCollection(context, 'Sale Items'),
                          ),
                        ],
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