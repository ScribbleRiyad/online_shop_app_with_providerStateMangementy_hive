import 'package:flutter/material.dart';
import 'package:online_shop/View/Presentations/cartpage.dart';
import 'package:online_shop/View/Presentations/homepage.dart';
import 'package:online_shop/View/Presentations/profilepage.dart';
import 'package:online_shop/View/Presentations/searchpage.dart';
import 'package:provider/provider.dart';
import '../../ Widgets/custom_bottom_nav_bar.dart';
import '../../Provider/mainpage_provider.dart';

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
    return Consumer<MainPageProvider>(
        builder: (context, mainPageProvider, child) {
      return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: pageList[mainPageProvider.pageIndex],
        bottomNavigationBar: const CustomBottomNavBar(),
      );
    });
  }
}
