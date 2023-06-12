import 'package:flutter/material.dart';

class BottomNavIcon extends StatelessWidget {
  const BottomNavIcon({super.key, this.onTap, this.icon});
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36.00,
        width: 36.00,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
