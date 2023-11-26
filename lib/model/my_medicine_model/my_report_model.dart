// To parse this JSON data, do
//
//     final myReportImageModel = myReportImageModelFromJson(jsonString);

import 'dart:convert';

List<MyReportImageModel> myReportImageModelFromJson(String str) => List<MyReportImageModel>.from(json.decode(str).map((x) => MyReportImageModel.fromJson(x)));

String myReportImageModelToJson(List<MyReportImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyReportImageModel {
  int? id;
  int? patientId;
  String? name;
  String? file;
  dynamic createdAt;
  dynamic updatedAt;

  MyReportImageModel({
    this.id,
    this.patientId,
    this.name,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory MyReportImageModel.fromJson(Map<String, dynamic> json) => MyReportImageModel(
    id: json["id"],
    patientId: json["patient_id"],
    name: json["name"],
    file: json["file"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "name": name,
    "file": file,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
