// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/widgets/main_screen/main_screen_builder/main_screen_builder.dart';
import 'package:my_life/widgets/authentication_screen/firebase_options.dart';
import 'package:my_life/widgets/authentication_screen/splash_screen.dart';
import 'package:my_life/widgets/authentication_screen/authentication_screen.dart';
import 'package:my_life/widgets/start_screen/start_screen.dart';
import 'models/life.dart';

final user = FirebaseAuth.instance.currentUser;
List<Life> userLives = [];
bool userHasLives = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final storedLives = await FirebaseFirestore.instance
      .collection('users')
      .doc(user!.uid)
      .collection('lives')
      .get();
  for (final storedLife in storedLives.docs) {
    userLives.add(Life.fromMap(storedLife.data()));
  }
  if (userLives.isNotEmpty) {
    userHasLives = true;
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData && userHasLives == false) {
              return const StartScreen();
            }
            if (snapshot.hasData && userHasLives == true) {
              return const MainScreenBuilder();
            }
            return const AuthenticationScreen();
          }),
        ),
      ),
    ),
  );
}
