import 'package:flutter/material.dart';

class Country {
  Country(
      {required this.baseHappiness,
      required this.baseHealth,
      required this.name,
      required this.countryColor});
  int baseHappiness;
  int baseHealth;
  String name;
  Color countryColor;
}
