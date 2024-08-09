// To parse this JSON data, do
//
//     final offersModel = offersModelFromJson(jsonString);

import 'dart:convert';

List<OffersModel> offersModelFromJson(String str) => List<OffersModel>.from(
    json.decode(str).map((x) => OffersModel.fromJson(x)));

String offersModelToJson(List<OffersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OffersModel {
  final String id;
  final String tenderId;
  final FinancialEnvelope financialEnvelope;
  final ArtisticEnvelope artisticEnvelope;
  final String companyId;
  final DateTime timestamps;
  final bool isAgree;
  final int v;

  OffersModel({
    required this.id,
    required this.tenderId,
    required this.financialEnvelope,
    required this.artisticEnvelope,
    required this.companyId,
    required this.timestamps,
    required this.isAgree,
    required this.v,
  });

  factory OffersModel.fromJson(Map<String, dynamic> json) => OffersModel(
        id: json["_id"],
        tenderId: json["Tender_id"],
        financialEnvelope:
            FinancialEnvelope.fromJson(json["Financial_envelope"]),
        artisticEnvelope: ArtisticEnvelope.fromJson(json["Artistic_envelope"]),
        companyId: json["Company_id"],
        timestamps: DateTime.parse(json["Timestamps"]),
        isAgree: json["IsAgree"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Tender_id": tenderId,
        "Financial_envelope": financialEnvelope.toJson(),
        "Artistic_envelope": artisticEnvelope.toJson(),
        "Company_id": companyId,
        "Timestamps": timestamps.toIso8601String(),
        "IsAgree": isAgree,
        "__v": v,
      };
}

class ArtisticEnvelope {
  final String previousWork;
  final DateTime theExpectedTimetableForProjectImplementation;
  final String details;
  final String id;

  ArtisticEnvelope({
    required this.previousWork,
    required this.theExpectedTimetableForProjectImplementation,
    required this.details,
    required this.id,
  });

  factory ArtisticEnvelope.fromJson(Map<String, dynamic> json) =>
      ArtisticEnvelope(
        previousWork: json["Previous_work"],
        theExpectedTimetableForProjectImplementation: DateTime.parse(
            json["The_expected_timetable_for_project_implementation"]),
        details: json["details"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "Previous_work": previousWork,
        "The_expected_timetable_for_project_implementation":
            theExpectedTimetableForProjectImplementation.toIso8601String(),
        "details": details,
        "_id": id,
      };
}

class FinancialEnvelope {
  final String id;

  FinancialEnvelope({
    required this.id,
  });

  factory FinancialEnvelope.fromJson(Map<String, dynamic> json) =>
      FinancialEnvelope(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
