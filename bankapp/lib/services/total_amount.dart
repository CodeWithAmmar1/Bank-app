import 'package:flutter/material.dart';

class TotalAmount extends ChangeNotifier {
  int _total = 1000;

  int get total => _total;

  set total(int value) {
    _total = value;
    notifyListeners();
  }
}
