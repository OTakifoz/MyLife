// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';

import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/firebase_provider.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/custom_spacer.dart';

import 'package:my_life/widgets/main_screen/main_screen.dart';

import '../../../../models/life.dart';

class LivesScreen extends ConsumerStatefulWidget {
  const LivesScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LivesScreen> createState() => _LivesScreenState();
}

class _LivesScreenState extends ConsumerState<LivesScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final _lifeProvider = ref.watch(lifeProvider);
    final _firebaseProvider = ref.watch(firebaseProvider);
    List lives = _firebaseProvider.userLives;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, weight: 100),
          ),
          automaticallyImplyLeading: false,
          toolbarHeight: height(context) * 0.08,
          title: Text('Previous Lives', style: whiteFontedStyle(22, context)),
          backgroundColor: genderBasedWidgetColor(ref)),
      body: ListView.builder(
        itemCount: lives.length,
        itemBuilder: (BuildContext context, int index) {
          Life activeLife = lives[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                  title: Text(
                    '${activeLife.name!} ${activeLife.lastName!}',
                    style: colorlessFontedStyle(20, genderBasedTitleColor(ref)),
                  ),
                  onTap: () {
                    _lifeProvider.changeLives(lives[index]);

                    pushAndReplaceTo(context, const MainScreen());
                    setState(() {
                      lives = [];
                    });
                  }),
              const CustomSpacer(),
            ],
          );
        },
      ),
    );
  }
}
