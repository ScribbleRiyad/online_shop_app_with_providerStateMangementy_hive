import 'package:flutter/material.dart';

class ProductNotifier extends ChangeNotifier {
  int activePage = 0;
  int get activePager => activePage;
  set activePager(int newIndex) {
    activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> shoeSize = [];
  List<dynamic> get shoeSizes => shoeSize;
  set shoeSizes(List<dynamic> newShoe) {
    shoeSize = newShoe;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < shoeSize.length; i++) {
      if (i == index) {
        shoeSize[i]['isSelected'] = !shoeSize[i]['isSelected'];
      }
    }
    notifyListeners();
  }

  List<String> sizes = [];
  List<String> get shoeSizesList => sizes;
  set shoeSizesList(List<String> newSize) {
    sizes = newSize;
    notifyListeners();
  }
}
