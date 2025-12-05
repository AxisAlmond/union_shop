import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/productcard.dart';
import 'package:union_shop/models/product.dart';

void main() {
  Widget _wrap(Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 200,
          height: 300,
          child: child,
        ),
      ),
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Navigated to ${settings.name}')),
          ),
        );
      },
    );
  }

  group('ProductCard Widget Tests', () {
    testWidgets('displays product title and regular price', (tester) async {
      final product = Product(
        title: 'Test Hoodie',
        price: 25.00,
        imagePath: 'assets/images/hoodie.jpg',
        description: 'A test hoodie',
      );

      await tester.pumpWidget(_wrap(ProductCard(product: product)));

      expect(find.text('Test Hoodie'), findsOneWidget);
      expect(find.text('£25.00'), findsOneWidget);
    });

    testWidgets('displays sale price with strikethrough original price', (tester) async {
      final product = Product(
        title: 'Sale Item',
        price: 15.00,
        imagePath: 'assets/images/item.jpg',
        description: 'On sale',
        isSale: true,
        originalPrice: 30.00,
      );

      await tester.pumpWidget(_wrap(ProductCard(product: product)));

      expect(find.text('Sale Item'), findsOneWidget);
      expect(find.text('£30.00'), findsOneWidget); // Original price
      expect(find.text('£15.00'), findsOneWidget); // Sale price
    });

    testWidgets('shows error icon when image fails to load', (tester) async {
      final product = Product(
        title: 'No Image Product',
        price: 10.00,
        imagePath: 'invalid/path.jpg',
        description: 'desc',
      );

      await tester.pumpWidget(_wrap(ProductCard(product: product)));

      // Should show error icon
      expect(find.byIcon(Icons.image_not_supported), findsOneWidget);
    });

    testWidgets('navigates to collection product route when collectionId provided', (tester) async {
      final product = Product(
        title: 'Classic Hoodie',
        price: 35.00,
        imagePath: 'assets/images/hoodie.jpg',
        description: 'A hoodie',
      );

      await tester.pumpWidget(_wrap(
        ProductCard(
          product: product,
          collectionId: 'apparel',
        ),
      ));

      await tester.tap(find.byType(ProductCard));
      await tester.pumpAndSettle();

      // Should navigate to collection-specific route
      expect(find.text('Navigated to /collections/apparel/classic-hoodie'), findsOneWidget);
    });

    testWidgets('navigates to fallback product route when no collectionId', (tester) async {
      final product = Product(
        title: 'Standalone Product',
        price: 20.00,
        imagePath: 'assets/images/product.jpg',
        description: 'A product',
      );

      await tester.pumpWidget(_wrap(
        SizedBox(
          width: 200,
          height: 300,
          child: ProductCard(product: product),
        ),
      ));

      await tester.tap(find.byType(GestureDetector).first, warnIfMissed: false);
      await tester.pumpAndSettle();

      // Should navigate to fallback route
      expect(find.text('Navigated to /product'), findsOneWidget);
    });

    testWidgets('handles product title with spaces in slug', (tester) async {
      final product = Product(
        title: 'Premium Polo Shirt',
        price: 25.00,
        imagePath: 'assets/images/polo.jpg',
        description: 'A polo',
      );

      await tester.pumpWidget(_wrap(
        SizedBox(
          width: 200,
          height: 300,
          child: ProductCard(
            product: product,
            collectionId: 'apparel',
          ),
        ),
      ));

      await tester.tap(find.byType(GestureDetector).first, warnIfMissed: false);
      await tester.pumpAndSettle();

      // Slug should replace spaces with hyphens
      expect(find.text('Navigated to /collections/apparel/premium-polo-shirt'), findsOneWidget);
    });

    testWidgets('truncates long product titles to 2 lines', (tester) async {
      final product = Product(
        title: 'Very Long Product Title That Should Be Truncated After Two Lines',
        price: 15.00,
        imagePath: 'assets/images/product.jpg',
        description: 'desc',
      );

      await tester.pumpWidget(_wrap(ProductCard(product: product)));

      final textWidget = tester.widget<Text>(find.text(product.title));
      expect(textWidget.maxLines, 2);
    });
  });
}
