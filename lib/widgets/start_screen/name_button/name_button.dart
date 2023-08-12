import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/widgets/start_screen/name_button/name_button_child.dart';
import 'package:my_life/widgets/start_screen/name_button/name_dialog.dart';
import 'package:random_name_generator/random_name_generator.dart';

import '../../../models/life.dart';
import '../../../providers/start_screen_provider.dart';

class NameButton extends ConsumerStatefulWidget {
  const NameButton({super.key});

  @override
  ConsumerState<NameButton> createState() => _NameButtonState();
}

class _NameButtonState extends ConsumerState<NameButton> {
  void showNameDialog() {
    showDialog(context: context, builder: (context) => const NameDialog());
  }

  @override
  Widget build(BuildContext context) {
    final startScreen = ref.watch(startScreenProvider);
    return SizedBox(
      height: 60,
      width: double.maxFinite,
      child: Flex(direction: Axis.vertical, children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showNameDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: startScreen.life.gender == Gender.male
                  ? Colors.blue[700]
                  : Colors.pink[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 48,
                  height: 48,
                ),
                const NameButtonChild(),
                IconButton(
                    iconSize: 32,
                    onPressed: () {
                      var randomNames = RandomNames(
                          startScreen.life.currentCountry != null
                              ? startScreen.life.currentCountry!.zone
                              : Zone.us);
                      if (startScreen.life.gender == Gender.male) {
                        startScreen.updateName(randomNames.manName());
                      } else if (startScreen.life.gender == Gender.female) {
                        startScreen.updateName(randomNames.womanName());
                      }

                      startScreen.updateLastName(randomNames.surname());
                    },
                    icon: const Icon(Icons.autorenew))
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
