import 'package:flutter/material.dart';
import 'package:four/models/Product.dart';

class Carts with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  double get total {
    return calculTotal();
  }

  double calculTotal() {
    double total = 0.0;
    _items.forEach((element) {
      total += element.price;
    });

    return total;
  }

  void addItem({Product? product}) {
    if (!_items.contains(product)) {
      _items.add(product!);
    }
    notifyListeners();
  }

  Product? findById(String produitID) {
    return _items.firstWhere((element) => element.id == produitID);
  }

  void deleteById(String productId) async {
    _items.removeWhere((element) => element.id == productId);
    notifyListeners();
  }
}
