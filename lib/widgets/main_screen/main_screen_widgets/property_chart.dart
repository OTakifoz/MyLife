// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';

class PropertyChart extends ConsumerWidget {
  const PropertyChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(lifeProvider);
    var _health = person.life!.health;
    var _happiness = person.life!.happiness;
    var _appearence = person.life!.appearence;
    var _intelligence = person.life!.intelligence;
    const barHeight = 20.0;
    var barWidth = (width(context) - 30) * 0.60;
    var textWidth = (width(context) - 30) * 0.40;

    return Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        height: height(context) * 0.25,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: textWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          style: colorlessFontedStyle(
                              16, genderBasedTitleColor(ref)),
                          'Health',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            height: barHeight,
                            child: Image.asset('assets/icons/heart-icon.png')),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: barWidth,
                    height: barHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: propertyBasedBarColor(_health),
                            ),
                            height: barHeight,
                            width: barWidth * 0.01 * (_health),
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
                                              genderBasedTitleColor(ref),
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '$_appearence%',
                                    style: colorlessFontedStyle(
                                      16,
                                      genderBasedTitleColor(ref),
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
              Row(
                children: [
                  SizedBox(
                    width: textWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          style: colorlessFontedStyle(
                            16,
                            genderBasedTitleColor(ref),
                          ),
                          'Happiness',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            height: barHeight,
                            child: Image.asset('assets/icons/happy-icon.png')),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: barWidth,
                    height: barHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: propertyBasedBarColor(_happiness),
                            ),
                            height: barHeight,
                            width: barWidth * 0.01 * (_happiness),
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
                                              genderBasedTitleColor(ref),
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '$_appearence%',
                                    style: colorlessFontedStyle(
                                      16,
                                      genderBasedTitleColor(ref),
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
              Row(
                children: [
                  SizedBox(
                    width: textWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          style: colorlessFontedStyle(
                            16,
                            genderBasedTitleColor(ref),
                          ),
                          'Looks',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            height: barHeight,
                            child: Image.asset('assets/icons/flame-icon.png')),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: barWidth,
                    height: barHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: propertyBasedBarColor(_appearence),
                            ),
                            height: barHeight,
                            width: barWidth * 0.01 * (_appearence),
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
                                              genderBasedTitleColor(ref),
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '$_appearence%',
                                    style: colorlessFontedStyle(
                                      16,
                                      genderBasedTitleColor(ref),
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
              Row(
                children: [
                  SizedBox(
                    width: textWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          style: colorlessFontedStyle(
                            16,
                            genderBasedTitleColor(ref),
                          ),
                          'Smarts',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            height: barHeight,
                            child: Image.asset('assets/icons/brain-icon.png')),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: barWidth,
                    height: barHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: propertyBasedBarColor(_intelligence),
                            ),
                            height: barHeight,
                            width: barWidth * 0.01 * (_intelligence),
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
                                              genderBasedTitleColor(ref),
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '$_intelligence%',
                                    style: colorlessFontedStyle(
                                      16,
                                      genderBasedTitleColor(ref),
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
            ],
          ),
        ));
  }
}
