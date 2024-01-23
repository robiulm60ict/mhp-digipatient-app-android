// To parse this JSON data, do
//
//     final socialListModel = socialListModelFromJson(jsonString);

import 'dart:convert';

List<SocialListModel> socialListModelFromJson(String str) => List<SocialListModel>.from(json.decode(str).map((x) => SocialListModel.fromJson(x)));

String socialListModelToJson(List<SocialListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SocialListModel {
  int? id;
  String? name;
  String? url;
  String? userId;
  String? userType;
  DateTime? createdAt;
  DateTime? updatedAt;

  SocialListModel({
    this.id,
    this.name,
    this.url,
    this.userId,
    this.userType,
    this.createdAt,
    this.updatedAt,
  });

  factory SocialListModel.fromJson(Map<String, dynamic> json) => SocialListModel(
    id: json["id"],
    name: json["name"],
    url: json["url"],
    userId: json["user_id"],
    userType: json["user_type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "url": url,
    "user_id": userId,
    "user_type": userType,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
