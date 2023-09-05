// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:my_life/lists/countries_list.dart';
import 'package:my_life/references/model_base.dart';

import 'country.dart';
import 'family.dart';

enum Gender { male, female }

class Life extends ModelBase {
  Life({
    required this.age,
    required this.gender,
    required this.happiness,
    required this.health,
    required this.intelligence,
    required this.appearence,
    required this.lastName,
    required this.name,
    required this.currentCountry,
    required this.uid,
    required this.family,
    required this.balance,
  });
  int? age;
  Gender? gender;
  dynamic happiness;
  dynamic health;
  dynamic intelligence;
  dynamic appearence;
  String? name;
  String? lastName;
  Country? currentCountry;
  String? uid;
  Family? family;
  int? balance;

  Life copy() {
    return Life(
        age: age,
        gender: gender,
        happiness: happiness,
        health: health,
        intelligence: intelligence,
        appearence: appearence,
        lastName: lastName,
        name: name,
        currentCountry: currentCountry,
        uid: uid,
        family: family,
        balance: balance);
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'gender': gender.toString(),
      'happiness': happiness,
      'health': health,
      'intelligence': intelligence,
      'appearence': appearence,
      'lastName': lastName,
      'name': name,
      'currentCountry': currentCountry!.name,
      'uid': uid,
      'family': family!.toMap(),
      'balance': balance
    }
      ..addAll(super.toMap())
      ..removeWhere((key, value) => value == null);
  }

  Life.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    Gender? _gender;
    Country country;
    country = countries.firstWhere(
      (_country) => _country.name == data['currentCountry'],
    );
    if (data['gender'] == "Gender.male") {
      _gender = Gender.male;
    }
    if (data['gender'] == "Gender.female") {
      _gender = Gender.female;
    }
    age = data['age'];
    gender = _gender;
    happiness = data['happiness'];
    health = data['health'];
    intelligence = data['intelligence'];
    appearence = data['appearence'];
    lastName = data['lastName'];
    name = data['name'];
    currentCountry = country;
    uid = data['uid'];
    if (data['family'] != null) {
      family = Family.fromMap(data['family']);
    }
    balance = data['balance'];
  }
}
