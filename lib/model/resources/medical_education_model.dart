// To parse this JSON data, do
//
//     final medicalEducationModel = medicalEducationModelFromJson(jsonString);

import 'dart:convert';

List<MedicalEducationModel> medicalEducationModelFromJson(String str) => List<MedicalEducationModel>.from(json.decode(str).map((x) => MedicalEducationModel.fromJson(x)));

String medicalEducationModelToJson(List<MedicalEducationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalEducationModel {
  int? id;
  String? title;
  String? videoUrl;
  String? description;
  String? thumbnail;

  MedicalEducationModel({
    this.id,
    this.title,
    this.videoUrl,
    this.description,
    this.thumbnail,
  });

  factory MedicalEducationModel.fromJson(Map<String, dynamic> json) => MedicalEducationModel(
    id: json["id"],
    title: json["title"],
    videoUrl: json["videoUrl"],
    description: json["description"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "videoUrl": videoUrl,
    "description": description,
    "thumbnail": thumbnail,
  };
}
