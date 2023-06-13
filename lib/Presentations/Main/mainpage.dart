import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../ Widgets/product_by_cart.dart';
import '../../Utils/custom_bottom_nav_bar.dart';
import '../../../Provider/mainpage_provider.dart';
import '../Cart/cartpage.dart';
import '../Home/homepage.dart';
import '../Profile/profilepage.dart';
import '../Search/searchpage.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const HomePage(),
    // const ProductByCart(tabIndex: null,),
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
