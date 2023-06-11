import 'package:flutter/material.dart';
import 'package:flutter_antd_icons/flutter_antd_icons.dart';
import 'package:online_shop/%20Widgets/appStyle.dart';

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
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.265),
              child: TabBarView(controller: _tabController, children: [
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      color: Colors.amber,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "New Collection",
                              style:
                                  appStyle(20, Colors.black, FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Show All",
                                  style: appStyle(
                                      20, Colors.black, FontWeight.bold),
                                ),
                                const Icon(AntdIcons.caret_right_filled)
                              ],
                            )
                          ],
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
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        isScrollable: true,
                        labelColor: Colors.white,
                        labelStyle: appStyle(20, Colors.white, FontWeight.bold),
                        controller: _tabController,
                        unselectedLabelColor: Colors.grey.withOpacity(0.5),
                        tabs: const [
                          Tab(
                            child: Text("Men Shoe"),
                          ),
                          Tab(
                            child: Text("Women Shoe"),
                          ),
                          Tab(
                            child: Text("Kids Shoe"),
                          ),
                        ]),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
