import 'package:my_life/references/model_base.dart';

import 'life.dart';

enum AuthMode {
  login,
  signup,
}

class UserModel extends ModelBase {
  UserModel({
    required this.email,
    required this.username,
    required this.password,
    required this.authMode,
    required this.lives,
  });

  String? email;
  String? username;
  AuthMode? authMode;
  String? password;
  List<Life> lives = [];

  UserModel.fromMap(Map<String, dynamic> data) : super.fromMap(data) {
    username = data['username'];
    email = data['email'];
    lives = [for (final lifeData in data['lives']) Life.fromMap(lifeData)];
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'lives': [for (final life in lives) life.toMap()]
    }
      ..addAll(super.toMap())
      ..removeWhere((key, value) => value == null);
  }
}
