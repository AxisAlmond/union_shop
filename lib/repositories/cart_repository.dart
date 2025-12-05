import 'package:flutter/material.dart';
import 'package:union_shop/models/cart_item.dart';
import 'package:union_shop/models/product.dart';

class CartRepository extends ChangeNotifier {
  // Singleton pattern
  static final CartRepository _instance = CartRepository._internal();
  factory CartRepository() => _instance;
  static CartRepository get instance => _instance;
  CartRepository._internal();

  // List to store cart items
  final List<CartItem> _items = [];

  // Get all cart items
  List<CartItem> get items => List.unmodifiable(_items);

  // Get total number of items in cart
  int getTotalItems() {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  // Get total price of all items in cart
  double getTotalPrice() {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  // Add item to cart (merges duplicates by incrementing quantity)
  void addItem({
    required Product product,
    required int quantity,
    String? selectedSize,
    String? selectedColor,
  }) {
    // Default to quantity 1 if 0 or less
    final actualQuantity = quantity > 0 ? quantity : 1;

    // Create new cart item
    final newItem = CartItem(
      product: product,
      quantity: actualQuantity,
      selectedSize: selectedSize,
      selectedColor: selectedColor,
    );

    // Check if item already exists in cart
    final existingIndex = _items.indexWhere((item) => item.isSameItem(newItem));

    if (existingIndex != -1) {
      // Item exists, increment quantity
      _items[existingIndex].quantity += actualQuantity;
    } else {
      // Item doesn't exist, add new item
      _items.add(newItem);
    }

    notifyListeners();
  }

  // Remove item from cart
  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  // Remove item by index
  void removeItemAt(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  // Update quantity of a specific item
  void updateQuantity(CartItem item, int newQuantity) {
    final index = _items.indexOf(item);
    if (index != -1) {
      if (newQuantity <= 0) {
        // Remove item if quantity is 0 or less
        _items.removeAt(index);
      } else {
        _items[index].quantity = newQuantity;
      }
      notifyListeners();
    }
  }

  // Clear all items from cart
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  // Add item back (for undo functionality)
  void addItemBack(CartItem item, int index) {
    if (index >= 0 && index <= _items.length) {
      _items.insert(index, item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }
}
