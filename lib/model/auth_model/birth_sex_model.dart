// To parse this JSON data, do
//
//     final birthSexModel = birthSexModelFromJson(jsonString);

import 'dart:convert';

BirthSexModel birthSexModelFromJson(String str) => BirthSexModel.fromJson(json.decode(str));

String birthSexModelToJson(BirthSexModel data) => json.encode(data.toJson());

class BirthSexModel {
  int? status;
  List<BirthSex>? birthSex;

  BirthSexModel({
    this.status,
    this.birthSex,
  });

  factory BirthSexModel.fromJson(Map<String, dynamic> json) => BirthSexModel(
    status: json["status"],
    birthSex: json["birth_sex"] == null ? [] : List<BirthSex>.from(json["birth_sex"]!.map((x) => BirthSex.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "birth_sex": birthSex == null ? [] : List<dynamic>.from(birthSex!.map((x) => x.toJson())),
  };
}

class BirthSex {
  int? id;
  String? birthSexName;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  BirthSex({
    this.id,
    this.birthSexName,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory BirthSex.fromJson(Map<String, dynamic> json) => BirthSex(
    id: json["id"],
    birthSexName: json["birth_sex_name"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "birth_sex_name": birthSexName,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
