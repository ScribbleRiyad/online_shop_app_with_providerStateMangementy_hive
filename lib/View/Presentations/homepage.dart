import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/%20Widgets/appStyle.dart';
import 'package:online_shop/%20Widgets/product_card.dart';
import 'package:online_shop/Services/helper.dart';

import '../../models/sneaker_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;
  void getMale() {
    _male = Helper().getMaleSneakers();
    print(_male);
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
    print(_female);
  }

  void getkids() {
    _kids = Helper().getKidsSneakers();
    print(_kids);
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getkids();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(left: 6, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Scribble Sneakers Collection",
                      style: appStyleWithHt(
                          30, Colors.white, FontWeight.bold, 1.5),
                    ),
                    TabBar(
                        padding: EdgeInsets.zero,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStyle(20, Colors.white, FontWeight.bold),
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey.withOpacity(0.3),
                        tabs: const [
                          Tab(
                            child: Text("Men Shoes"),
                          ),
                          Tab(
                            child: Text("Women Shoes"),
                          ),
                          Tab(
                            child: Text("Kids Shoes"),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.25),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(controller: _tabController, children: [
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.405,
                        child: FutureBuilder<List<Sneakers>>(
                          future: _male,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                  return ProductCart(
                                      id: shoe.id,
                                      category: shoe.category,
                                      image: shoe.imageUrl[0],
                                      name: shoe.name,
                                      price: "\$${shoe.price}");
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
                                  style: appStyle(
                                      16, Colors.black, FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Show All",
                                      style: appStyle(
                                          16, Colors.black, FontWeight.bold),
                                    ),
                                    const Icon(
                                      Icons.arrow_right,
                                      size: 32,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.13,
                            child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                  child: ,
                                  );
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        color: Colors.amber,
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
