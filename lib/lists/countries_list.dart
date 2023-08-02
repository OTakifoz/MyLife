import 'package:flutter/material.dart';

import '../models/country.dart';

final List<Country> countries = [
  Country(
      baseHappiness: 65,
      baseHealth: 65,
      name: 'Turkey',
      countryColor: Colors.red),
  Country(
      baseHappiness: 80,
      baseHealth: 90,
      name: 'United States',
      countryColor: Colors.blue[300]!)
];
