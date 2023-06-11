import 'package:flutter/material.dart';

import '../../ Widgets/appStyle.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This is Search',
          style: appStyle(30, Colors.blueAccent, FontWeight.bold),
        ),
      ),
    );
  }
}
