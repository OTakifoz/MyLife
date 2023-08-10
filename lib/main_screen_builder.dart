// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';

import 'models/life.dart';

class MainScreenBuilder extends ConsumerStatefulWidget {
  const MainScreenBuilder({super.key});

  @override
  ConsumerState<MainScreenBuilder> createState() => _MainScreenBuilderState();
}

class _MainScreenBuilderState extends ConsumerState<MainScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    List<Life> userLives = [];
    final _lifeProvider = ref.watch(lifeProvider);

    Future<bool> ensureLifeIsInitialized() async {
      final storedLives = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('lives')
          .get();
      for (final storedLife in storedLives.docs) {
        userLives.add(Life.fromMap(storedLife.data()));
      }
      _lifeProvider.changeLives(userLives[0]);
      await Future.delayed(const Duration(seconds: 5));

      return true;
    }

    Future<bool> ensureLifeWasInitialized = ensureLifeIsInitialized();

    return Scaffold(
        body: FutureBuilder<bool>(
      future:
          ensureLifeWasInitialized, // a previously-obtained Future<String> or null
      builder: (context, snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            const MainScreen(),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            ),
          ];
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    ));
  }
}
