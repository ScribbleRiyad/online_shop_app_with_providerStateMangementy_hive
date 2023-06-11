import 'package:flutter/material.dart';
import 'package:online_shop/View/Shared/appStyle.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
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
                GestureDetector(
                  onTap: () {},
                  child: const SizedBox(
                    height: 36.00,
                    width: 36.00,
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        body: Center(
          child: Text(
            "HI Online Shop",
            style: appStyle(30, Colors.red, FontWeight.bold),
          ),
        ));
  }
}
