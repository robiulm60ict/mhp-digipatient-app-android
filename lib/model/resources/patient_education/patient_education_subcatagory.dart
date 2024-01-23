// To parse this JSON data, do
//
//     final patientEducationSubCatagory = patientEducationSubCatagoryFromJson(jsonString);

import 'dart:convert';

List<PatientEducationSubCatagory> patientEducationSubCatagoryFromJson(String str) => List<PatientEducationSubCatagory>.from(json.decode(str).map((x) => PatientEducationSubCatagory.fromJson(x)));

String patientEducationSubCatagoryToJson(List<PatientEducationSubCatagory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientEducationSubCatagory {
  int? id;
  String? subCategoryName;
  dynamic subCategoryImage;
  dynamic subCategoryContent;
  int? categoryId;
  DateTime? createdAt;
  DateTime? updatedAt;

  PatientEducationSubCatagory({
    this.id,
    this.subCategoryName,
    this.subCategoryImage,
    this.subCategoryContent,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory PatientEducationSubCatagory.fromJson(Map<String, dynamic> json) => PatientEducationSubCatagory(
    id: json["id"],
    subCategoryName: json["subCategoryName"],
    subCategoryImage: json["subCategoryImage"],
    subCategoryContent: json["subCategoryContent"],
    categoryId: json["categoryId"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subCategoryName": subCategoryName,
    "subCategoryImage": subCategoryImage,
    "subCategoryContent": subCategoryContent,
    "categoryId": categoryId,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
