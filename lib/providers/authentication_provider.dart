import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';

enum SignInMethod { emailAndPassword, google }

class AuthenticationNotifier extends ChangeNotifier {
  final UserModel userModel = UserModel(
    email: null,
    username: null,
    authMode: AuthMode.login,
    password: null,
    lives: [],
  );
  final firebase = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;
  SignInMethod method = SignInMethod.emailAndPassword;

  void signInWithGoogle() async {
// begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
// obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
// create a new credential for userModel
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    method = SignInMethod.google;
    await FirebaseAuth.instance.signInWithCredential(credential);
    notifyListeners();
    storeUserAuthenticationData(FirebaseAuth.instance.currentUser!);
  }

  void signWithEmailAndPassword() async {
    try {
      if (userModel.authMode == AuthMode.login) {
        await firebase.signInWithEmailAndPassword(
            email: userModel.email!.trimRight(),
            password: userModel.password!.trimRight());
      } else {
        // ignore: unused_local_variable
        final userCredentials = await firebase.createUserWithEmailAndPassword(
            email: userModel.email!.trimRight(),
            password: userModel.password!.trimRight());
        notifyListeners();
        storeUserAuthenticationData(FirebaseAuth.instance.currentUser!);
      }
    } on FirebaseAuthException catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  Future<void> storeUserAuthenticationData(User user) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'username': (method == SignInMethod.emailAndPassword)
          ? userModel.username
          : user.displayName,
      'email': user.email,
      'lives': userModel.lives,
    });
  }

  void submitUserData(
    String? email,
    String? username,
    AuthMode authMode,
    String? password,
  ) {
    userModel.email = email;
    userModel.username = username;
    userModel.authMode = authMode;
    userModel.password = password;
    notifyListeners();
  }
}

final authenticationProvider =
    ChangeNotifierProvider<AuthenticationNotifier>((ref) {
  return AuthenticationNotifier();
});
