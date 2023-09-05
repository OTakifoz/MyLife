// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_life/providers/start_screen_provider.dart';
import 'package:random_name_generator/random_name_generator.dart';
import '../models/life.dart';
import '../models/relation.dart';
import '../providers/life_provider.dart';

Gender gender(WidgetRef ref) {
  final _lifeProvider = ref.watch(lifeProvider);
  return _lifeProvider.life!.gender!;
}

Color? genderBasedTitleColor(WidgetRef ref) {
  return gender(ref) == Gender.male ? Colors.blue[900] : Colors.pink[900];
}

Color? genderBasedWidgetColor(WidgetRef ref) {
  return gender(ref) == Gender.male ? Colors.blue[700] : Colors.pink[700];
}

void pushTo(BuildContext context, Widget destination) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => destination,
    ),
  );
}

void pushAndReplaceTo(BuildContext context, Widget destination) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => destination,
    ),
  );
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Color propertyBasedBarColor(property) {
  if (property > 50) {
    return Colors.green;
  }
  if (property <= 50 && property >= 25) {
    return Colors.yellow;
  }
  if (property < 25 && property >= 10) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

String pronoun1(WidgetRef ref) {
  return gender(ref) == Gender.male ? 'him' : 'her';
}

String pronoun2(WidgetRef ref) {
  return gender(ref) == Gender.male ? 'his' : 'her';
}

String relationName(Relationship relation) {
  if (relation.relationType == RelationType.mother &&
      relation.closeness == Closeness.blood) {
    return 'MOTHER';
  } else if (relation.relationType == RelationType.mother &&
      relation.closeness == Closeness.step) {
    return 'STEPMOTHER';
  } else if (relation.relationType == RelationType.father &&
      relation.closeness == Closeness.step) {
    return 'STEPFATHER';
  } else if (relation.relationType == RelationType.father) {
    return 'FATHER';
  } else if (relation.relationType == RelationType.brother &&
      relation.closeness == Closeness.blood) {
    return 'BROTHER';
  } else if (relation.relationType == RelationType.brother &&
      relation.closeness == Closeness.step) {
    return 'STEPBROTHER';
  } else if (relation.relationType == RelationType.brother &&
      relation.closeness == Closeness.half) {
    return 'HALF BROTHER';
  } else if (relation.relationType == RelationType.sister &&
      relation.closeness == Closeness.blood) {
    return 'SISTER';
  } else if (relation.relationType == RelationType.sister &&
      relation.closeness == Closeness.half) {
    return 'HALF SISTER';
  } else {
    return 'STEPSISTER';
  }
}

RandomNames randomNameBase(WidgetRef ref) {
  final startScreen = ref.watch(startScreenProvider);
  return RandomNames(startScreen.life.currentCountry != null
      ? startScreen.life.currentCountry!.zone
      : Zone.us);
}
