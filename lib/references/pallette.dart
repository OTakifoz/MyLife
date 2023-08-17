import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var currentFont = GoogleFonts.rowdies;

TextStyle whiteBoldFontedStyle(double fontSize) {
  return currentFont(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      textStyle: const TextStyle(color: Colors.white));
}

TextStyle colorlessFontedStyle(double fontSize, Color? color) {
  return currentFont(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      textStyle: TextStyle(color: color));
}

TextStyle whiteFontedStyle(double fontSize) {
  return currentFont(
      fontSize: fontSize, textStyle: const TextStyle(color: Colors.white));
}
