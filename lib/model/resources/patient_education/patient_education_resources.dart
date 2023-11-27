// To parse this JSON data, do
//
//     final patientEducationResources = patientEducationResourcesFromJson(jsonString);

import 'dart:convert';

List<PatientEducationResources> patientEducationResourcesFromJson(String str) => List<PatientEducationResources>.from(json.decode(str).map((x) => PatientEducationResources.fromJson(x)));

String patientEducationResourcesToJson(List<PatientEducationResources> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientEducationResources {
  int? id;
  dynamic fileName;
  dynamic fileContent;
  int? subCategoryId;
  dynamic embedUrl;
  String? title;
  String? file;
  DateTime? createdAt;
  DateTime? updatedAt;

  PatientEducationResources({
    this.id,
    this.fileName,
    this.fileContent,
    this.subCategoryId,
    this.embedUrl,
    this.title,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  factory PatientEducationResources.fromJson(Map<String, dynamic> json) => PatientEducationResources(
    id: json["id"],
    fileName: json["fileName"],
    fileContent: json["fileContent"],
    subCategoryId: json["subCategoryId"],
    embedUrl: json["embedUrl"],
    title: json["title"],
    file: json["file"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileName": fileName,
    "fileContent": fileContent,
    "subCategoryId": subCategoryId,
    "embedUrl": embedUrl,
    "title": title,
    "file": file,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
