import 'country.dart';

enum Gender { male, female }

class Person {
  Person({
    required this.age,
    required this.gender,
    required this.happiness,
    required this.health,
    required this.intelligence,
    required this.appearence,
    required this.lastName,
    required this.name,
    required this.currentCountry,
  });
  int age;
  Gender? gender;
  dynamic happiness;
  dynamic health;
  dynamic intelligence;
  dynamic appearence;
  String? name;
  String? lastName;
  Country? currentCountry;

  Person copy() {
    return Person(
      age: age,
      gender: gender,
      happiness: happiness,
      health: health,
      intelligence: intelligence,
      appearence: appearence,
      lastName: lastName,
      name: name,
      currentCountry: currentCountry,
    );
  }
}
