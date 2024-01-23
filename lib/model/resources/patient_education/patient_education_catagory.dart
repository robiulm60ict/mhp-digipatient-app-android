// To parse this JSON data, do
//
//     final patientEducationCatagory = patientEducationCatagoryFromJson(jsonString);

import 'dart:convert';

List<PatientEducationCatagory> patientEducationCatagoryFromJson(String str) => List<PatientEducationCatagory>.from(json.decode(str).map((x) => PatientEducationCatagory.fromJson(x)));

String patientEducationCatagoryToJson(List<PatientEducationCatagory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientEducationCatagory {
  int? id;
  String? categoryName;
  dynamic categoryImage;
  int? groupId;
  dynamic categoryContent;
  DateTime? createdAt;
  DateTime? updatedAt;

  PatientEducationCatagory({
    this.id,
    this.categoryName,
    this.categoryImage,
    this.groupId,
    this.categoryContent,
    this.createdAt,
    this.updatedAt,
  });

  factory PatientEducationCatagory.fromJson(Map<String, dynamic> json) => PatientEducationCatagory(
    id: json["id"],
    categoryName: json["categoryName"],
    categoryImage: json["categoryImage"],
    groupId: json["groupId"],
    categoryContent: json["categoryContent"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "categoryName": categoryName,
    "categoryImage": categoryImage,
    "groupId": groupId,
    "categoryContent": categoryContent,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
