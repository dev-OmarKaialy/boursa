// To parse this JSON data, do
//
//     final tenderModel = tenderModelFromJson(jsonString);

import 'dart:convert';

List<TenderModel> tenderModelFromJson(String str) => List<TenderModel>.from(
    json.decode(str).map((x) => TenderModel.fromJson(x)));

String tenderModelToJson(List<TenderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TenderModel {
  final String? id;
  final String? ownerId;
  final String? descripion;
  final DateTime? timestamp;
  final int? v;

  TenderModel({
    this.id,
    this.ownerId,
    this.descripion,
    this.timestamp,
    this.v,
  });

  factory TenderModel.fromJson(Map<String, dynamic> json) => TenderModel(
        id: json["_id"],
        ownerId: json["Owner_id"],
        descripion: json["Descripion"],
        timestamp: json["Timestamp"] == null
            ? null
            : DateTime.parse(json["Timestamp"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Owner_id": ownerId,
        "Descripion": descripion,
        "Timestamp": timestamp?.toIso8601String(),
        "__v": v,
      };
}
