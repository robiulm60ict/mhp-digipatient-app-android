// To parse this JSON data, do
//
//     final anatomyModel = anatomyModelFromJson(jsonString);

import 'dart:convert';

AnatomyModel anatomyModelFromJson(String str) => AnatomyModel.fromJson(json.decode(str));

String anatomyModelToJson(AnatomyModel data) => json.encode(data.toJson());

class AnatomyModel {
  int? status;
  List<SymptomsAnatomy>? symptomsAnatomy;

  AnatomyModel({
    this.status,
    this.symptomsAnatomy,
  });

  factory AnatomyModel.fromJson(Map<String, dynamic> json) => AnatomyModel(
    status: json["status"],
    symptomsAnatomy: json["symptoms_anatomy"] == null ? [] : List<SymptomsAnatomy>.from(json["symptoms_anatomy"]!.map((x) => SymptomsAnatomy.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "symptoms_anatomy": symptomsAnatomy == null ? [] : List<dynamic>.from(symptomsAnatomy!.map((x) => x.toJson())),
  };
}

class SymptomsAnatomy {
  int? id;
  String? mainBodyPartId;
  String? subBodyPartId;
  String? sideSelectionName;
  String? genderId;
  String? symptomName;
  int? deleteStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? mainBodyPartName;
  String? subBodyPartName;
  dynamic birthSexName;
  bool? isSelected;

  SymptomsAnatomy({
    this.id,
    this.mainBodyPartId,
    this.subBodyPartId,
    this.sideSelectionName,
    this.genderId,
    this.symptomName,
    this.deleteStatus,
    this.createdAt,
    this.updatedAt,
    this.mainBodyPartName,
    this.subBodyPartName,
    this.birthSexName,
    this.isSelected,
  });

  factory SymptomsAnatomy.fromJson(Map<String, dynamic> json) => SymptomsAnatomy(
    id: json["id"],
    mainBodyPartId: json["main_body_part_id"],
    subBodyPartId: json["sub_body_part_id"],
    sideSelectionName: json["side_selection_name"],
    genderId: json["gender_id"],
    symptomName: json["symptom_name"],
    deleteStatus: json["delete_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    mainBodyPartName: json["MainBodyPart_name"],
    subBodyPartName: json["SubBodyPart_name"],
    birthSexName: json["birth_sex_name"],
    isSelected: json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main_body_part_id": mainBodyPartId,
    "sub_body_part_id": subBodyPartId,
    "side_selection_name": sideSelectionName,
    "gender_id": genderId,
    "symptom_name": symptomName,
    "delete_status": deleteStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "MainBodyPart_name": mainBodyPartName,
    "SubBodyPart_name": subBodyPartName,
    "birth_sex_name": birthSexName,
    //"isSelected": isSelected,
  };
}
