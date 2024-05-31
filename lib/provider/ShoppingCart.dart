import 'package:flutter/material.dart';
import '../model/Item.dart';

class ShoppingCart with ChangeNotifier {
  final List<Item> _shoppingList = [];
  double totalPrice = 0;
  List<Item> get cart => _shoppingList;

  void addItem(Item item) {
    _shoppingList.add(item);
   totalPrice = totalPrice + item.price;
    notifyListeners();
  }

  void removeAll() {
    _shoppingList.clear();
    totalPrice = 0;
    notifyListeners();
  }

  void removeItem(String name) {
    for (int i = 0; i < _shoppingList.length; i++) {
      if (_shoppingList[i].name == name) {
        totalPrice = totalPrice - _shoppingList[i].price;
        _shoppingList.remove(_shoppingList[i]);
        break;
      }
    }
    notifyListeners();
  }
}
