// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';
import 'package:my_life/models/person.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/action_bar.dart';
import 'package:my_life/widgets/main_screen/main_menu.dart';
import 'package:my_life/widgets/main_screen/property_chart.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final person = ref.watch(lifeProvider);
    String? _name = person.person!.name;
    String? _lastName = person.person!.lastName;
    Gender? _gender = person.person!.gender;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const MainMenu(),
              ),
            );
          },
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: Text(
            'MyLife - '
            '$_name '
            '$_lastName',
            style: whiteFontedStyle(22)),
        backgroundColor:
            _gender == Gender.male ? Colors.blue[700] : Colors.pink[700],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: _gender == Gender.male ? Colors.blue[100] : Colors.pink[100],
          ),
          child: const Column(
            children: [Spacer(), ActionBar(), PropertyChart()],
          ),
        ),
      ),
    );
  }
}
