import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/country.dart';
import 'package:my_life/models/person.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LifeNotifier extends ChangeNotifier {
  Person? person;

  void updatePerson(Person newPerson) {
    person = newPerson;
    notifyListeners();
  }

  void updateCurrentCountry(Country country) {
    person!.currentCountry = country;
    notifyListeners();
  }

  void updateName(String name) {
    person!.name = name;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    person!.lastName = lastName;
    notifyListeners();
  }

  void updateGender(Gender gender) {
    person!.gender = gender;
    notifyListeners();
  }

  void updateHealth(int health) {
    person!.health = health;
    notifyListeners();
  }

  void incrementHealth(int increment) {
    if (person!.health + increment <= 100 && person!.health + increment >= 0) {
      person!.health = person!.health + increment;
      notifyListeners();
    }
  }

  void incrementHappiness(int increment) {
    if (person!.happiness + increment <= 100 &&
        person!.happiness + increment >= 0) {
      person!.happiness = person!.happiness + increment;
      notifyListeners();
    }
  }

  void incrementAppearence(int increment) {
    if (person!.appearence + increment <= 100 &&
        person!.appearence + increment >= 0) {
      person!.appearence = person!.appearence + increment;
      notifyListeners();
    }
  }

  void incrementIntelligence(int increment) {
    if (person!.intelligence + increment <= 100 &&
        person!.intelligence + increment >= 0) {
      person!.intelligence = person!.intelligence + increment;
      notifyListeners();
    }
  }

  void updateHappiness(int happiness) {
    person!.happiness = happiness;
    notifyListeners();
  }

  void updateAppearence(int appearence) {
    person!.appearence = appearence;
    notifyListeners();
  }
}

final lifeProvider = ChangeNotifierProvider<LifeNotifier>((ref) {
  return LifeNotifier();
});
