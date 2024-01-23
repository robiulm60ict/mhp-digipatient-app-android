// To parse this JSON data, do
//
//     final webBinerModel = webBinerModelFromJson(jsonString);

import 'dart:convert';

List<WebBinerModel> webBinerModelFromJson(String str) => List<WebBinerModel>.from(json.decode(str).map((x) => WebBinerModel.fromJson(x)));

String webBinerModelToJson(List<WebBinerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WebBinerModel {
  int? id;
  String? title;
  String? videoUrl;
  String? description;
  String? thumbnail;

  WebBinerModel({
    this.id,
    this.title,
    this.videoUrl,
    this.description,
    this.thumbnail,
  });

  factory WebBinerModel.fromJson(Map<String, dynamic> json) => WebBinerModel(
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
