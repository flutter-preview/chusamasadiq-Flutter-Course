import 'package:flutter/material.dart';
import 'package:fluttercourse/models/cart.dart';
import 'package:fluttercourse/resources/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier {
  DBHelper db = DBHelper();

  int _counter = 0;

  int get counter => _counter;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  late Future<List<Cart>> _cart;

  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();

    return _cart;
  }

  void _setPrefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0;
    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    _totalPrice = totalPrice + productPrice;
    _setPrefItem();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice = totalPrice - productPrice;
    _setPrefItem();
    notifyListeners();
  }

  void resetTotalPrice(double productPrice) {
    _totalPrice = 0.0;
    _setPrefItem();
    notifyListeners();
  }

  void resetCounter() {
    _counter = 0;
    _setPrefItem();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItem();
    return _totalPrice;
  }

  void addCounter() {
    _counter++;
    _setPrefItem();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItem();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItem();
    return _counter;
  }
}
