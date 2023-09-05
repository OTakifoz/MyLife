import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/pallette.dart';

import '../../../providers/start_screen_provider.dart';

class CountrySelectionButtonChild extends ConsumerWidget {
  const CountrySelectionButtonChild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startScreen = ref.watch(startScreenProvider);
    if (startScreen.life.currentCountry != null) {
      return Text(startScreen.life.currentCountry!.name,
          style: whiteFontedStyle(20, context));
    } else {
      return Text('Select a Country', style: whiteFontedStyle(20, context));
    }
  }
}
