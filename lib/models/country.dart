import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

class Country {
  Country({
    required this.bottomHappiness,
    required this.bottomHealth,
    required this.name,
    required this.countryColor,
    required this.zone,
    required this.topHappiness,
    required this.topHealth,
  });
  int bottomHappiness;
  int bottomHealth;
  int topHealth;
  int topHappiness;
  String name;
  Color countryColor;
  Zone zone;
}
