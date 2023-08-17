// ignore_for_file: no_leading_underscores_for_local_identifiers, override_on_non_overriding_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/models/life.dart';
import 'package:my_life/providers/life_provider.dart';

import '../../../../models/relation.dart';
import 'child_custom_list_tile.dart';

class RelationDetailsScreen extends ConsumerStatefulWidget {
  final Relation relation;
  const RelationDetailsScreen({super.key, required this.relation});

  @override
  ConsumerState<RelationDetailsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<RelationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final _lifeProvider = ref.watch(lifeProvider);
    final family = _lifeProvider.life!.background!;
    var relation = widget.relation;
    Gender? _gender = _lifeProvider.life!.gender;
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor:
            _gender == Gender.male ? Colors.blue[100] : Colors.pink[100],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          toolbarHeight: MediaQuery.of(context).size.height * 0.08,
          title: Text('$relationName', style: whiteFontedStyle(22)),
          backgroundColor:
              _gender == Gender.male ? Colors.blue[700] : Colors.pink[700],
        ),
        body: ListView(
          children: [
            if (family.father != null)
              ChildRelationListTile(relation: relation),
            Container(
              color: const Color.fromARGB(225, 97, 97, 97),
              height: 20,
              child: Center(
                child: Text(
                  'Activities',
                  style: whiteFontedStyle(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
