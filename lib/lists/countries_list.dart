import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';

import '../models/country.dart';

final List<Country> countries = [
  Country(
      bottomHappiness: 20,
      bottomHealth: 25,
      topHealth: 60,
      topHappiness: 55,
      name: 'Afghanistan',
      countryColor: Colors.green[700]!,
      zone: Zone.afghanistan),
  Country(
    bottomHappiness: 50,
    bottomHealth: 55,
    topHealth: 83,
    topHappiness: 90,
    name: 'Austria',
    countryColor: Colors.grey,
    zone: Zone.austria,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Belgium',
    countryColor: Colors.orange,
    zone: Zone.belgium,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 90,
    topHappiness: 90,
    name: 'Brazil',
    countryColor: Colors.green,
    zone: Zone.brazil,
  ),
  Country(
    bottomHappiness: 75,
    bottomHealth: 75,
    topHealth: 90,
    topHappiness: 90,
    name: 'Canada',
    countryColor: Colors.red,
    zone: Zone.canada,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'China',
    countryColor: Colors.orange,
    zone: Zone.china,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 55,
    topHealth: 80,
    topHappiness: 90,
    name: 'Egypt',
    countryColor: Colors.grey,
    zone: Zone.egypt,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 55,
    topHealth: 86,
    topHappiness: 90,
    name: 'Finland',
    countryColor: Colors.blue[600]!,
    zone: Zone.finland,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'France',
    countryColor: Colors.blue,
    zone: Zone.france,
  ),
  Country(
      bottomHappiness: 65,
      bottomHealth: 60,
      topHealth: 83,
      topHappiness: 90,
      name: 'Germany',
      countryColor: Colors.yellow,
      zone: Zone.germany),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'India',
    countryColor: Colors.orange,
    zone: Zone.india,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Iran',
    countryColor: Colors.yellow,
    zone: Zone.iran,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Israel',
    countryColor: Colors.blue[300]!,
    zone: Zone.israel,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Italy',
    countryColor: const Color.fromARGB(255, 124, 228, 128),
    zone: Zone.italy,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 55,
    topHealth: 86,
    topHappiness: 95,
    name: 'Japan',
    countryColor: Colors.pink,
    zone: Zone.japan,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 55,
    topHealth: 86,
    topHappiness: 95,
    name: 'Poland',
    countryColor: Colors.red,
    zone: Zone.poland,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Romania',
    countryColor: Colors.yellow,
    zone: Zone.romania,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Russia',
    countryColor: Colors.blue[700]!,
    zone: Zone.russia,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Saudi Arabia',
    countryColor: Colors.green[900]!,
    zone: Zone.saudiArabia,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'South Africa',
    countryColor: Colors.pink,
    zone: Zone.southAfrica,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'Spain',
    countryColor: Colors.orange,
    zone: Zone.spain,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 55,
    topHealth: 83,
    topHappiness: 95,
    name: 'Switzerland',
    countryColor: Colors.red,
    zone: Zone.switzerland,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 69,
    topHealth: 83,
    topHappiness: 72,
    name: 'Turkey',
    countryColor: Colors.red[700]!,
    zone: Zone.turkey,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 55,
    topHealth: 86,
    topHappiness: 70,
    name: 'Uganda',
    countryColor: Colors.blue[300]!,
    zone: Zone.uganda,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 85,
    name: 'Ukraine',
    countryColor: Colors.yellow,
    zone: Zone.ukraine,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 90,
    name: 'United Kingdom',
    countryColor: Colors.red[300]!,
    zone: Zone.uk,
  ),
  Country(
    bottomHappiness: 45,
    bottomHealth: 77,
    topHealth: 86,
    topHappiness: 76,
    name: 'United States',
    countryColor: Colors.blue[300]!,
    zone: Zone.us,
  ),
  Country(
    bottomHappiness: 65,
    bottomHealth: 60,
    topHealth: 83,
    topHappiness: 80,
    name: 'Zimbabwe',
    countryColor: Colors.orange,
    zone: Zone.zimbabwe,
  ),
];
