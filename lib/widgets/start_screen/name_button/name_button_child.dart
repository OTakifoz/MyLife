import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/pallette.dart';

import '../../../models/life.dart';
import '../../../providers/start_screen_provider.dart';

class NameButtonChild extends ConsumerWidget {
  const NameButtonChild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startScreen = ref.watch(startScreenProvider);
    if (startScreen.life.name == null || startScreen.life.lastName == null) {
      return Text('Type a Name',
          style: colorlessFontedStyle(
              20,
              startScreen.life.gender == Gender.male
                  ? Colors.blue[300]
                  : Colors.pink[300]));
    } else {
      return Center(
        child: Text('${startScreen.life.name} ${startScreen.life.lastName}',
            style: whiteFontedStyle(20, context)),
      );
    }
  }
}
