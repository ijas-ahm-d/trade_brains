import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  int _currentBottomIndex = 0;
  int get currentBottomIndex => _currentBottomIndex;

  changeBottom(int index) {
    _currentBottomIndex = index;
    notifyListeners();
  }
}
