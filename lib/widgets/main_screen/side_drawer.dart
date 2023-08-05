import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: unused_import
import 'package:my_life/models/pallette.dart';
import 'package:my_life/providers/life_provider.dart';

import '../../models/person.dart';

class SideDrawer extends ConsumerWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(lifeProvider);

    Color? personColor = person.person!.gender == Gender.male
        ? Colors.blue[700]
        : Colors.pink[700];

    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppBar(
            backgroundColor: personColor,
            toolbarHeight: MediaQuery.of(context).size.height * 0.08,
            title: Text(
              'Hello There!',
              style: whiteFontedStyle(20),
            ),
            automaticallyImplyLeading: false,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 45,
                  child: Flex(direction: Axis.horizontal, children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: person.person!.gender == Gender.male
                              ? Colors.blue[700]
                              : Colors.pink[700],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: const Text('Main Screen'),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
