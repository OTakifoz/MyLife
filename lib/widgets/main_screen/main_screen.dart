import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/models/pallette.dart';
import 'package:my_life/models/person.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/action_bar.dart';
import 'package:my_life/widgets/main_screen/property_chart.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final person = ref.watch(lifeProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        title: Text(
            'MyLife - '
            '${person.person!.name} '
            '${person.person!.lastName}',
            style: whiteFontedStyle(22)),
        backgroundColor: person.person!.gender == Gender.male
            ? Colors.blue[700]
            : Colors.pink[700],
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: person.person!.gender == Gender.male
                ? Colors.blue[100]
                : Colors.pink[100],
          ),
          child: const Column(
            children: [Spacer(), ActionBar(), PropertyChart()],
          ),
        ),
      ),
    );
  }
}
