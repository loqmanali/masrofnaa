import 'package:flutter/material.dart';

class Masrofna with ChangeNotifier {
  // Fields
  int _id;
  String _product;
  double _price;
  double _noItems;
  double _total;
  double _weekMoney;

  List<String> myList = [
    'الأول',
    'الثاني',
    'الثالث',
    'الرابع',
  ];

  List<String> appBarTitle = [
    'الإسبوع الأول',
    'الإسبوع الثاني',
    'الإسبوع الثالث',
    'الإسبوع الربع',
  ];

  // Named Constructor
  Masrofna.fromMyMap(Map<String, dynamic> myData) {
    _id = myData['id'];
    _product = myData['product'];
    _price = myData['price'];
    _noItems = myData['noItems'];
    _total = myData['total'];
    _weekMoney = myData['weekMoney'];
  }

  // Getter
  int get id => _id;
  String get product => _product;
  double get price => _price;
  double get noItems => _noItems;
  double get total => _total;
  double get weekMoney => _weekMoney;

  // Methods
  masronfa(dynamic objec) async {
    _id = await objec['id'];
    _product = await objec['product'];
    _price = await objec['price'];
    _noItems = await objec['noItems'];
    _total = await objec['total'];
    _weekMoney = await objec['weekMoney'];
  }

  // Constructor
  Masrofna(dynamic objec) {
    _id = objec['id'];
    _product = objec['product'];
    _price = objec['price'];
    _noItems = objec['noItems'];
    _total = objec['total'];
    _weekMoney = objec['weekMoney'];
  }

  Map<String, dynamic> convertToMap() {
    return {
      'id': _id,
      'product': _product,
      'price': _price,
      'noItems': _noItems,
      'total': _total,
      'weekMoney': _weekMoney,
    };
  }

  notifyListeners();
}
