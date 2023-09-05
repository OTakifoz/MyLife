// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';
import 'package:my_life/widgets/initial_builder/loading_screen.dart';
import 'package:my_life/widgets/start_screen/start_screen.dart';

import '../../../../../models/life.dart';

class MainBuilder extends ConsumerStatefulWidget {
  const MainBuilder({super.key});

  @override
  ConsumerState<MainBuilder> createState() => _MainScreenBuilderState();
}

class _MainScreenBuilderState extends ConsumerState<MainBuilder> {
  final user = FirebaseAuth.instance.currentUser;
  bool userHasLives = false;

  Future<bool> initializeInformation() async {
    await Future.delayed(const Duration(milliseconds: 7500), () async {
      final _lifeProvider = ref.watch(lifeProvider);
      List<Life> userLives = [];

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
      } else {
        userHasLives = false;
      }
      if (userHasLives == true) {
        _lifeProvider.changeLives(userLives[0]);
      }
    });
    return true;
  }

  late Future<bool> initializeInfo = initializeInformation();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: initializeInfo,
      builder: (context, snapshot) {
        Widget child;
        if (snapshot.hasData && userHasLives) {
          child = const MainScreen();
        } else if (snapshot.hasData && !userHasLives) {
          child = const StartScreen();
        } else if (snapshot.hasError) {
          child = Column(
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              )
            ],
          );
        } else {
          child = const LoadingScreen();
        }
        return child;
      },
    );
  }
}
