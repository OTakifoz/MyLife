import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';

import '../../../providers/person_provider.dart';

class CountrySelectionButtonChild extends ConsumerWidget {
  const CountrySelectionButtonChild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    if (person.person.currentCountry != null) {
      return Text(person.person.currentCountry!.name,
          style: whiteFontedStyle(20));
    } else {
      return Text('Select a Country', style: whiteFontedStyle(20));
    }
  }
}
