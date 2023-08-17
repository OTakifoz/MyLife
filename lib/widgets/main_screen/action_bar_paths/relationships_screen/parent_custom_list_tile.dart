// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/models/relation.dart';
import 'package:my_life/widgets/main_screen/action_bar_paths/relationships_screen/relation_details_screen.dart';

import '../../../../models/life.dart';
import '../../../../providers/life_provider.dart';

class ParentRelationListTile extends ConsumerWidget {
  final Relation relation;
  const ParentRelationListTile({super.key, required this.relation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Color? opinionBarColor;
    if (relation.opinion > 50) {
      opinionBarColor = Colors.green;
    }
    if (relation.opinion <= 50 && relation.opinion >= 20) {
      opinionBarColor = Colors.yellow;
    }
    if (relation.opinion < 20 && relation.opinion >= 10) {
      opinionBarColor = Colors.orange;
    }
    if (relation.opinion < 10) {
      opinionBarColor = Colors.red;
    }

    String? relationName;

    if (relation.relationType == RelationType.mother) {
      relationName = 'Mother';
    } else if (relation.relationType == RelationType.father) {
      relationName = 'Father';
    } else if (relation.relationType == RelationType.brother) {
      relationName = 'Brother';
    } else if (relation.relationType == RelationType.sister) {
      relationName = 'Sister';
    }

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
          Text('${relation.name!} ${relation.lastName!}($relationName)',
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
                        color: Colors.white,
                        height: 10,
                        width: screenWidth * 0.5,
                      ),
                      Container(
                        color: opinionBarColor,
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
