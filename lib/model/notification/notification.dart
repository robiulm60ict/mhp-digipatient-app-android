// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  List<NotoData>? data;

  NotificationModel({
    this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: json["data"] == null ? [] : List<NotoData>.from(json["data"]!.map((x) => NotoData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class NotoData {
  int? id;
  String? title;
  String? description;
  String? patientHnNumber;
  dynamic from;
  dynamic? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotoData({
    this.id,
    this.title,
    this.description,
    this.patientHnNumber,
    this.from,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory NotoData.fromJson(Map<String, dynamic> json) => NotoData(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    patientHnNumber: json["patient_hn_number"],
    from: json["from"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "patient_hn_number": patientHnNumber,
    "from": from,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
