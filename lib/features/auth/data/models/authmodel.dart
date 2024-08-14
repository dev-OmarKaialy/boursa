// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  final User? user;
  final String? authToken;

  AuthModel({
    this.user,
    this.authToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        authToken: json["authToken"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "authToken": authToken,
      };
}

class User {
  final String? lastName;
  final String? email;
  final String? password;

  User({
    this.lastName,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        lastName: json["Last_Name"],
        email: json["Email"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Last_Name": lastName,
        "Email": email,
        "Password": password,
      };
}
