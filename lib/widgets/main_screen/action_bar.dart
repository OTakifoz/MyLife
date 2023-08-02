import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/providers/person_provider.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    double widgetWidth = MediaQuery.of(context).size.width - 20;
    double widgetHeight = MediaQuery.of(context).size.height * 0.08;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 67, 116, 75),
        borderRadius: BorderRadius.all(
          Radius.circular(widgetWidth / 2 + 1),
        ),
      ),
      width: widgetWidth,
      height: widgetHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: (widgetWidth - widgetHeight - 30) / 4,
              height: widgetHeight - 10,
              child: ElevatedButton(
                onPressed: () {
                  person.incrementAppearence(1);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widgetWidth * 0.1),
                      bottomLeft: Radius.circular(widgetWidth * 0.1),
                    ),
                  ),
                ),
                child: const Text(''),
              ),
            ),
            SizedBox(
              width: (widgetWidth - widgetHeight - 30) / 4,
              height: widgetHeight - 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {
                  person.incrementAppearence(-1);
                },
                child: const Text(''),
              ),
            ),
            Container(
                height: widgetHeight,
                width: widgetHeight,
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(widgetWidth * 0.1),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/plus-sign.png',
                  ),
                )),
            SizedBox(
              width: (widgetWidth - widgetHeight - 30) / 4,
              height: widgetHeight - 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                ),
                onPressed: () {},
                child: const Text(''),
              ),
            ),
            SizedBox(
              width: (widgetWidth - widgetHeight - 30) / 4,
              height: widgetHeight - 10,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(widgetWidth * 0.1),
                      bottomRight: Radius.circular(widgetWidth * 0.1),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text(''),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
