import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int activePage = 0;
  int get activePager => activePage;
  set activePager(int newIndex) {
    activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> shoeSize = [];
  List<dynamic> get ShoeSizes => shoeSize;
  set ShoeSizes(List<dynamic> newShoe) {
    shoeSize = newShoe;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < shoeSize.length; i++) {
      if (i == index) {
        shoeSize[index]['isSelected'] = !shoeSize[index]['isSelected'];
      }
    }
  }
}
