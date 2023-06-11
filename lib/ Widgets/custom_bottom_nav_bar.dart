import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop/%20Widgets/bottomnav_icon.dart';
import 'package:provider/provider.dart';

import '../Provider/mainpage_provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainPageProvider>(
        builder: (context, mainPageProvider, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavIcon(
                icon: mainPageProvider.pageIndex == 0
                    ? Ionicons.home
                    : Ionicons.home_outline,
                onTap: () {
                  mainPageProvider.pageIndex = 0;
                },
              ),
              BottomNavIcon(
                icon: Ionicons.search,
                onTap: () {
                  mainPageProvider.pageIndex = 1;
                },
              ),
              BottomNavIcon(
                icon: mainPageProvider.pageIndex == 2
                    ? Ionicons.add
                    : Ionicons.add_circle_outline,
                onTap: () {
                  mainPageProvider.pageIndex = 2;
                },
              ),
              BottomNavIcon(
                icon: mainPageProvider.pageIndex == 3
                    ? Ionicons.cart
                    : Ionicons.cart_outline,
                onTap: () {
                  mainPageProvider.pageIndex = 3;
                },
              ),
              BottomNavIcon(
                icon: mainPageProvider.pageIndex == 4
                    ? Ionicons.person
                    : Ionicons.person_outline,
                onTap: () {
                  mainPageProvider.pageIndex = 4;
                },
              ),
            ],
          ),
        ),
      ));
    });
  }
}
