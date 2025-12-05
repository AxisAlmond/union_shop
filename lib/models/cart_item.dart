import 'package:union_shop/models/product.dart';

class CartItem {
  final Product product;
  int quantity;
  final String? selectedSize;
  final String? selectedColor;

  CartItem({
    required this.product,
    required this.quantity,
    this.selectedSize,
    this.selectedColor,
  });

  // Check if two cart items are the same (same product, size, and color)
  bool isSameItem(CartItem other) {
    return product.title == other.product.title &&
        selectedSize == other.selectedSize &&
        selectedColor == other.selectedColor;
  }

  // Calculate the total price for this cart item
  double get totalPrice => product.price * quantity;

  // Create a copy with updated quantity
  CartItem copyWith({
    Product? product,
    int? quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
    );
  }
}
