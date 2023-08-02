import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';

import '../../../models/person.dart';
import '../../../providers/person_provider.dart';

class NameButtonChild extends ConsumerWidget {
  const NameButtonChild({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personProvider);
    if (person.person.name == null || person.person.lastName == null) {
      return Text('Type a Name',
          style: colorlessFontedStyle(
              20,
              person.person.gender == Gender.male
                  ? Colors.blue[300]
                  : Colors.pink[300]));
    } else {
      return Center(
        child: Text('${person.person.name} ${person.person.lastName}',
            style: whiteFontedStyle(20)),
      );
    }
  }
}
