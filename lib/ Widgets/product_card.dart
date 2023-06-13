import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:online_shop/Utils/appStyle.dart';

import '../Const/const.dart';

class ProductCart extends StatefulWidget {
  const ProductCart(
      {super.key,
      required this.id,
      required this.category,
      required this.image,
      required this.name,
      required this.price});

  final String name;
  final String price;
  final String category;
  final String id;
  final String image;

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  final _favBox = Hive.box("fav_box");
  Future<void> _createFav(Map<String, dynamic> addFav) async {
    await _favBox.add(addFav);
    getFavourites();
  }

  getFavourites() {
    final favData = _favBox.keys.map((key) {
      final item = _favBox.get(key);
      return {
        "key": key,
        "id": item['id'],
      };
    }).toList();
    fav = favData.toList();
    ids = fav.map((item) => item['id']).toList();
  }

  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        8,
        20,
        20,
        0,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 06,
                spreadRadius: 1,
                color: Colors.white,
                offset: Offset(1, 1))
          ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(widget.image))),
                  ),
                  Positioned(
                      right: 10.00,
                      top: 10.00,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.favorite_outline),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: appStyleWithHt(
                          16, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Text(
                      widget.category,
                      style:
                          appStyleWithHt(16, Colors.grey, FontWeight.bold, 1.5),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.price,
                      style: appStyleWithHt(
                          16, Colors.black, FontWeight.bold, 1.1),
                    ),
                    Row(
                      children: [
                        Text(
                          "Colors",
                          style: appStyleWithHt(
                              18, Colors.grey, FontWeight.bold, 1.1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ChoiceChip(
                          label: const Text(""),
                          selected: selected,
                          visualDensity: VisualDensity.compact,
                          selectedColor: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
