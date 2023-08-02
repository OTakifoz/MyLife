import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/widgets/start_screen/name_button/name_button_child.dart';
import 'package:my_life/widgets/start_screen/name_button/name_dialog.dart';
import 'dart:math';
import '../../../lists/name_list.dart';
import '../../../models/person.dart';
import '../../../providers/person_provider.dart';

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
    final randomName = Random();
    final randomLastName = Random();
    final person = ref.watch(personProvider);
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
              backgroundColor: person.person.gender == Gender.male
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
                      person.updateName(
                        names[randomName.nextInt(lastnames.length)],
                      );
                      person.updateLastName(
                        names[randomLastName.nextInt(lastnames.length)],
                      );
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
