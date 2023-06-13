import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ionicons/ionicons.dart';

import '../../Utils/appStyle.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  final _favBox = Hive.box("fav_box");
  _delete(int key) async {
    await _favBox.delete(key);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> favItem = [];
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

    favItem = favData.reversed.toList();

    return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Favourite Items",
                  style: appStyle(30, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            ListView.builder(
                itemCount: favItem.length,
                padding: const EdgeInsets.only(top: 100),
                itemBuilder: (BuildContext context, int index) {
                  final shoe = favItem[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade100,
                                  blurRadius: 0.3,
                                  spreadRadius: 58,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: CachedNetworkImage(
                                    imageUrl: shoe["imageUrl"],
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Text(
                                        shoe['name'],
                                        style: appStyle(
                                            16, Colors.black, FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        shoe['category'],
                                        style: appStyle(
                                            16, Colors.black, FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            shoe['price'],
                                            style: appStyle(18, Colors.black,
                                                FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Icon(
                                        Ionicons.heart_dislike_outline),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}
