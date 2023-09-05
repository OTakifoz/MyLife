// ignore_for_file: no_leading_underscores_for_local_identifiers, override_on_non_overriding_member, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:my_life/references/pallette.dart';
import 'package:my_life/providers/life_provider.dart';
import 'package:my_life/references/random_generators.dart';
import 'package:my_life/widgets/main_screen/main_screen.dart';
import '../../../../references/extentions.dart';
import '../../../../models/relation.dart';
import 'child_custom_list_tile.dart';
import 'custom_spacer.dart';

class RelationDetailsScreen extends ConsumerStatefulWidget {
  final Relationship relation;
  const RelationDetailsScreen({super.key, required this.relation});

  @override
  ConsumerState<RelationDetailsScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<RelationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var relation = widget.relation;

    final _lifeProvider = ref.watch(lifeProvider);
    final family = _lifeProvider.life!.family!;

    void showAppretiationDialog(int increment, int maxIncrement) {
      showDialog(
        context: context,
        builder: (context) => FittedBox(
          fit: BoxFit.fitWidth,
          child: AlertDialog(
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                  child: const Text('OK'))
            ],
            title: Text(
              textAlign: TextAlign.center,
              'True Love',
              style: colorlessFontedStyle(20, genderBasedTitleColor(ref)),
            ),
            content: SizedBox(
              width: width(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'You called your ${relationName(relation).toLowerCase()} sweet!',
                        style: colorlessFontedStyle(
                            14, genderBasedTitleColor(ref)),
                      ),
                    ),
                  ),
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '${pronoun2(ref).capitalize()} appretiation',
                        style: colorlessFontedStyle(
                            14, genderBasedTitleColor(ref)),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: 20,
                          width: width(context) * 0.3,
                          color: Colors.grey[300],
                        ),
                        Container(
                          height: 20,
                          width: width(context) * 0.3 * increment * 0.1,
                          color: propertyBasedBarColor(
                              increment / maxIncrement * 100),
                        ),
                      ],
                    )
                  ])
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SizedBox(
      height: height(context),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            toolbarHeight: height(context) * 0.08,
            centerTitle: true,
            title: Text(relationName(relation),
                style: whiteFontedStyle(22, context)),
            backgroundColor: genderBasedWidgetColor(ref)),
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
                  style: whiteFontedStyle(12, context),
                ),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: SizedBox(
                width: 60,
                height: 48,
                child: Image.asset('assets/icons/salary-icon.png'),
              ),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitleTextStyle: whiteFontedStyle(16, context),
              subtitle: Text('Ask ${pronoun1(ref)} for money'),
              title: const Text(
                textAlign: TextAlign.start,
                'Ask For Money',
              ),
            ),
            const CustomSpacer(),
            ListTile(
              onTap: () {
                final increment = randomMinMaxInteger(1, 10);
                relation.opinion = relation.opinion + increment;
                showAppretiationDialog(increment, 10);
              },
              leading: SizedBox(
                  width: 60,
                  height: 48,
                  child: Image.asset('assets/icons/kiss-icon.png')),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitleTextStyle: whiteFontedStyle(16, context),
              subtitle: Text('Give ${pronoun1(ref)} a compliment'),
              title: const Text(
                textAlign: TextAlign.start,
                'Compliment',
              ),
            ),
            const CustomSpacer(),
            ListTile(
              leading: SizedBox(
                  width: 60,
                  height: 48,
                  child: Image.asset('assets/icons/chat-icon.png')),
              subtitleTextStyle: whiteFontedStyle(16, context),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitle: Text('Have a conversation with ${pronoun1(ref)}'),
              title: const Text(
                textAlign: TextAlign.start,
                'Conversation',
              ),
            ),
            const CustomSpacer(),
            ListTile(
              leading: SizedBox(
                  width: 60,
                  height: 48,
                  child: SizedBox(
                      width: 48,
                      child: Image.asset('assets/icons/giftbox-icon.png'))),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitleTextStyle: whiteFontedStyle(16, context),
              subtitle: Text('Send ${pronoun1(ref)} a gift'),
              title: const Text(
                textAlign: TextAlign.start,
                'Gift',
              ),
            ),
            const CustomSpacer(),
            ListTile(
              leading: SizedBox(
                  width: 60,
                  height: 48,
                  child: Image.asset('assets/icons/censored-icon.png')),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitleTextStyle: whiteFontedStyle(16, context),
              subtitle: Text('Insult ${pronoun1(ref)}'),
              title: const Text(
                textAlign: TextAlign.start,
                'Insult',
              ),
            ),
            const CustomSpacer(),
            ListTile(
              leading: SizedBox(
                  width: 60,
                  height: 48,
                  child: Image.asset('assets/icons/theatre-icon.png')),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitleTextStyle: whiteFontedStyle(16, context),
              subtitle: Text('Go to the movies with ${pronoun1(ref)}'),
              title: const Text(
                textAlign: TextAlign.start,
                'Movie Theatre',
              ),
            ),
            const CustomSpacer(),
            ListTile(
              leading: SizedBox(
                  width: 60,
                  height: 48,
                  child: Image.asset('assets/icons/coffee-break-icon.png')),
              titleTextStyle:
                  colorlessFontedStyle(20, genderBasedTitleColor(ref)),
              subtitleTextStyle: whiteFontedStyle(16, context),
              subtitle: Text('Spend time with ${pronoun1(ref)}'),
              title: const Text(
                textAlign: TextAlign.start,
                'Spend Time',
              ),
            ),
            const CustomSpacer(),
          ],
        ),
      ),
    );
  }
}
