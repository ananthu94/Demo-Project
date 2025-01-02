import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = [];

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Map<String, dynamic> item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void updateQuantity(Map<String, dynamic> item, int quantity) {
    int index = _cartItems.indexOf(item);
    if (index != -1) {
      _cartItems[index]['quantity'] = quantity;
      notifyListeners();
    }
  }
}
