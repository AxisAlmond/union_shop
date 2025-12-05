import 'package:flutter_test/flutter_test.dart';
import 'package:union_shop/repositories/collection_repository.dart';

void main() {
  group('CollectionRepository', () {
    test('getCollectionById returns the correct collection', () {
      final apparel = getCollectionById('apparel');
      final sales = getCollectionById('sales');

      expect(apparel, isNotNull);
      expect(apparel!.title, 'Clothing Collection');
      expect(apparel.products.length, 3);

      expect(sales, isNotNull);
      expect(sales!.title, 'Sales Collection');
      expect(sales.products.length, 3);
    });

    test('getCollectionById returns null for unknown id', () {
      final unknown = getCollectionById('unknown');
      expect(unknown, isNull);
    });

    test('collections include expected products and flags', () {
      final sales = getCollectionById('sales');
      expect(sales, isNotNull);

      final discountedMug = sales!.products.firstWhere((p) => p.title == 'Discounted Mug');
      expect(discountedMug.isSale, isTrue);
      expect(discountedMug.originalPrice, 12.00);

      final apparel = getCollectionById('apparel');
      expect(apparel, isNotNull);

      final hoodie = apparel!.products.firstWhere((p) => p.title == 'Classic Hoodie');
      expect(hoodie.availableSizes, containsAll(['XS', 'M', 'XL']));
      expect(hoodie.availableColors, contains('Black'));
    });
  });
}
