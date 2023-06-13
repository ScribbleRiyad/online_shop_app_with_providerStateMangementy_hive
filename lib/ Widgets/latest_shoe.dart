import 'package:flutter/material.dart';
import 'package:online_shop/%20Widgets/staggertile.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class LatestShoe extends StatelessWidget {
  const LatestShoe({super.key, required Future<List<Sneakers>> male})
      : _male = male;
  final Future<List<Sneakers>> _male;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _male,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("has Error ${snapshot.hasError}");
        } else {
          final male = snapshot.data;
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            crossAxisSpacing: 26,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            staggeredTileBuilder: (index) => StaggeredTile.extent(
              (index % 2 == 0) ? 1 : 1,
              (index % 4 == 1 || index % 4 == 3)
                  ? MediaQuery.of(context).size.height * 0.42
                  : MediaQuery.of(context).size.height * 0.39,
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
    );
  }
}
