// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/life.dart';
import '../../../../providers/life_provider.dart';

class CustomSpacer extends ConsumerWidget {
  const CustomSpacer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _lifeProvider = ref.watch(lifeProvider);
    Gender? _gender = _lifeProvider.life!.gender;
    return Container(
      height: 2,
      color: _gender == Gender.male ? Colors.blue[700] : Colors.pink[700],
    );
  }
}
