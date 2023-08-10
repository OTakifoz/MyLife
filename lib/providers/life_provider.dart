import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/country.dart';
import 'package:my_life/models/life.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LifeNotifier extends ChangeNotifier {
  Life? life;
  User? user = FirebaseAuth.instance.currentUser;

  void changeLives(Life newLife) {
    life = newLife;

    notifyListeners();
  }

  void updateCurrentCountry(Country country) {
    life!.currentCountry = country;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .set({'currentCountry': country});
    notifyListeners();
  }

  void updateName(String name) {
    life!.name = name;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .update({'name': life!.name});
    notifyListeners();
  }

  void updateLastName(String lastName) {
    life!.lastName = lastName;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .update({'lastName': life!.lastName});
    notifyListeners();
  }

  void updateGender(Gender gender) {
    life!.gender = gender;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .update({'gender': life!.gender.toString()});
    notifyListeners();
  }

  void updateHealth(int health) {
    life!.health = health;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .update({'health': life!.health});
    notifyListeners();
  }

  void incrementHealth(int increment) {
    if (life!.health + increment <= 100 && life!.health + increment >= 0) {
      life!.health = life!.health + increment;
      FirebaseFirestore.instance
          .collection('lives')
          .doc(life!.uid)
          .update({'health': life!.health});
      notifyListeners();
    }
  }

  void incrementHappiness(int increment) {
    if (life!.happiness + increment <= 100 &&
        life!.happiness + increment >= 0) {
      life!.happiness = life!.happiness + increment;
      FirebaseFirestore.instance
          .collection('lives')
          .doc(life!.uid)
          .update({'happiness': life!.happiness});
      notifyListeners();
    }
  }

  void incrementAppearence(int increment) {
    if (life!.appearence + increment <= 100 &&
        life!.appearence + increment >= 0) {
      life!.appearence = life!.appearence + increment;
      FirebaseFirestore.instance
          .collection('lives')
          .doc(life!.uid)
          .update({'appearence': life!.appearence});
      notifyListeners();
    }
  }

  void incrementIntelligence(int increment) {
    if (life!.intelligence + increment <= 100 &&
        life!.intelligence + increment >= 0) {
      life!.intelligence = life!.intelligence + increment;
      FirebaseFirestore.instance
          .collection('lives')
          .doc(life!.uid)
          .update({'intelligence': life!.intelligence});
      notifyListeners();
    }
  }

  void updateHappiness(int happiness) {
    life!.happiness = happiness;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .update({'happiness': life!.happiness});
    notifyListeners();
  }

  void updateAppearence(int appearence) {
    life!.appearence = appearence;
    FirebaseFirestore.instance
        .collection('lives')
        .doc(life!.uid)
        .update({'appearence': life!.appearence});
    notifyListeners();
  }
}

final lifeProvider = ChangeNotifierProvider<LifeNotifier>((ref) {
  return LifeNotifier();
});
