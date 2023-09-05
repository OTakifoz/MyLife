// ignore_for_file: no_leading_underscores_for_local_identifiers, override_on_non_overriding_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/main_screen_widgets/action_bar.dart';
import 'package:my_life/widgets/main_screen/main_screen_widgets/property_chart.dart';

import 'main_menu/main_menu.dart';

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

    return SizedBox(
      height: height(context),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: const SizedBox(
                width: 56,
                height: 48,
              ),
            )
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              pushTo(context, const MainMenu());
            },
          ),
          title: Center(
              child: Text('MYLIFE', style: whiteFontedStyle(22, context))),
          backgroundColor: genderBasedWidgetColor(ref),
        ),
        body: Center(
          child: SizedBox(
            width: width(context),
            height: height(context),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.symmetric(
                          horizontal: BorderSide(color: Colors.grey[700]!))),
                  height: height(context) * 0.06,
                  width: width(context),
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '$_name '
                        '$_lastName',
                        style: colorlessFontedStyle(
                            16, genderBasedTitleColor(ref)),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Center(
                            child: Text(_lifeProvider.life!.balance.toString()),
                          ),
                          const Center(
                            child: Text('Bank Balance'),
                          ),
                        ],
                      ),
                    )
                  ]),
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
