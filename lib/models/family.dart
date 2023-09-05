import 'package:my_life/references/model_base.dart';
import 'package:my_life/models/relation.dart';

class Family extends ModelBase {
  Family({
    required this.familyName,
    required this.father,
    required this.mother,
    required this.sibling1,
    required this.sibling2,
    required this.sibling3,
  });
  String? familyName;
  Relationship? father;
  Relationship? mother;
  Relationship? sibling1;
  Relationship? sibling2;
  Relationship? sibling3;

  @override
  Map<String, dynamic> toMap() {
    return {
      'familyName': familyName,
      if (father != null) 'father': father!.toMap(),
      if (mother != null) 'mother': mother!.toMap(),
      if (sibling1 != null) 'sibling1': sibling1!.toMap(),
      if (sibling2 != null) 'sibling2': sibling2!.toMap(),
      if (sibling3 != null) 'sibling3': sibling3!.toMap(),
    }
      ..addAll(super.toMap())
      ..removeWhere((key, value) => value == null);
  }

  Family.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    familyName = data['familyName'];
    if (data['father'] != null) {
      father = Relationship.fromMap(data['father']);
    }

    if (data['mother'] != null) {
      sibling1 = Relationship.fromMap(data['mother']);
    }
    if (data['sibling1'] != null) {
      sibling1 = Relationship.fromMap(data['sibling1']);
    }
    if (data['sibling2'] != null) {
      sibling2 = Relationship.fromMap(data['sibling2']);
    }
    if (data['sibling3'] != null) {
      sibling3 = Relationship.fromMap(data['sibling3']);
    }
  }
}
