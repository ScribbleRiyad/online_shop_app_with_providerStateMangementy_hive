import 'package:flutter/material.dart';
import 'package:online_shop/%20Widgets/staggertile.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../Services/helper.dart';
import '../Utils/appStyle.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key});

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;
  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getkids() {
    _kids = Helper().getKidsSneakers();
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
      body: SizedBox(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.landslide_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
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
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  FutureBuilder<List<Sneakers>>(
                    future: _male,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("has Error ${snapshot.hasError}");
                      } else {
                        final male = snapshot.data;
                        return StaggeredGridView.countBuilder(
                          scrollDirection: Axis.vertical,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 16,
                          crossAxisCount: 2,
                          staggeredTileBuilder: (index) => StaggeredTile.extent(
                            (index % 2 == 0) ? 1 : 1,
                            (index % 4 == 1 || index % 4 == 3)
                                ? MediaQuery.of(context).size.height * 0.35
                                : MediaQuery.of(context).size.height * 0.3,
                          ),
                          itemCount: male!.length,
                          itemBuilder: (context, index) {
                            final shoe = snapshot.data![index];
                            return StaggerTile(
                                imageUrl: shoe.imageUrl[0],
                                name: shoe.name,
                                price: shoe.price);
                          },
                        );
                      }
                    },
                  ),
                  Container(),
                  Container(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
