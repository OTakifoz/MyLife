// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSpacer extends ConsumerWidget {
  const CustomSpacer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(height: 1, color: const Color.fromARGB(255, 69, 69, 69));
  }
}
