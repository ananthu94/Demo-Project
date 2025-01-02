import 'package:flutter/foundation.dart';
import 'package:ecommerce_demo/models/productmodel/productmodel.dart';

// import 'package:flutter/material.dart';

// class CartProvider extends ChangeNotifier {
//   List<Map<String, dynamic>> _cartItems = [];

//   List<Map<String, dynamic>> get cartItems => _cartItems;

//   void addToCart(Map<String, dynamic> item) {
//     _cartItems.add(item);
//     notifyListeners();
//   }

//   void removeFromCart(Map<String, dynamic> item) {
//     _cartItems.remove(item);
//     notifyListeners();
//   }

//   void clearCart() {
//     _cartItems.clear();
//     notifyListeners();
//   }

//   void updateQuantity(Map<String, dynamic> item, int quantity) {
//     int index = _cartItems.indexOf(item);
//     if (index != -1) {
//       _cartItems[index]['quantity'] = quantity;
//       notifyListeners();
//     }
//   }
// }

class CartModel extends ChangeNotifier {
  final Map<Product, int> _cartItems = {};

  // Get the list of items in the cart
  List<MapEntry<Product, int>> get cartItems => _cartItems.entries.toList();

  // Add a product to the cart
  void addToCart(Product product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  // Remove a product from the cart
  void removeFromCart(Product product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        _cartItems[product] = _cartItems[product]! - 1;
      } else {
        _cartItems.remove(product);
      }
    }
    notifyListeners();
  }

  // Clear all items in the cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // Get total items in the cart
  int get totalItems => _cartItems.values.fold(0, (sum, qty) => sum + qty);

  // Calculate the total price of the cart
  double get totalPrice => _cartItems.entries.fold(0, (sum, entry) {
        return sum + double.parse(entry.key.price.substring(1)) * entry.value;
      });
}
