import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_life/widgets/start_screen/start_screen.dart';

void main() {
  runApp(
    const ProviderScope(
        child: MaterialApp(
      home: StartScreen(),
    )),
  );
}
