// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String lastName;
  final String email;
  final String password;

  LoginModel({
    required this.lastName,
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
