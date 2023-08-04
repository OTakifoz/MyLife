// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import '../../models/person.dart';

class PropertyChart extends ConsumerWidget {
  const PropertyChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(lifeProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    Color? healthBarColor;

    var _health = person.person!.health;
    var _happiness = person.person!.happiness;
    var _appearence = person.person!.appearence;
    var _intelligence = person.person!.intelligence;
    var _gender = person.person!.gender;

    if (_health > 70) {
      healthBarColor = Colors.green;
    }
    if (_health <= 70 && _health >= 50) {
      healthBarColor = Colors.yellow;
    }
    if (_health < 50 && _health >= 30) {
      healthBarColor = Colors.orange;
    }
    if (_health < 30) {
      healthBarColor = Colors.red;
    }
    Color? happinessBarColor;
    if (_happiness > 70) {
      happinessBarColor = Colors.green;
    }
    if (_happiness <= 70 && person.person!.happiness >= 50) {
      happinessBarColor = Colors.yellow;
    }
    if (person.person!.happiness < 50 && _happiness >= 30) {
      happinessBarColor = Colors.orange;
    }
    if (_happiness < 30) {
      happinessBarColor = Colors.red;
    }
    Color? appearenceBarColor;
    if (_appearence > 70) {
      appearenceBarColor = Colors.green;
    }
    if (_appearence <= 70 && _appearence >= 50) {
      appearenceBarColor = Colors.yellow;
    }
    if (_appearence < 50 && _appearence >= 30) {
      appearenceBarColor = Colors.orange;
    }
    if (_appearence < 30) {
      appearenceBarColor = Colors.red;
    }
    Color? intelligenceBarColor;
    if (_intelligence > 70) {
      intelligenceBarColor = Colors.green;
    }
    if (_intelligence <= 70 && _intelligence >= 30) {
      intelligenceBarColor = Colors.yellow;
    }
    if (_intelligence < 30) {
      intelligenceBarColor = Colors.red;
    }

    const barHeight = 25.0;

    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: (screenWidth - 60) * 0.35,
                        child: Text(
                          style: colorlessFontedStyle(
                            16,
                            _gender == Gender.male
                                ? Colors.blue[900]
                                : Colors.pink[900],
                          ),
                          'Health',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: (screenWidth - 60) * 0.65,
                      height: barHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: healthBarColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              height: barHeight,
                              width:
                                  (screenWidth - 60) * 0.65 * 0.01 * (_health),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  _health >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '$_health%',
                                              style: colorlessFontedStyle(
                                                16,
                                                _gender == Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          _health < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '$_appearence%',
                                      style: colorlessFontedStyle(
                                        16,
                                        _gender == Gender.male
                                            ? Colors.blue[900]
                                            : Colors.pink[900],
                                      ),
                                    ),
                                  ),
                                )
                              : const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: (screenWidth - 60) * 0.35,
                        child: Text(
                          style: colorlessFontedStyle(
                            16,
                            _gender == Gender.male
                                ? Colors.blue[900]
                                : Colors.pink[900],
                          ),
                          'Happiness',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: (screenWidth - 60) * 0.65,
                      height: barHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: happinessBarColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              height: barHeight,
                              width: (screenWidth - 60) *
                                  0.65 *
                                  0.01 *
                                  (_happiness),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  _happiness >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '$_happiness%',
                                              style: colorlessFontedStyle(
                                                16,
                                                _gender == Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          _happiness < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '$_appearence%',
                                      style: colorlessFontedStyle(
                                        16,
                                        _gender == Gender.male
                                            ? Colors.blue[900]
                                            : Colors.pink[900],
                                      ),
                                    ),
                                  ),
                                )
                              : const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: (screenWidth - 60) * 0.35,
                        child: Text(
                          style: colorlessFontedStyle(
                            16,
                            _gender == Gender.male
                                ? Colors.blue[900]
                                : Colors.pink[900],
                          ),
                          'Appearence',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: (screenWidth - 60) * 0.65,
                      height: barHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: appearenceBarColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              height: barHeight,
                              width: (screenWidth - 60) *
                                  0.65 *
                                  0.01 *
                                  (_appearence),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  _appearence >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '$_appearence%',
                                              style: colorlessFontedStyle(
                                                16,
                                                _gender == Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          _appearence < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '$_appearence%',
                                      style: colorlessFontedStyle(
                                        16,
                                        _gender == Gender.male
                                            ? Colors.blue[900]
                                            : Colors.pink[900],
                                      ),
                                    ),
                                  ),
                                )
                              : const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: SizedBox(
                        width: (screenWidth - 60) * 0.35,
                        child: Text(
                          style: colorlessFontedStyle(
                            16,
                            _gender == Gender.male
                                ? Colors.blue[900]
                                : Colors.pink[900],
                          ),
                          'Intelligence',
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: (screenWidth - 60) * 0.65,
                      height: barHeight,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: intelligenceBarColor,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              height: barHeight,
                              width: (screenWidth - 60) *
                                  0.65 *
                                  0.01 *
                                  (_intelligence),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  _intelligence >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '$_intelligence%',
                                              style: colorlessFontedStyle(
                                                16,
                                                _gender == Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          _intelligence < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '$_intelligence%',
                                      style: colorlessFontedStyle(
                                        16,
                                        _gender == Gender.male
                                            ? Colors.blue[900]
                                            : Colors.pink[900],
                                      ),
                                    ),
                                  ),
                                )
                              : const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
