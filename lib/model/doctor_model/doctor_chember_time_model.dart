// To parse this JSON data, do
//
//     final doctorChamberTimeModel = doctorChamberTimeModelFromJson(jsonString);

import 'dart:convert';

List<DoctorChamberTimeModel> doctorChamberTimeModelFromJson(String str) => List<DoctorChamberTimeModel>.from(json.decode(str).map((x) => DoctorChamberTimeModel.fromJson(x)));

String doctorChamberTimeModelToJson(List<DoctorChamberTimeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorChamberTimeModel {
  int? id;
  int? saasBranchId;
  String? saasBranchName;
  String? doctorId;
  String? chamberId;
  String? year;
  String? month;
  String? status;
  String? day;
  String? slotFrom;
  String? slotTo;
  String? type;
  String? appointmentType;
  int? deleteStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  DoctorChamberTimeModel({
    this.id,
    this.saasBranchId,
    this.saasBranchName,
    this.doctorId,
    this.chamberId,
    this.year,
    this.month,
    this.status,
    this.day,
    this.slotFrom,
    this.slotTo,
    this.type,
    this.appointmentType,
    this.deleteStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory DoctorChamberTimeModel.fromJson(Map<String, dynamic> json) => DoctorChamberTimeModel(
    id: json["id"],
    saasBranchId: json["saas_branch_id"],
    saasBranchName: json["saas_branch_name"],
    doctorId: json["doctor_id"],
    chamberId: json["chamber_id"],
    year: json["year"],
    month: json["month"],
    status: json["status"],
    day: json["day"],
    slotFrom: json["slot_from"],
    slotTo: json["slot_to"],
    type: json["type"],
    appointmentType: json["appointment_type"],
    deleteStatus: json["delete_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "saas_branch_id": saasBranchId,
    "saas_branch_name": saasBranchName,
    "doctor_id": doctorId,
    "chamber_id": chamberId,
    "year": year,
    "month": month,
    "status": status,
    "day": day,
    "slot_from": slotFrom,
    "slot_to": slotTo,
    "type": type,
    "appointment_type": appointmentType,
    "delete_status": deleteStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
