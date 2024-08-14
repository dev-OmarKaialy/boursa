// To parse this JSON data, do
//
//     final addAdModel = addAdModelFromJson(jsonString);

import 'dart:convert';

List<AddAdModel> addAdModelFromJson(String str) =>
    List<AddAdModel>.from(json.decode(str).map((x) => AddAdModel.fromJson(x)));

String addAdModelToJson(List<AddAdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddAdModel {
  final DateTime? startTime;
  final String? details;
  final String? userId;

  AddAdModel({
    this.startTime,
    this.details,
    this.userId,
  });

  factory AddAdModel.fromJson(Map<String, dynamic> json) => AddAdModel(
        startTime: json["Start_Time"] == null
            ? null
            : DateTime.parse(json["Start_Time"]),
        details: json["details"],
        userId: json["User_id"],
      );

  Map<String, dynamic> toJson() => {
        "Start_Time": startTime?.toIso8601String(),
        "details": details,
        "User_id": userId,
      };
}
