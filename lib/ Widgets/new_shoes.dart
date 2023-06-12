import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewShoes extends StatefulWidget {
  const NewShoes({super.key});

  @override
  State<NewShoes> createState() => _NewShoesState();
}

class _NewShoesState extends State<NewShoes> {
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: const BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.all(
             Radius.circular(16)),
         boxShadow: [
           BoxShadow(
               color: Colors.white,
               blurRadius: 0.8,
               offset: Offset(0, 1),
               spreadRadius: 1),
         ]),
     height:
     MediaQuery.of(context).size.height *
         0.12,
     width: MediaQuery.of(context).size.width *
         0.28,
     child: CachedNetworkImage(
       imageUrl:
       "https://d326fntlu7tb1e.cloudfront.net/uploads/58282ea3-b815-4d26-9f4f-382aa62f67cf-HP5404_a1.webp",
     ),
   );

  }
