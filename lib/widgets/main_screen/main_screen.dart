// ignore_for_file: no_leading_underscores_for_local_identifiers, override_on_non_overriding_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/models/life.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_screen_widgets/action_bar.dart';
import 'package:my_life/widgets/main_screen/main_menu/main_menu.dart';
import 'package:my_life/widgets/main_screen/main_screen_widgets/property_chart.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final _lifeProvider = ref.watch(lifeProvider);

    String? _name = _lifeProvider.life!.name;
    String? _lastName = _lifeProvider.life!.lastName;
    Gender? _gender = _lifeProvider.life!.gender;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              Navigator.of(context).push(
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
              color:
                  _gender == Gender.male ? Colors.blue[100] : Colors.pink[100],
            ),
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_lifeProvider.life!.background!.father!.name!)
                  ],
                ),
                const Spacer(),
                const ActionBar(),
                const PropertyChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
