// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  String? token;
  User? user;

  LoginModel({
    this.message,
    this.token,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? name;
  String? email;
  String? userType;
  String? userId;
  dynamic userEmail;
  String? dbName;
  dynamic saasUserId;
  dynamic mobile;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? profilePhotoUrl;

  User({
    this.id,
    this.name,
    this.email,
    this.userType,
    this.userId,
    this.userEmail,
    this.dbName,
    this.saasUserId,
    this.mobile,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    userType: json["user_type"],
    userId: json["user_id"],
    userEmail: json["user_email"],
    dbName: json["db_name"],
    saasUserId: json["saas_user_id"],
    mobile: json["mobile"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "user_type": userType,
    "user_id": userId,
    "user_email": userEmail,
    "db_name": dbName,
    "saas_user_id": saasUserId,
    "mobile": mobile,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
  };
}
