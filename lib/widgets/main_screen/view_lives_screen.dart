// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_life/models/pallette.dart';
import 'package:my_life/providers/firebase_provider.dart';
import 'package:my_life/providers/life_provider.dart';

import '../../models/life.dart';

class LivesScreen extends ConsumerWidget {
  const LivesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _lifeProvider = ref.watch(lifeProvider);
    final _firebaseProvider = ref.watch(firebaseProvider);
    final lives = _firebaseProvider.userLives;

    Gender? _gender = _lifeProvider.life!.gender;

    Color? personColor =
        _gender == Gender.male ? Colors.blue[700] : Colors.pink[700];

    Color? personTitleTextColor =
        _gender == Gender.male ? Colors.blue[900] : Colors.pink[900];
    Color? personSubtitleTextColor =
        _gender == Gender.male ? Colors.blue[700] : Colors.pink[700];

    return Scaffold(
      backgroundColor:
          _gender == Gender.male ? Colors.blue[100] : Colors.pink[100],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Text('Previous Lives', style: whiteFontedStyle(22)),
          backgroundColor: personColor),
      body: ListView.builder(
        itemCount: lives.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(lives[index].name!),
              onTap: () {
                _lifeProvider.changeLives(lives[index]);
                Navigator.pop(context);
              });
        },
      ),
    );
  }
}
