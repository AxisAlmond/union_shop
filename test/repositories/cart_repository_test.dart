import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/models/product.dart';
import 'package:union_shop/repositories/cart_repository.dart';

void main() {
  final repo = CartRepository.instance;

  Product product({
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

  test('addItem merges duplicates and floors quantity at 1', () {
    repo.addItem(product: product(), quantity: 0, selectedSize: 'M', selectedColor: 'Red');
    repo.addItem(product: product(), quantity: 2, selectedSize: 'M', selectedColor: 'Red');

    expect(repo.items.length, 1);
    expect(repo.items.first.quantity, 3);
  });

  test('addItem keeps separate entries for different options', () {
    repo.addItem(product: product(), quantity: 1, selectedSize: 'M', selectedColor: 'Red');
    repo.addItem(product: product(), quantity: 1, selectedSize: 'L', selectedColor: 'Red');
    repo.addItem(product: product(), quantity: 1, selectedSize: 'M', selectedColor: 'Blue');

    expect(repo.items.length, 3);
  });

  test('updateQuantity removes when newQuantity <= 0', () {
    repo.addItem(product: product(), quantity: 1);
    final item = repo.items.first;

    repo.updateQuantity(item, 0);
    expect(repo.items, isEmpty);
  });

  test('removeItemAt ignores out-of-range safely', () {
    repo.addItem(product: product(), quantity: 1);
    repo.removeItemAt(5);
    expect(repo.items.length, 1);
  });

  test('totals compute correctly', () {
    repo.addItem(product: product(price: 5.0), quantity: 2);
    repo.addItem(product: product(title: 'P2', price: 7.5), quantity: 1);

    expect(repo.getTotalItems(), 3);
    expect(repo.getTotalPrice(), closeTo(17.5, 0.0001));
  });

  test('addItemBack restores at index when possible', () {
    repo.addItem(product: product(), quantity: 1);
    final removed = repo.items.first;
    repo.removeItemAt(0);

    repo.addItemBack(removed, 0);
    expect(repo.items.length, 1);
    expect(repo.items.first.product.title, 'Test Product');
  });
}
