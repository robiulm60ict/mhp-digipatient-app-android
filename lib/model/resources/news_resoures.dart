// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  int? id;
  String? title;
  String? videoUrl;
  String? description;
  String? thumbnail;

  NewsModel({
    this.id,
    this.title,
    this.videoUrl,
    this.description,
    this.thumbnail,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
