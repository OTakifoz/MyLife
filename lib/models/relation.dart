// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:my_life/references/model_base.dart';

import 'life.dart';

enum Closeness {
  blood,
  half,
  step,
}

enum RelationType { mother, father, sister, brother }

class Relation extends ModelBase {
  Relation({
    required this.age,
    required this.gender,
    required this.opinion,
    required this.lastName,
    required this.name,
    required this.uid,
    required this.closeness,
    required this.relationType,
  });
  int? age;
  Gender? gender;
  String? name;
  String? lastName;
  String? uid;
  dynamic opinion;
  Closeness? closeness;
  RelationType? relationType;

  Relation copy() {
    return Relation(
      age: age,
      gender: gender,
      lastName: lastName,
      name: name,
      uid: uid,
      opinion: opinion,
      closeness: closeness,
      relationType: relationType,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'gender': gender.toString(),
      'lastName': lastName,
      'name': name,
      'uid': uid,
      'opinion': opinion,
      'closeness': closeness.toString(),
      'relationType': relationType.toString(),
    }
      ..addAll(super.toMap())
      ..removeWhere((key, value) => value == null);
  }

  Relation.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    Gender? _gender;
    if (data['gender'] == "Gender.male") {
      _gender = Gender.male;
    }
    if (data['gender'] == "Gender.female") {
      _gender = Gender.female;
    }
    Closeness? _closeness;
    if (data['closeness'] == "Closeness.blood") {
      _closeness = Closeness.blood;
    }
    if (data['closeness'] == "Closeness.half") {
      _closeness = Closeness.half;
    }
    if (data['closeness'] == "Closeness.step") {
      _closeness = Closeness.step;
    }
    RelationType? _relationType;
    if (data['relationType'] == "RelationType.mother") {
      _relationType = RelationType.mother;
    }
    if (data['relationType'] == "RelationType.father") {
      _relationType = RelationType.father;
    }
    if (data['relationType'] == "RelationType.sister") {
      _relationType = RelationType.sister;
    }
    if (data['relationType'] == "RelationType.brother") {
      _relationType = RelationType.brother;
    }
    age = data['age'];
    gender = _gender;
    lastName = data['lastName'];
    name = data['name'];
    uid = data['uid'];
    opinion = data['opinion'];
    closeness = _closeness;
    relationType = _relationType;
  }
}
