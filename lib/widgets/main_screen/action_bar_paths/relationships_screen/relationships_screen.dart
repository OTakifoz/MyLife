// ignore_for_file: no_leading_underscores_for_local_identifiers, override_on_non_overriding_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/parent_custom_list_tile.dart';
import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/custom_spacer.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';

class RelationShipsScreen extends ConsumerStatefulWidget {
  const RelationShipsScreen({super.key});

  @override
  ConsumerState<RelationShipsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<RelationShipsScreen> {
  @override
  Widget build(BuildContext context) {
    final _lifeProvider = ref.watch(lifeProvider);
    final family = _lifeProvider.life!.family!;

    return SizedBox(
      height: height(context),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
            ),
            toolbarHeight: height(context) * 0.08,
            title: Text('Relationships', style: whiteFontedStyle(22, context)),
            backgroundColor: genderBasedWidgetColor(ref)),
        body: ListView(
          children: [
            Container(
              color: const Color.fromARGB(225, 97, 97, 97),
              height: 20,
              child: Center(
                child: Text(
                  'Parents',
                  style: whiteFontedStyle(12, context),
                ),
              ),
            ),
            if (family.mother != null)
              ParentRelationListTile(relation: family.mother!),
            const CustomSpacer(),
            if (family.father != null)
              ParentRelationListTile(relation: family.father!),
            Container(
              color: const Color.fromARGB(225, 97, 97, 97),
              height: 20,
              child: Center(
                child: Text(
                  'Siblings',
                  style: whiteFontedStyle(12, context),
                ),
              ),
            ),
            if (family.sibling1 != null)
              ParentRelationListTile(relation: family.sibling1!),
            const CustomSpacer(),
          ],
        ),
      ),
    );
  }
}
