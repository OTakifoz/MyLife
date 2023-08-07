import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/providers/life_provider.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(lifeProvider);
    double widgetWidth = MediaQuery.of(context).size.width - 20;
    double widgetHeight = MediaQuery.of(context).size.height * 0.08;
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
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: ((widgetWidth - widgetHeight - 30) / 4),
                height: widgetHeight - 10,
                child: ElevatedButton(
                  onPressed: () {
                    person.incrementAppearence(1);
                  },
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
                width: ((widgetWidth - widgetHeight - 30) / 4) + 10,
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
              SizedBox(
                height: widgetHeight,
                width: widgetHeight - 20,
              ),
              SizedBox(
                width: ((widgetWidth - widgetHeight - 30) / 4) + 10,
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
                width: ((widgetWidth - widgetHeight - 30) / 4),
                height: widgetHeight - 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 77, 146, 64),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular((widgetHeight - 10) / 3),
                        bottomRight: Radius.circular((widgetHeight - 10) / 3),
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
      ),
      Container(
          height: widgetHeight * 1.5,
          width: widgetHeight * 1.5,
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
