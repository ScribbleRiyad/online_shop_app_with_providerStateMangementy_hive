import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int activePage = 0;
  int get activePager => activePage;
  set activePager(int newIndex) {
    activePage = newIndex;
    notifyListeners();
  }
}
