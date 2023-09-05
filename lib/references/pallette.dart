import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_life/references/extentions.dart';

var currentFont = GoogleFonts.rowdies;

TextStyle whiteBoldFontedStyle(double fontSize, BuildContext context) {
  return currentFont(
      fontWeight: FontWeight.bold,
      fontSize: fontSize.asScaled(context),
      textStyle: const TextStyle(color: Colors.white));
}

TextStyle colorlessFontedStyle(double fontSize, Color? color) {
  return currentFont(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      textStyle: TextStyle(color: color));
}

TextStyle whiteFontedStyle(double fontSize, BuildContext context) {
  return currentFont(
      fontSize: fontSize.asScaled(context),
      textStyle: const TextStyle(color: Colors.white));
}
