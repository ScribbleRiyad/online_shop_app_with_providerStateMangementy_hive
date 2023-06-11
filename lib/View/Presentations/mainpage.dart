import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop/View/Presentations/cartpage.dart';
import 'package:online_shop/View/Presentations/homepage.dart';
import 'package:online_shop/View/Presentations/profilepage.dart';
import 'package:online_shop/View/Presentations/searchpage.dart';
import '../../ Widgets/bottomnav_icon.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    const CartPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: pageList[pageIndex],
      bottomNavigationBar: SafeArea(
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
                icon: Ionicons.home,
                onTap: () {},
              ),
              BottomNavIcon(
                icon: Ionicons.search,
                onTap: () {},
              ),
              BottomNavIcon(
                icon: Ionicons.add,
                onTap: () {},
              ),
              BottomNavIcon(
                icon: Ionicons.cart,
                onTap: () {},
              ),
              BottomNavIcon(
                icon: Ionicons.person,
                onTap: () {},
              ),
            ],
          ),
        ),
      )),
    );
  }
}
