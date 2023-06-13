import 'package:flutter/material.dart';

import '../Utils/appStyle.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn(
      {super.key,
      required this.label,
      this.onPressed,
      required this.buttonColor});
  final String label;
  final Function()? onPressed;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.24,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: buttonColor,
              style: BorderStyle.solid,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(9))),
        child: Center(
          child: Text(
            label,
            style: appStyle(16, buttonColor, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
