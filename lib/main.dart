import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/widgets/authentication_screen/firebase_options.dart';
import 'package:my_life/widgets/authentication_screen/splash_screen.dart';
import 'package:my_life/widgets/authentication_screen/authentication_screen.dart';
import 'package:my_life/widgets/start_screen/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            if (snapshot.hasData) {
              return const StartScreen();
            }
            return const AuthenticationScreen();
          }),
        ),
      ),
    ),
  );
}
