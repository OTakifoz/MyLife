import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

class Country {
  Country({
    required this.baseHappiness,
    required this.baseHealth,
    required this.name,
    required this.countryColor,
    required this.zone,
  });
  int baseHappiness;
  int baseHealth;
  String name;
  Color countryColor;
  Zone zone;
}
