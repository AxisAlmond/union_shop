import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/widgets/head.dart';
import 'package:union_shop/repositories/cart_repository.dart';
import 'package:union_shop/models/product.dart';

void main() {
  final repo = CartRepository.instance;

  setUp(() {
    repo.clearCart();
  });

  Widget wrap({double width = 500}) {
    return MediaQuery(
      data: MediaQueryData(size: Size(width, 800)),
      child: const MaterialApp(
        home: Scaffold(
          body: Head(),
        ),
      ),
    );
  }

  group('Head Widget Tests', () {
    testWidgets('displays top banner with UNION SHOP text', (tester) async {
      await tester.pumpWidget(wrap());
      expect(find.text('UNION SHOP'), findsOneWidget);
    });

    testWidgets('displays all icon buttons', (tester) async {
      await tester.pumpWidget(wrap());
      
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
      expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });

    testWidgets('displays navigation links on desktop width', (tester) async {
      await tester.pumpWidget(wrap(width: 1200));
      
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shopping'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Login/Sign up'), findsOneWidget);
    });

    testWidgets('hides navigation links on mobile width', (tester) async {
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(size: Size(500, 800)),
          child: MaterialApp(
            home: Scaffold(body: Head()),
          ),
        ),
      );
      
      // Nav links should not be visible on mobile
      expect(find.text('Home'), findsNothing);
      expect(find.text('Shopping'), findsNothing);
    });

    testWidgets('shows mobile menu when menu icon tapped', (tester) async {
      await tester.pumpWidget(
        const MediaQuery(
          data: MediaQueryData(size: Size(500, 800)),
          child: MaterialApp(
            home: Scaffold(body: Head()),
          ),
        ),
      );
      
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      
      // Should show bottom sheet with menu items
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Shopping'), findsOneWidget);
      expect(find.text('SALE!'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Login/Sign up'), findsOneWidget);
    });

    testWidgets('cart badge shows item count when items exist', (tester) async {
      // Add items to cart
      repo.addItem(
        product: Product(
          title: 'Test',
          price: 10.0,
          imagePath: 'test.png',
          description: 'desc',
        ),
        quantity: 2,
      );

      await tester.pumpWidget(wrap());
      await tester.pumpAndSettle();
      
      // Badge should show count
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('cart badge hidden when cart is empty', (tester) async {
      await tester.pumpWidget(wrap());
      await tester.pumpAndSettle();
      
      // No badge should be visible
      expect(find.text('0'), findsNothing);
    });

    testWidgets('logo displays with error fallback', (tester) async {
      await tester.pumpWidget(wrap());
      
      // Should have logo or error fallback
      expect(find.byType(Image), findsWidgets);
    });
  });
}
