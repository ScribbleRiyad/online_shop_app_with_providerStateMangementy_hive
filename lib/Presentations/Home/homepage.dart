import 'package:flutter/material.dart';
import 'package:online_shop/Provider/Product/product_provider.dart';
import 'package:online_shop/Utils/appStyle.dart';

import 'package:provider/provider.dart';

import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context, listen: true);
    productNotifier.getMale();
    productNotifier.getFemale();
    productNotifier.getKids();

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
                padding: const EdgeInsets.only(left: 16, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Scribble Sneakers",
                      style: appStyleWithHt(
                          32, Colors.white, FontWeight.bold, 1.5),
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
                  HomeWidget(
                    male: productNotifier.male,
                    tabIndex: 0,
                  ),
                  HomeWidget(
                    male: productNotifier.female,
                    tabIndex: 1,
                  ),
                  HomeWidget(
                    male: productNotifier.kids,
                    tabIndex: 2,
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
