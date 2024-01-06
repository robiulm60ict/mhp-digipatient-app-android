// To parse this JSON data, do
//
//     final bloodGroupModel = bloodGroupModelFromJson(jsonString);

import 'dart:convert';

BloodGroupModel bloodGroupModelFromJson(String str) => BloodGroupModel.fromJson(json.decode(str));

String bloodGroupModelToJson(BloodGroupModel data) => json.encode(data.toJson());

class BloodGroupModel {
  int? status;
  List<BloodGroups>? bloodGroup;

  BloodGroupModel({
    this.status,
    this.bloodGroup,
  });

  factory BloodGroupModel.fromJson(Map<String, dynamic> json) => BloodGroupModel(
    status: json["status"],
    bloodGroup: json["blood_group"] == null ? [] : List<BloodGroups>.from(json["blood_group"]!.map((x) => BloodGroups.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "blood_group": bloodGroup == null ? [] : List<dynamic>.from(bloodGroup!.map((x) => x.toJson())),
  };
}

class BloodGroups {
  int? id;
  String? bloodGroupName;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  BloodGroups({
    this.id,
    this.bloodGroupName,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory BloodGroups.fromJson(Map<String, dynamic> json) => BloodGroups(
    id: json["id"],
    bloodGroupName: json["blood_group_name"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "blood_group_name": bloodGroupName,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
