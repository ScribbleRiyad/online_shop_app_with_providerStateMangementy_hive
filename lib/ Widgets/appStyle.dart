import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(double size, Color color, FontWeight fontWeight) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight);
}

TextStyle appStyleWithHt(
    double size, Color color, FontWeight fontWeight, double ht) {
  return GoogleFonts.poppins(
      fontSize: size, color: color, fontWeight: fontWeight, height: ht);
}
