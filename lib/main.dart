import 'package:flutter/material.dart';
import 'package:online_shop/Provider/mainpage_provider.dart';
import 'package:provider/provider.dart';
import 'View/Presentations/mainpage.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainPageProvider()),
  ], child: const OnlineShopApp()));
}

class OnlineShopApp extends StatelessWidget {
  const OnlineShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
