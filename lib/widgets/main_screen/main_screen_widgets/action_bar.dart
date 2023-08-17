import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/relationships_screen.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double widgetWidth = MediaQuery.of(context).size.width - 20;
    double widgetHeight = MediaQuery.of(context).size.height * 0.1;
    double blankWidth = widgetWidth - widgetHeight * 1.25 - 14;
    return Stack(alignment: Alignment.center, children: [
      Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 67, 116, 75),
          borderRadius: BorderRadius.all(
            Radius.circular(widgetHeight / 3),
          ),
        ),
        width: widgetWidth,
        height: widgetHeight,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 10,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((widgetHeight - 10) / 3),
                      bottomLeft: Radius.circular((widgetHeight - 10) / 3),
                    ),
                  ),
                ),
                child: const Text(''),
              ),
            ),
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 10,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
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
            Container(
              width: widgetHeight * 1.25,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 77, 146, 64),
              ),
            ),
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RelationShipsScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
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
                        style: whiteFontedStyle(7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: (blankWidth / 4),
              height: widgetHeight - 10,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular((widgetHeight - 10) / 3),
                      bottomRight: Radius.circular((widgetHeight - 10) / 3),
                    ),
                  ),
                ),
                child: const Text(''),
              ),
            ),
          ]),
        ),
      ),
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
