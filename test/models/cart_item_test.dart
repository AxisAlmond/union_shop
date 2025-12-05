import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

void main() {
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

  group('CartItem', () {
    test('isSameItem compares product + size + color', () {
      final base = CartItem(product: _product(), quantity: 1, selectedSize: 'M', selectedColor: 'Red');
      final same = CartItem(product: _product(), quantity: 2, selectedSize: 'M', selectedColor: 'Red');
      final diffSize = CartItem(product: _product(), quantity: 1, selectedSize: 'L', selectedColor: 'Red');
      final diffColor = CartItem(product: _product(), quantity: 1, selectedSize: 'M', selectedColor: 'Blue');
      final diffProduct = CartItem(product: _product(title: 'Other'), quantity: 1, selectedSize: 'M', selectedColor: 'Red');

      expect(base.isSameItem(same), isTrue);
      expect(base.isSameItem(diffSize), isFalse);
      expect(base.isSameItem(diffColor), isFalse);
      expect(base.isSameItem(diffProduct), isFalse);
    });

    test('isSameItem works when size/color are null', () {
      final base = CartItem(product: _product(), quantity: 1);
      final same = CartItem(product: _product(), quantity: 3);
      final withSize = CartItem(product: _product(), quantity: 1, selectedSize: 'M');

      expect(base.isSameItem(same), isTrue);
      expect(base.isSameItem(withSize), isFalse);
    });

    test('totalPrice multiplies price and quantity', () {
      final item = CartItem(product: _product(price: 12.5), quantity: 3);
      expect(item.totalPrice, 37.5);
    });

    test('copyWith overrides provided fields', () {
      final item = CartItem(
        product: _product(),
        quantity: 1,
        selectedSize: 'S',
        selectedColor: 'Red',
      );

      final updated = item.copyWith(quantity: 4, selectedColor: 'Blue');

      expect(updated.product.title, item.product.title);
      expect(updated.quantity, 4);
      expect(updated.selectedSize, 'S');
      expect(updated.selectedColor, 'Blue');
    });
  });
}
