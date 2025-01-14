import 'package:flutter/material.dart';

class WishlistProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _wishlist = [];

  List<Map<String, dynamic>> get wishlist => _wishlist;

  void addToWishlist(Map<String, dynamic> item) {
    _wishlist.add(item);
    notifyListeners();
  }

  void removeFromWishlist(Map<String, dynamic> item) {
    _wishlist.remove(item);
    notifyListeners();
  }

  bool isInWishlist(Map<String, dynamic> item) {
    return _wishlist.contains(item);
  }
}
