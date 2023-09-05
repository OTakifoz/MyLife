// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_menu/main_menu_paths/view_lives_screen.dart';
import '../action_bar_paths/relationships_screen/custom_spacer.dart';
import 'package:my_life/widgets/start_screen/start_screen.dart';
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
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, weight: 100),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: height(context) * 0.08,
          title: Text('Main Menu', style: whiteFontedStyle(22, context)),
          backgroundColor: genderBasedWidgetColor(ref)),
      body: ListView(
        children: [
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/baby-icon.png')),
            titleTextStyle:
                colorlessFontedStyle(20, genderBasedTitleColor(ref)),
            subtitleTextStyle: whiteFontedStyle(16, context),
            onTap: () {
              firebase.fetchUserLives();
              pushAndReplaceTo(context, const MainMenu());
            },
            subtitle: const Text('Continue your latest life'),
            title: const Text(
              textAlign: TextAlign.start,
              'Continue Life',
            ),
          ),
          const CustomSpacer(),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/sun-icon.png')),
            titleTextStyle:
                colorlessFontedStyle(20, genderBasedTitleColor(ref)),
            subtitleTextStyle:
                colorlessFontedStyle(16, genderBasedTitleColor(ref)),
            onTap: () {
              pushAndReplaceTo(
                context,
                const StartScreen(),
              );
            },
            subtitle: const Text('Start a new life'),
            title: const Text(
              textAlign: TextAlign.start,
              'New Life',
            ),
          ),
          const CustomSpacer(),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/baby-icon.png')),
            titleTextStyle:
                colorlessFontedStyle(20, genderBasedTitleColor(ref)),
            subtitleTextStyle: whiteFontedStyle(16, context),
            onTap: () {
              firebase.fetchUserLives();
              pushAndReplaceTo(context, const LivesScreen());
            },
            subtitle: const Text('Switch between your lives'),
            title: const Text(
              textAlign: TextAlign.start,
              'Lives',
            ),
          ),
          const CustomSpacer(),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: SizedBox(
                    width: 48,
                    child: Image.asset('assets/icons/logout-icon.png'))),
            titleTextStyle:
                colorlessFontedStyle(20, genderBasedTitleColor(ref)),
            subtitleTextStyle:
                colorlessFontedStyle(16, genderBasedTitleColor(ref)),
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
          const CustomSpacer(),
          ListTile(
            leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/profile-icon.png')),
            titleTextStyle:
                colorlessFontedStyle(20, genderBasedTitleColor(ref)),
            subtitleTextStyle:
                colorlessFontedStyle(16, genderBasedTitleColor(ref)),
            onTap: () {
              showAccountDialog();
            },
            subtitle: const Text('Wiew your account details'),
            title: const Text(
              textAlign: TextAlign.start,
              'Account',
            ),
          ),
          const CustomSpacer(),
        ],
      ),
    );
  }
}
