enum AuthMode {
  login,
  signup,
}

class UserModel {
  UserModel(
      {required this.email,
      required this.username,
      required this.authMode,
      required this.password});
  String? email;
  String? username;
  AuthMode authMode;
  String? password;
}
