import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class FavouriteNotifier extends ChangeNotifier {
  final _favBox = Hive.box("fav_box");
  List<dynamic> _ids = [];
  List<dynamic> _favourite = [];
  List<dynamic> _favItem = [];
  List<dynamic> get ids => _ids;
  set ids(List<dynamic> newIds) {
    _ids = newIds;
    notifyListeners();
  }

  List<dynamic> get favourite => _favourite;
  set favourite(List<dynamic> newFavourite) {
    _favourite = newFavourite;
    notifyListeners();
  }

  List<dynamic> get favItem => _favItem;
  set favItem(List<dynamic> newItem) {
    _favItem = newItem;
    notifyListeners();
  }

  getFavourites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item['id'],
      };
    }).toList();
    _favourite = favData.toList();
    _ids = _favourite.map((item) => item['id']).toList();
  }

  Future<void> createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
  }

  getAllData() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();

    _favItem = favData.reversed.toList();
  }

  Future<void> delete(int key) async {
    await _favBox.delete(key);
  }
}
