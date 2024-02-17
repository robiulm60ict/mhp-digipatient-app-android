// To parse this JSON data, do
//
//     final myReportImageModel = myReportImageModelFromJson(jsonString);

import 'dart:convert';

List<MyReportImageModel> myReportImageModelFromJson(String str) => List<MyReportImageModel>.from(json.decode(str).map((x) => MyReportImageModel.fromJson(x)));

String myReportImageModelToJson(List<MyReportImageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyReportImageModel {
  String? patientId;
  String? name;
  List<FileElement>? file;
  DateTime? date;

  MyReportImageModel({
    this.patientId,
    this.name,
    this.file,
    this.date,
  });

  factory MyReportImageModel.fromJson(Map<String, dynamic> json) => MyReportImageModel(
    patientId: json["patient_id"],
    name: json["name"],
    file: json["file"] == null ? [] : List<FileElement>.from(json["file"]!.map((x) => FileElement.fromJson(x))),
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "patient_id": patientId,
    "name": name,
    "file": file == null ? [] : List<dynamic>.from(file!.map((x) => x.toJson())),
    "date": date?.toIso8601String(),
  };
}

class FileElement {
  int? id;
  String? file;
  String? typeOfReport;
  DateTime? createdAt;
  DateTime? updatedAt;

  FileElement({
    this.id,
    this.file,
    this.typeOfReport,
    this.createdAt,
    this.updatedAt,
  });

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    id: json["id"],
    file: json["file"],
    typeOfReport: json["type_of_report"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "file": file,
    "type_of_report": typeOfReport,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
