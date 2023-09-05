import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/references/random_generators.dart';

import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/relationships_screen.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double widgetHeight = height(context) * 0.1;
    double blankWidth = width(context) - widgetHeight * 1.25 - 14;
    return Stack(alignment: Alignment.center, children: [
      Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 67, 116, 75),
            borderRadius: BorderRadius.zero),
        width: width(context),
        height: widgetHeight,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 6,
              child: ElevatedButton(
                onPressed: () {
                  randomFamilySituation(18, 18);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(''),
              ),
            ),
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 6,
              child: ElevatedButton(
                onPressed: () {
                  randomFamilySituation(16, 16);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.zero,
                    ),
                  ),
                ),
                child: const Text(''),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Container(
                width: widgetHeight * 1.25,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 77, 146, 64),
                ),
              ),
            ),
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 6,
              child: ElevatedButton(
                onPressed: () {
                  pushTo(context, const RelationShipsScreen());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.all(0),
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.zero,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(0),
                      height: widgetHeight * 0.33,
                      width: widgetHeight * 0.33,
                      child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset('assets/icons/heart-icon.png')),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Relationships',
                        style: whiteFontedStyle(7, context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 6,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                child: const Text(''),
              ),
            ),
          ]),
        ),
      ),
      Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            height: widgetHeight * 0.125,
            color: Colors.grey[200],
          )),
      Container(
          height: widgetHeight * 1.25,
          width: widgetHeight * 1.25,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 88, 199, 0),
            border: Border.all(
                color: const Color.fromARGB(255, 67, 116, 75), width: 7.5),
            borderRadius: BorderRadius.all(
              Radius.circular(widgetHeight * 0.75),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/images/plus-sign.png',
            ),
          )),
    ]);
  }
}
