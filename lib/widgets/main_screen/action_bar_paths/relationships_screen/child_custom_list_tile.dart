// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/models/relation.dart';

import '../../../../models/life.dart';
import '../../../../providers/life_provider.dart';

class ChildRelationListTile extends ConsumerWidget {
  final Relationship relation;
  const ChildRelationListTile({super.key, required this.relation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final _lifeProvider = ref.watch(lifeProvider);
    Gender? gender = _lifeProvider.life!.gender;
    Color? genderTitleColor =
        gender == Gender.male ? Colors.blue[900] : Colors.pink[900];
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(15),
      width: screenWidth,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('${relation.name!} ${relation.lastName!}(Age ${relation.age})',
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
                      color: Colors.grey[300],
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
    );
  }
}
