// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_menu/main_menu_paths/view_lives_screen.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';

import 'package:my_life/widgets/start_screen/start_screen.dart';

import '../../../models/life.dart';
import '../../../providers/firebase_provider.dart';

class MainMenu extends ConsumerWidget {
  const MainMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(lifeProvider);
    final firebase = ref.watch(firebaseProvider);

    // ignore: no_leading_underscores_for_local_identifiers
    Gender? _gender = person.life!.gender;

    Color? personColor =
        _gender == Gender.male ? Colors.blue[700] : Colors.pink[700];

    Color? personTitleTextColor =
        _gender == Gender.male ? Colors.blue[900] : Colors.pink[900];
    Color? personSubtitleTextColor =
        _gender == Gender.male ? Colors.blue[700] : Colors.pink[700];

    void showAccountDialog() async {
      final user = FirebaseAuth.instance.currentUser!;
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(userData['username']),
        ),
      );
    }

    return Scaffold(
      backgroundColor:
          _gender == Gender.male ? Colors.blue[100] : Colors.pink[100],
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, weight: 100),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Text('Main Menu', style: whiteFontedStyle(22)),
          backgroundColor: personColor),
      body: ListView(
        children: [
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/baby-icon.png')),
            titleTextStyle: colorlessFontedStyle(20, personTitleTextColor),
            subtitleTextStyle:
                colorlessFontedStyle(16, personSubtitleTextColor),
            onTap: () {
              firebase.fetchUserLives();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
              );
            },
            subtitle: const Text('Continue your latest life'),
            title: const Text(
              textAlign: TextAlign.start,
              'Continue Life',
            ),
          ),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/sun-icon.png')),
            titleTextStyle: colorlessFontedStyle(20, personTitleTextColor),
            subtitleTextStyle:
                colorlessFontedStyle(16, personSubtitleTextColor),
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const StartScreen(),
                ),
              );
            },
            subtitle: const Text('Start a new life'),
            title: const Text(
              textAlign: TextAlign.start,
              'New Life',
            ),
          ),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/baby-icon.png')),
            titleTextStyle: colorlessFontedStyle(20, personTitleTextColor),
            subtitleTextStyle:
                colorlessFontedStyle(16, personSubtitleTextColor),
            onTap: () {
              firebase.fetchUserLives();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LivesScreen(),
                ),
              );
            },
            subtitle: const Text('Switch between your lives'),
            title: const Text(
              textAlign: TextAlign.start,
              'Lives',
            ),
          ),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: SizedBox(
                    width: 48,
                    child: Image.asset('assets/icons/logout-icon.png'))),
            titleTextStyle: colorlessFontedStyle(20, personTitleTextColor),
            subtitleTextStyle:
                colorlessFontedStyle(16, personSubtitleTextColor),
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              FirebaseAuth.instance.signOut();
            },
            subtitle: const Text('Log out of the application'),
            title: const Text(
              textAlign: TextAlign.start,
              'Logout',
            ),
          ),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/profile-icon.png')),
            titleTextStyle: colorlessFontedStyle(20, personTitleTextColor),
            subtitleTextStyle:
                colorlessFontedStyle(16, personSubtitleTextColor),
            onTap: () {
              showAccountDialog();
            },
            subtitle: const Text('Wiew your account details'),
            title: const Text(
              textAlign: TextAlign.start,
              'Account',
            ),
          ),
        ],
      ),
    );
  }
}
