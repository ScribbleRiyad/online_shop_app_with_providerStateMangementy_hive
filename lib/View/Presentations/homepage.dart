import 'package:flutter/material.dart';
import 'package:online_shop/%20Widgets/appStyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is Home',
          style: appStyle(30, Colors.green, FontWeight.bold),
        ),
      ),
    );
  }
}
