import 'package:flutter/material.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:provider/provider.dart';
import '../../ Widgets/product_by_cart.dart';
import '../../Provider/Product/product_provider.dart';
import '../../Utils/appStyle.dart';
import '../../../ Widgets/new_shoes.dart';
import '../../../ Widgets/product_card.dart';
import '../Product/product_page.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget(
      {super.key, required Future<List<Sneakers>> male, required this.tabIndex})
      : _male = male;
  final Future<List<Sneakers>> _male;
  final int tabIndex;
  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.405,
          child: FutureBuilder<List<Sneakers>>(
            future: _male,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text("has Error ${snapshot.hasError}");
              } else {
                final male = snapshot.data;
                return ListView.builder(
                  itemCount: male!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final shoe = snapshot.data![index];
                    return GestureDetector(
                      onTap: () {
                        productNotifier.shoeSize = shoe.sizes;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductPage(
                                    id: shoe.id, category: shoe.category)));
                      },
                      child: ProductCart(
                          id: shoe.id,
                          category: shoe.category,
                          image: shoe.imageUrl[0],
                          name: shoe.name,
                          price: "\$${shoe.price}"),
                    );
                  },
                );
              }
            },
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Collection",
                    style: appStyle(16, Colors.black, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductByCart(
                                    tabIndex: tabIndex,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Show All",
                          style: appStyle(16, Colors.black, FontWeight.bold),
                        ),
                        const Icon(
                          Icons.arrow_right,
                          size: 32,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              child: FutureBuilder<List<Sneakers>>(
                future: _male,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text("has Error ${snapshot.hasError}");
                  } else {
                    final male = snapshot.data;
                    return ListView.builder(
                        itemCount: male!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final shoe = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NewShoes(
                              imageUrl: shoe.imageUrl[0],
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
