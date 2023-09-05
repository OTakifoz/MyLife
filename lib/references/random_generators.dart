// ignore_for_file: unused_import

import 'dart:math';
import 'package:statistics/statistics.dart';

import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Family;
import 'package:my_life/providers/start_screen_provider.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:uuid/uuid.dart';

import '../models/family.dart';
import '../models/life.dart';
import '../models/relation.dart';

int randomMinMaxInteger(int min, int max) {
  Random random = Random();

  random = Random();
  int randomInt = min + random.nextInt(max - min);

  return randomInt;
}

bool percentPossibliity(int percentage) {
  if (percentage < randomMinMaxInteger(0, 99)) {
    return true;
  } else {
    return false;
  }
}

int getAge(double min, double max, dynamic mid) {
  if (mid == 'center') {
    mid = (max - min) / 2;
  }
  final List<int> ages = [];
  for (int i = min.round(); i <= max; i++) {
    ages.add(i);
  }
  final List<double> probabilities = getProbabilitiesList(
    5,
    20,
    (max - min).round(),
    mid.round(),
  );
  final List<double> normalizedProbabilities =
      normalizeProbabilities(probabilities);

  final Random random = Random();
  final double randomNumber =
      random.nextDouble(); // 0 ile 1 arasında rastgele bir sayı

  int index = 0;
  double totalProbability = 0;

  for (int i = 0; i < normalizedProbabilities.length; i++) {
    totalProbability += normalizedProbabilities[i];
    if (randomNumber <= totalProbability) {
      index = i;
      break;
    }
  }

  return ages[index];
}

double getRandom(double min, double max, double mid) {
  final List<double> events = [];
  for (int i = min.round(); i <= max; i++) {
    events.add(i.toDouble());
  }
  final List<double> probabilities = getProbabilitiesList(
    5,
    20,
    (max - min).round(),
    mid.round(),
  );
  final List<double> normalizedProbabilities =
      normalizeProbabilities(probabilities);

  final Random random = Random();
  final double randomNumber =
      random.nextDouble(); // 0 ile 1 arasında rastgele bir sayı

  int index = 0;
  double totalProbability = 0;

  for (int i = 0; i < normalizedProbabilities.length; i++) {
    totalProbability += normalizedProbabilities[i];
    if (randomNumber <= totalProbability) {
      index = i;
      break;
    }
  }

  return events[index];
}

String randomFamilySituation(dynamic motherAge, dynamic fatherAge) {
  final List<String> situations = (motherAge >= 18 && fatherAge >= 18)
      ? [
          'Married',
          'StepmomAndDad',
          'MomAndStepdad',
          'SingleMom',
          'SingleDad',
          'Orphanage',
        ]
      : ['Married'];

  final List<double> probabilities = (motherAge >= 18 && fatherAge >= 18)
      ? [
          40,
          15,
          15,
          10,
          5,
          5,
        ]
      : [100];
  final List<double> normalizedProbabilities =
      normalizeProbabilities(probabilities);

  final Random random = Random();
  final double randomNumber =
      random.nextDouble(); // 0 ile 1 arasında rastgele bir sayı

  int index = 0;
  double totalProbability = 0;

  for (int i = 0; i < normalizedProbabilities.length; i++) {
    totalProbability += normalizedProbabilities[i];
    if (randomNumber <= totalProbability) {
      index = i;
      break;
    }
  }

  return situations[index];
}

int getMotherAge() {
  return getAge(16, 45, 10);
}

int getFatherAge(int motherAge) {
  if (motherAge < 18) {
    return randomMinMaxInteger(16, 17);
  } else if (percentPossibliity(10)) {
    return getAge(18, motherAge.toDouble(), 'center');
  } else {
    return getAge(motherAge.toDouble(), 50, 5);
  }
}

List<double> normalizeProbabilities(List<double> probabilities) {
  final double total = probabilities.reduce((a, b) => a + b);
  return probabilities.map((p) => p / total).toList();
}

Family createRandomFamily(WidgetRef ref) {
  final startScreen = ref.watch(startScreenProvider);

  dynamic motherAge = getMotherAge();
  dynamic fatherAge = getFatherAge(motherAge).round();
  final String familySituation = randomFamilySituation(motherAge, fatherAge);
  final familyName = startScreen.life.lastName;
  Relationship? mother;
  Relationship? father;
  Relationship? sibling1;
  Relationship? sibling2;
  Relationship? sibling3;

  if (familySituation == 'Married') {
    bool motherHasFatherLastName = percentPossibliity(75);
    String motherId = const Uuid().v4();
    String fatherId = const Uuid().v4();
    String siblingId1 = const Uuid().v4();
    String siblingId2 = const Uuid().v4();
    String siblingId3 = const Uuid().v4();

    mother = Relationship(
        age: motherAge,
        gender: Gender.female,
        opinion: getRandom(10, 100, 50),
        lastName: motherHasFatherLastName
            ? familyName
            : randomNameBase(ref).surname(),
        name: randomNameBase(ref).womanName(),
        uid: motherId,
        closeness: Closeness.blood,
        relationType: RelationType.mother);
    father = Relationship(
        age: fatherAge,
        gender: Gender.male,
        opinion: getRandom(10, 100, 50),
        lastName: familyName,
        name: randomNameBase(ref).manName(),
        uid: fatherId,
        closeness: Closeness.blood,
        relationType: RelationType.father);
    if (fatherAge > 25 && motherAge > 25 && percentPossibliity(50)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling1 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 20),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId1,
          closeness: Closeness.blood,
          relationType: relationType);
    }
    if (sibling1 != null &&
        fatherAge > 27 &&
        motherAge > 27 &&
        percentPossibliity(33)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling2 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 22),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId2,
          closeness: Closeness.blood,
          relationType: relationType);
    }
    if (sibling2 != null &&
        fatherAge > 30 &&
        motherAge > 30 &&
        percentPossibliity(20)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling3 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 25),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId3,
          closeness: Closeness.blood,
          relationType: relationType);
    }
  }
  if (familySituation == 'StepmomAndDad') {
    String motherId = const Uuid().v4();
    String fatherId = const Uuid().v4();
    String siblingId1 = const Uuid().v4();
    String siblingId2 = const Uuid().v4();
    String siblingId3 = const Uuid().v4();

    mother = Relationship(
        age: motherAge,
        gender: Gender.female,
        opinion: getRandom(10, 100, 50),
        lastName: randomNameBase(ref).surname(),
        name: randomNameBase(ref).womanName(),
        uid: motherId,
        closeness: Closeness.step,
        relationType: RelationType.mother);
    father = Relationship(
        age: fatherAge,
        gender: Gender.male,
        opinion: getRandom(10, 100, 50),
        lastName: familyName,
        name: randomNameBase(ref).manName(),
        uid: fatherId,
        closeness: Closeness.blood,
        relationType: RelationType.father);
    if (fatherAge > 25 && motherAge > 25 && percentPossibliity(33)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling1 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 20),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId1,
          closeness: Closeness.blood,
          relationType: relationType);
    }
    if (sibling1 != null &&
        fatherAge > 27 &&
        motherAge > 27 &&
        percentPossibliity(20)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling2 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 22),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId2,
          closeness: Closeness.blood,
          relationType: relationType);
    }
    if (sibling2 != null &&
        fatherAge > 30 &&
        motherAge > 30 &&
        percentPossibliity(10)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling3 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 25),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId3,
          closeness: Closeness.blood,
          relationType: relationType);
    }
  }

  if (familySituation == 'MomAndStepdad') {
    String motherId = const Uuid().v4();
    String fatherId = const Uuid().v4();
    String siblingId1 = const Uuid().v4();
    String siblingId2 = const Uuid().v4();
    String siblingId3 = const Uuid().v4();

    mother = Relationship(
        age: motherAge,
        gender: Gender.female,
        opinion: getRandom(10, 100, 50),
        lastName: randomNameBase(ref).surname(),
        name: randomNameBase(ref).womanName(),
        uid: motherId,
        closeness: Closeness.blood,
        relationType: RelationType.mother);
    father = Relationship(
        age: fatherAge,
        gender: Gender.male,
        opinion: getRandom(10, 100, 50),
        lastName: familyName,
        name: randomNameBase(ref).manName(),
        uid: fatherId,
        closeness: Closeness.step,
        relationType: RelationType.father);
    if (fatherAge > 25 && motherAge > 25 && percentPossibliity(33)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling1 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 20),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId1,
          closeness: Closeness.blood,
          relationType: relationType);
    }
    if (sibling1 != null &&
        fatherAge > 27 &&
        motherAge > 27 &&
        percentPossibliity(20)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling2 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 22),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId2,
          closeness: Closeness.blood,
          relationType: relationType);
    }
    if (sibling2 != null &&
        fatherAge > 30 &&
        motherAge > 30 &&
        percentPossibliity(10)) {
      RelationType? relationType;
      final gender = Gender.values[Random().nextInt(Gender.values.length)];
      gender == Gender.male
          ? relationType = RelationType.brother
          : RelationType.sister;

      sibling3 = Relationship(
          age: randomMinMaxInteger(1, motherAge - 25),
          gender: gender,
          opinion: getRandom(10, 100, 50),
          lastName: familyName,
          name: randomNameBase(ref).manName(),
          uid: siblingId3,
          closeness: Closeness.blood,
          relationType: relationType);
    }
  }

  if (familySituation == 'SingleMom') {
    String uuid = const Uuid().v4();
    mother = Relationship(
        age: motherAge,
        gender: Gender.female,
        opinion: getRandom(10, 100, 50),
        lastName: randomNameBase(ref).surname(),
        name: randomNameBase(ref).womanName(),
        uid: uuid,
        closeness: Closeness.blood,
        relationType: RelationType.mother);
  }

  if (familySituation == 'SingleDad') {
    String uuid = const Uuid().v4();

    father = Relationship(
        age: fatherAge,
        gender: Gender.male,
        opinion: getRandom(10, 100, 50),
        lastName: familyName,
        name: randomNameBase(ref).manName(),
        uid: uuid,
        closeness: Closeness.blood,
        relationType: RelationType.father);
  }

  if (familySituation == 'Orphanage') {}
  return Family(
      familyName: familyName,
      father: father,
      mother: mother,
      sibling1: sibling1,
      sibling2: sibling2,
      sibling3: sibling3);
}

List<double> generateDescendingNumbers(
    double firstNumber, double lastNumber, int totalCount) {
  List<double> numbers = [];
  double difference = lastNumber - firstNumber;
  double step = difference / (totalCount);

  for (int i = 0; i < totalCount; i++) {
    numbers
        .add(double.parse((lastNumber - step - step * i).toStringAsFixed(1)));
  }

  return numbers;
}

List<double> generateAscendingNumbers(
    double firstNumber, double lastNumber, int totalCount) {
  List<double> numbers = [];
  double difference = lastNumber - firstNumber;
  double step = difference / (totalCount - 1);

  for (int i = 0; i <= totalCount - 1; i++) {
    numbers.add(double.parse((firstNumber + step * i).toStringAsFixed(1)));
  }

  return numbers;
}

List<double> getProbabilitiesList(
    double firstNumber, double lastNumber, int totalCount, int peak) {
  List<double> probabilitiesList =
      generateAscendingNumbers(firstNumber, lastNumber, peak);
  probabilitiesList.addAll(
      generateDescendingNumbers(firstNumber, lastNumber, totalCount - peak));
  return probabilitiesList;
}
