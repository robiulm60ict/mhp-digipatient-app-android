// To parse this JSON data, do
//
//     final doctorChamberTimeModel = doctorChamberTimeModelFromJson(jsonString);

import 'dart:convert';

DoctorChamberTimeModel doctorChamberTimeModelFromJson(String str) => DoctorChamberTimeModel.fromJson(json.decode(str));

String doctorChamberTimeModelToJson(DoctorChamberTimeModel data) => json.encode(data.toJson());

class DoctorChamberTimeModel {
  int? status;
  List<DocTimeSlot>? docTimeSlots;

  DoctorChamberTimeModel({
    this.status,
    this.docTimeSlots,
  });

  factory DoctorChamberTimeModel.fromJson(Map<String, dynamic> json) => DoctorChamberTimeModel(
    status: json["status"],
    docTimeSlots: json["docTimeSlots"] == null ? [] : List<DocTimeSlot>.from(json["docTimeSlots"]!.map((x) => DocTimeSlot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "docTimeSlots": docTimeSlots == null ? [] : List<dynamic>.from(docTimeSlots!.map((x) => x.toJson())),
  };
}

class DocTimeSlot {
  int? id;
  String? doctorId;
  String? chamberId;
  String? year;
  String? month;
  String? allMonth;
  String? day;
  DateTime? slotFrom;
  DateTime? slotTo;
  String? type;
  int? deleteStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? drGivenName;
  String? usualProviderName;

  DocTimeSlot({
    this.id,
    this.doctorId,
    this.chamberId,
    this.year,
    this.month,
    this.allMonth,
    this.day,
    this.slotFrom,
    this.slotTo,
    this.type,
    this.deleteStatus,
    this.createdAt,
    this.updatedAt,
    this.drGivenName,
    this.usualProviderName,
  });

  factory DocTimeSlot.fromJson(Map<String, dynamic> json) => DocTimeSlot(
    id: json["id"],
    doctorId: json["doctor_id"],
    chamberId: json["chamber_id"],
    year: json["year"],
    month: json["month"],
    allMonth: json["all_month"],
    day: json["day"],
    slotFrom: json["slot_from"] == null ? null : DateTime.parse(json["slot_from"]),
    slotTo: json["slot_to"] == null ? null : DateTime.parse(json["slot_to"]),
    type: json["type"],
    deleteStatus: json["delete_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    drGivenName: json["dr_given_name"],
    usualProviderName: json["usual_provider_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctor_id": doctorId,
    "chamber_id": chamberId,
    "year": year,
    "month": month,
    "all_month": allMonth,
    "day": day,
    "slot_from": slotFrom?.toIso8601String(),
    "slot_to": slotTo?.toIso8601String(),
    "type": type,
    "delete_status": deleteStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "dr_given_name": drGivenName,
    "usual_provider_name": usualProviderName,
  };
}
