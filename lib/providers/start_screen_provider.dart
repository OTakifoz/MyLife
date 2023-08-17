import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/country.dart';
import 'package:my_life/models/life.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class StartScreenNotifier extends ChangeNotifier {
  final life = Life(
    age: 0,
    gender: Gender.male,
    happiness: null,
    health: null,
    intelligence: null,
    appearence: null,
    lastName: null,
    name: null,
    currentCountry: null,
    uid: null,
    background: null,
  );

  void chooseCountry(Country? country) {
    Random randomHappiness;
    int minHappiness = country!.bottomHappiness;
    int maxHappiness = country.topHappiness;
    randomHappiness = Random();
    int happiness =
        minHappiness + randomHappiness.nextInt(maxHappiness - minHappiness);
    life.happiness = happiness;
    Random randomHealth;
    int minHealth = country.bottomHealth;
    int maxHealth = country.topHealth;
    randomHealth = Random();
    int health = minHealth + randomHealth.nextInt(maxHealth - minHealth);
    life.health = health;
    life.currentCountry = country;
    notifyListeners();
  }

  void updateCurrentCountry(Country? country) {
    life.currentCountry = country;

    notifyListeners();
  }

  void updateUuid() {
    life.uid = const Uuid().v4();
    notifyListeners();
  }

  void updateName(String? name) {
    life.name = name;
    notifyListeners();
  }

  void updateLastName(String? lastName) {
    life.lastName = lastName;
    notifyListeners();
  }

  void updateGender(Gender? gender) {
    life.gender = gender;
    notifyListeners();
  }

  void updateHealth(int? health) {
    life.health = health;
    notifyListeners();
  }

  void incrementHealth(int? increment) {
    if (life.health + increment <= 100 && life.health + increment >= 0) {
      life.health = life.health + increment;
      notifyListeners();
    }
  }

  void incrementHappiness(int? increment) {
    if (life.happiness + increment <= 100 && life.happiness + increment >= 0) {
      life.happiness = life.happiness + increment;
      notifyListeners();
    }
  }

  void incrementAppearence(int? increment) {
    if (life.appearence + increment <= 100 &&
        life.appearence + increment >= 0) {
      life.appearence = life.appearence + increment;
      notifyListeners();
    }
  }

  void incrementIntelligence(int? increment) {
    if (life.intelligence + increment <= 100 &&
        life.intelligence + increment >= 0) {
      life.intelligence = life.intelligence + increment;
      notifyListeners();
    }
  }

  void updateHappiness(int? happiness) {
    life.happiness = happiness;
    notifyListeners();
  }

  void updateAppearence(int appearence) {
    life.appearence = appearence;
    notifyListeners();
  }

  void updateIntelligence(int intelligence) {
    life.intelligence = intelligence;
    notifyListeners();
  }
}

final startScreenProvider = ChangeNotifierProvider<StartScreenNotifier>((ref) {
  return StartScreenNotifier();
});
