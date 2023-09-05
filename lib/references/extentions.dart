import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DoubleExtension on double {
  double _asScaled(double value,
      {required double screenWidth, required double screenHeight}) {
    final referenceSize =
        screenWidth < screenHeight ? screenWidth : screenHeight;
    return value * referenceSize / 375.0; // 375.0 is a reference device width
  }

  double asScaled(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return _asScaled(this,
        screenWidth: screenWidth, screenHeight: screenHeight);
  }
}
