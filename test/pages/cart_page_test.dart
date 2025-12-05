import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/pages/cart_page.dart';
import 'package:union_shop/repositories/cart_repository.dart';

void main() {
  final repo = CartRepository.instance;

  Product _product({
    String title = 'Test Product',
    double price = 10.0,
  }) {
    return Product(
      title: title,
      price: price,
      imagePath: 'assets/images/placeholder.png',
      description: 'desc',
    );
  }

  setUp(() {
    repo.clearCart();
  });

  Widget _wrap(Widget child) {
    return MediaQuery(
      data: const MediaQueryData(size: Size(500, 1600)),
      child: MaterialApp(
        home: SizedBox(
          width: 500,
          height: 1600,
          child: child,
        ),
      ),
    );
  }

  testWidgets('shows empty state with CTA', (tester) async {
    await tester.pumpWidget(_wrap(const CartPage()));
    await tester.pumpAndSettle();

    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('Continue Shopping'), findsOneWidget);
  });

  testWidgets('shows items and subtotal', (tester) async {
    repo.addItem(product: _product(price: 5.0), quantity: 2, selectedSize: 'M', selectedColor: 'Red');
    repo.addItem(product: _product(title: 'P2', price: 3.0), quantity: 1);

    await tester.pumpWidget(_wrap(const CartPage()));
    await tester.pumpAndSettle();

    expect(find.text('Shopping Cart'), findsOneWidget);
    expect(find.textContaining('item'), findsWidgets);
    expect(find.text('\$10.00'), findsWidgets); // 5 * 2
    expect(find.text('\$3.00'), findsWidgets);
    expect(find.text('\$13.00'), findsWidgets); // subtotal

    // Remove item via delete icon shows snackbar
    await tester.tap(find.byIcon(Icons.delete_outline).first, warnIfMissed: false);
    await tester.pump();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
