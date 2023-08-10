import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/life.dart';

class FirebaseNotifier extends ChangeNotifier {
  List<Life> userLives = [];
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> storeLifeData(Life life) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('lives')
        .doc(life.uid)
        .set(life.toMap());
  }

  Future<void> fetchUserLives() async {
    final storedLives = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('lives')
        .get();
    for (final storedLife in storedLives.docs) {
      userLives.add(Life.fromMap(storedLife.data()));
    }

    notifyListeners();
  }
}

final firebaseProvider = ChangeNotifierProvider<FirebaseNotifier>((ref) {
  return FirebaseNotifier();
});
