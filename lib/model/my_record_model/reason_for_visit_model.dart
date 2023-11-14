// To parse this JSON data, do
//
//     final reasonForVisitModel = reasonForVisitModelFromJson(jsonString);

import 'dart:convert';

ReasonForVisitModel reasonForVisitModelFromJson(String str) => ReasonForVisitModel.fromJson(json.decode(str));

String reasonForVisitModelToJson(ReasonForVisitModel data) => json.encode(data.toJson());

class ReasonForVisitModel {
  int? status;
  List<AllReason>? allReasons;

  ReasonForVisitModel({
    this.status,
    this.allReasons,
  });

  factory ReasonForVisitModel.fromJson(Map<String, dynamic> json) => ReasonForVisitModel(
    status: json["status"],
    allReasons: json["allReasons"] == null ? [] : List<AllReason>.from(json["allReasons"]!.map((x) => AllReason.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "allReasons": allReasons == null ? [] : List<dynamic>.from(allReasons!.map((x) => x.toJson())),
  };
}

class AllReason {
  int? id;
  String? resonForName;
  String? code;
  String? resonFurtherDetails;
  String? resonName;
  int? deleteStatus;
  String? patientId;
  dynamic nurseId;
  dynamic categoryName;
  dynamic lastCheckUpDate;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllReason({
    this.id,
    this.resonForName,
    this.code,
    this.resonFurtherDetails,
    this.resonName,
    this.deleteStatus,
    this.patientId,
    this.nurseId,
    this.categoryName,
    this.lastCheckUpDate,
    this.date,
    this.createdAt,
    this.updatedAt,
  });

  factory AllReason.fromJson(Map<String, dynamic> json) => AllReason(
    id: json["id"],
    resonForName: json["reson_for_name"],
    code: json["code"],
    resonFurtherDetails: json["reson_further_details"],
    resonName: json["reson_name"],
    deleteStatus: json["delete_status"],
    patientId: json["patient_id"],
    nurseId: json["nurse_id"],
    categoryName: json["category_name"],
    lastCheckUpDate: json["last_check_up_date"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reson_for_name": resonForName,
    "code": code,
    "reson_further_details": resonFurtherDetails,
    "reson_name": resonName,
    "delete_status": deleteStatus,
    "patient_id": patientId,
    "nurse_id": nurseId,
    "category_name": categoryName,
    "last_check_up_date": lastCheckUpDate,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
