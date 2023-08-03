import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';
import '../../models/person.dart';
import '../../providers/person_provider.dart';

class PropertyChart extends ConsumerWidget {
  const PropertyChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    Color? healthBarColor;
    if (person.person.health > 70) {
      healthBarColor = Colors.green;
    }
    if (person.person.health <= 70 && person.person.health >= 50) {
      healthBarColor = Colors.yellow;
    }
    if (person.person.health < 50 && person.person.health >= 30) {
      healthBarColor = Colors.orange;
    }
    if (person.person.health < 30) {
      healthBarColor = Colors.red;
    }
    Color? happinessBarColor;
    if (person.person.happiness > 70) {
      happinessBarColor = Colors.green;
    }
    if (person.person.happiness <= 70 && person.person.happiness >= 50) {
      happinessBarColor = Colors.yellow;
    }
    if (person.person.happiness < 50 && person.person.happiness >= 30) {
      happinessBarColor = Colors.orange;
    }
    if (person.person.happiness < 30) {
      happinessBarColor = Colors.red;
    }
    Color? appearenceBarColor;
    if (person.person.appearence > 70) {
      appearenceBarColor = Colors.green;
    }
    if (person.person.appearence <= 70 && person.person.appearence >= 50) {
      appearenceBarColor = Colors.yellow;
    }
    if (person.person.appearence < 50 && person.person.appearence >= 30) {
      appearenceBarColor = Colors.orange;
    }
    if (person.person.appearence < 30) {
      appearenceBarColor = Colors.red;
    }
    Color? intelligenceBarColor;
    if (person.person.intelligence > 70) {
      intelligenceBarColor = Colors.green;
    }
    if (person.person.intelligence <= 70 && person.person.intelligence >= 30) {
      intelligenceBarColor = Colors.yellow;
    }
    if (person.person.intelligence < 30) {
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
                            person.person.gender == Gender.male
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
                              width: (screenWidth - 60) *
                                  0.65 *
                                  0.01 *
                                  (person.person.health),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  person.person.health >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '${person.person.health}%',
                                              style: colorlessFontedStyle(
                                                16,
                                                person.person.gender ==
                                                        Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          person.person.health < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '${person.person.appearence}%',
                                      style: colorlessFontedStyle(
                                        16,
                                        person.person.gender == Gender.male
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
                            person.person.gender == Gender.male
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
                                  (person.person.happiness),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  person.person.happiness >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '${person.person.happiness}%',
                                              style: colorlessFontedStyle(
                                                16,
                                                person.person.gender ==
                                                        Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          person.person.happiness < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '${person.person.appearence}%',
                                      style: colorlessFontedStyle(
                                        16,
                                        person.person.gender == Gender.male
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
                            person.person.gender == Gender.male
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
                                  (person.person.appearence),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  person.person.appearence >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '${person.person.appearence}%',
                                              style: colorlessFontedStyle(
                                                16,
                                                person.person.gender ==
                                                        Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          person.person.appearence < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '${person.person.appearence}%',
                                      style: colorlessFontedStyle(
                                        16,
                                        person.person.gender == Gender.male
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
                            person.person.gender == Gender.male
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
                                  (person.person.intelligence),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  person.person.intelligence >= 25
                                      ? FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              '${person.person.intelligence}%',
                                              style: colorlessFontedStyle(
                                                16,
                                                person.person.gender ==
                                                        Gender.male
                                                    ? Colors.blue[900]
                                                    : Colors.pink[900],
                                              ),
                                            ),
                                          ),
                                        )
                                      : const Spacer(),
                                ],
                              )),
                          person.person.intelligence < 25
                              ? FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      '${person.person.intelligence}%',
                                      style: colorlessFontedStyle(
                                        16,
                                        person.person.gender == Gender.male
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
