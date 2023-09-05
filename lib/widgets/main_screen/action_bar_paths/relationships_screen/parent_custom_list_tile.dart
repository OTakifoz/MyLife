// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/references/extentions.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/models/relation.dart';
import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/relation_details_screen.dart';

import '../../../../models/life.dart';
import '../../../../providers/life_provider.dart';
import '../../../../references/frequently_used_variables.dart';

class ParentRelationListTile extends ConsumerWidget {
  final Relationship relation;
  const ParentRelationListTile({super.key, required this.relation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final _lifeProvider = ref.watch(lifeProvider);
    Gender? gender = _lifeProvider.life!.gender;
    Color? genderTitleColor =
        gender == Gender.male ? Colors.blue[900] : Colors.pink[900];
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RelationDetailsScreen(relation: relation),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(15),
        width: screenWidth,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
              '${relation.name!} ${relation.lastName!}(${relationName(relation).toLowerCase().capitalize()})',
              style: colorlessFontedStyle(20, genderTitleColor)),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Text(
                  'Opinion',
                  style: colorlessFontedStyle(12, genderTitleColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        color: Colors.grey[200],
                        height: 10,
                        width: screenWidth * 0.5,
                      ),
                      Container(
                        color: propertyBasedBarColor(relation.opinion),
                        height: 10,
                        width: screenWidth * 0.5 * relation.opinion * 0.01,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
