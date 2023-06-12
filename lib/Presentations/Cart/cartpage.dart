import 'package:flutter/material.dart';

import '../../Utils/appStyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Center(
        child: Text(
          'This is Cart',
          style: appStyle(30, Colors.pink, FontWeight.bold),
        ),
      ),
    );
  }
}
