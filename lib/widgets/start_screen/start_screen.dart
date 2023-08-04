import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/start_screen/country_button/country_selection_button.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';
import 'package:my_life/providers/start_screen_provider.dart';
import 'package:my_life/models/person.dart';
import 'package:my_life/widgets/start_screen/name_button/name_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final startScreen = ref.watch(startScreenProvider);
    final newLife = ref.watch(lifeProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.amber, Colors.white],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.2,
              ),
              SizedBox(
                height: 60,
                child: Flex(direction: Axis.vertical, children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (startScreen.person.name == null &&
                            startScreen.person.lastName == null &&
                            startScreen.person.currentCountry != null) {
                          showErrorDialog(
                              'Please enter a name and a last name');
                        }
                        if (startScreen.person.name == null &&
                            startScreen.person.lastName == null &&
                            startScreen.person.currentCountry == null) {
                          showErrorDialog(
                              'Please enter a name and a last name, and select a country');
                        }
                        if (startScreen.person.currentCountry == null &&
                            startScreen.person.name != null &&
                            startScreen.person.lastName != null) {
                          showErrorDialog('Please select a country');
                        }
                        if (startScreen.person.name != null &&
                            startScreen.person.lastName != null &&
                            startScreen.person.currentCountry != null) {
                          newLife.person = startScreen.person;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const MainScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(
                          screenWidth - 32,
                        ),
                        backgroundColor: Colors.green[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text('Start New Life',
                          textAlign: TextAlign.center,
                          style: whiteFontedStyle(20)
                          // GoogleFonts.gloriaHallelujah(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //     textStyle: const TextStyle(color: Colors.white)),
                          ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 16),
              const NameButton(),
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
                          (screenWidth - 33) / 2,
                          (screenWidth - 33) / 2
                        ],
                        initialLabelIndex: _selectedGender.index,
                        cornerRadius: 30.0,
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        totalSwitches: 2,
                        customTextStyles: [whiteFontedStyle(20)],
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
              const CountrySelectionButton(),
              const SizedBox(height: 16),
              SizedBox(
                height: 60,
                child: Flex(direction: Axis.vertical, children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(
                          screenWidth - 32,
                        ),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 40,
                          ),
                          Text('Log Out',
                              textAlign: TextAlign.center,
                              style: whiteFontedStyle(20)
                              // GoogleFonts.gloriaHallelujah(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 20,
                              //     textStyle: const TextStyle(color: Colors.white)),
                              ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.logout, size: 28),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//54 74 79