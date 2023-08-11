// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';
import 'package:my_life/widgets/main_screen/main_screen_builder/loading_screen.dart';

import '../../../models/life.dart';

class MainScreenBuilder extends ConsumerStatefulWidget {
  const MainScreenBuilder({super.key});

  @override
  ConsumerState<MainScreenBuilder> createState() => _MainScreenBuilderState();
}

class _MainScreenBuilderState extends ConsumerState<MainScreenBuilder> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final _lifeProvider = ref.watch(lifeProvider);

    Future<bool> ensureLifeIsInitialized() async {
      // Simulate an asynchronous delay using a Future.delayed() call
      await Future.delayed(const Duration(seconds: 5), () async {
        final storedLives = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection('lives')
            .get();

        List<Life> userLives = []; // Initialize the userLives list here

        for (final storedLife in storedLives.docs) {
          userLives.add(Life.fromMap(storedLife.data()));
        }

        if (userLives.isNotEmpty) {
          _lifeProvider.changeLives(userLives[0]);
        }
      });

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
          children = const [LoadingScreen()];
        }
        return Container(
          decoration: BoxDecoration(color: Colors.green[100]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    ));
  }
}
