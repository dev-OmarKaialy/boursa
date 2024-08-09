// To parse this JSON data, do
//
//     final addAdModel = addAdModelFromJson(jsonString);

import 'dart:convert';

AddAdModel addAdModelFromJson(String str) =>
    AddAdModel.fromJson(json.decode(str));

String addAdModelToJson(AddAdModel data) => json.encode(data.toJson());

class AddAdModel {
  final DateTime startTime;
  final String details;
  final String userId;

  AddAdModel({
    required this.startTime,
    required this.details,
    required this.userId,
  });

  factory AddAdModel.fromJson(Map<String, dynamic> json) => AddAdModel(
        startTime: DateTime.parse(json["Start_Time"]),
        details: json["details"],
        userId: json["User_id"],
      );

  Map<String, dynamic> toJson() => {
        "Start_Time": startTime.toIso8601String(),
        "details": details,
        "User_id": userId,
      };
}
