import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/references/random_generators.dart';
import 'package:my_life/widgets/start_screen/country_button/country_selection_button.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';
import 'package:my_life/providers/start_screen_provider.dart';
import 'package:my_life/models/life.dart';
import 'package:my_life/widgets/start_screen/name_button/name_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../providers/firebase_provider.dart';
import '../main_screen/main_menu/main_menu.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  Gender _selectedGender = Gender.male;

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final startScreen = ref.watch(startScreenProvider);
    final newLife = ref.watch(lifeProvider);
    final firebase = ref.watch(firebaseProvider);

    void getRandomValues() {
      startScreen.updateUuid();
      Random randomAppearence;
      randomAppearence = Random();
      int appearence = randomAppearence.nextInt(100);
      startScreen.updateAppearence(appearence);
      Random randomIntelligence;
      randomIntelligence = Random();
      int intelligence = randomIntelligence.nextInt(100);
      startScreen.updateIntelligence(intelligence);
      startScreen.life.family = createRandomFamily(ref);
    }

    bool checkNullableValues() {
      bool? isValid;
      if (startScreen.life.name == null &&
          startScreen.life.lastName == null &&
          startScreen.life.currentCountry != null) {
        showErrorDialog('Please enter a name and a last name');
        isValid = false;
      } else if (startScreen.life.name == null &&
          startScreen.life.lastName == null &&
          startScreen.life.currentCountry == null) {
        showErrorDialog(
            'Please enter a name and a last name, and select a country');
        isValid = false;
      } else if (startScreen.life.currentCountry == null &&
          startScreen.life.name != null &&
          startScreen.life.lastName != null) {
        showErrorDialog('Please select a country');
        isValid = false;
      } else if (startScreen.life.name != null &&
          startScreen.life.lastName != null &&
          startScreen.life.currentCountry != null) {
        isValid = true;
      }
      return isValid!;
    }

    void startNewLife() {
      if (checkNullableValues()) {
        getRandomValues();
        newLife.life = startScreen.life.copy();
        firebase.storeLifeData(newLife.life!);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const MainScreen(),
          ),
        );
      }
    }

    return SizedBox(
      height: height(context),
      child: Scaffold(
        body: Container(
          height: height(context),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.amber, Colors.white],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height(context) * 0.2,
                    child: Row(
                      children: [
                        if (newLife.life != null)
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const MainMenu(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        const Spacer()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Flex(direction: Axis.vertical, children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            startNewLife();
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size.fromWidth(
                              width(context) - 32,
                            ),
                            backgroundColor: Colors.green[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text('Start New Life',
                              textAlign: TextAlign.center,
                              style: whiteFontedStyle(20, context)),
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  const CountrySelectionButton(),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 60,
                    width: double.maxFinite,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          child: ToggleSwitch(
                            customWidths: [
                              (width(context) - 33) / 2,
                              (width(context) - 33) / 2
                            ],
                            initialLabelIndex: _selectedGender.index,
                            cornerRadius: 30.0,
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.grey,
                            inactiveFgColor: Colors.white,
                            totalSwitches: 2,
                            customTextStyles: [whiteFontedStyle(20, context)],
                            labels: const [
                              'Male',
                              'Female',
                            ],
                            activeBgColors: [
                              [Colors.blue[700]!],
                              [Colors.pink[700]!],
                            ],
                            onToggle: (index) {
                              setState(() {
                                _selectedGender = Gender.values[index!];
                                startScreen.updateGender(_selectedGender);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const NameButton(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//54 74 79