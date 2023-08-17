import 'package:my_life/references/model_base.dart';
import 'package:my_life/models/relation.dart';

class Background extends ModelBase {
  Background({
    required this.familyName,
    required this.father,
    required this.mother,
    required this.sibling1,
    required this.sibling2,
    required this.sibling3,
  });
  String? familyName;
  Relation? father;
  Relation? mother;
  Relation? sibling1;
  Relation? sibling2;
  Relation? sibling3;

  @override
  Map<String, dynamic> toMap() {
    return {
      'familyName': familyName,
      'father': father!.toMap(),
      'mother': mother!.toMap(),
      if (sibling1 != null) 'sibling1': sibling1!.toMap(),
      if (sibling2 != null) 'sibling2': sibling2!.toMap(),
      if (sibling3 != null) 'sibling3': sibling3!.toMap(),
    }
      ..addAll(super.toMap())
      ..removeWhere((key, value) => value == null);
  }

  Background.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    familyName = data['familyName'];
    father = Relation.fromMap(data['father']);
    mother = Relation.fromMap(data['mother']);
    if (data['sibling1'] != null) sibling1 = Relation.fromMap(data['sibling1']);
    if (data['sibling2'] != null) sibling2 = Relation.fromMap(data['sibling2']);
    if (data['sibling3'] != null) sibling3 = Relation.fromMap(data['sibling3']);
  }
}
