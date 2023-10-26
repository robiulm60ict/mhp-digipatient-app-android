// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? message;
  String? accessToken;
  User? user;

  LoginModel({
    this.message,
    this.accessToken,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    accessToken: json["access_token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "access_token": accessToken,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  String? email;
  String? mobile;
  String? userId;
  String? userType;
  String? organizationName;
  String? organizationMobile;
  String? organizationEmail;
  String? organizationAddress;
  dynamic organizationLogo;

  User({
    this.id,
    this.email,
    this.mobile,
    this.userId,
    this.userType,
    this.organizationName,
    this.organizationMobile,
    this.organizationEmail,
    this.organizationAddress,
    this.organizationLogo,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    mobile: json["mobile"],
    userId: json["user_id"],
    userType: json["user_type"],
    organizationName: json["organization_name"],
    organizationMobile: json["organization_mobile"],
    organizationEmail: json["organization_email"],
    organizationAddress: json["organization_address"],
    organizationLogo: json["organization_logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "mobile": mobile,
    "user_id": userId,
    "user_type": userType,
    "organization_name": organizationName,
    "organization_mobile": organizationMobile,
    "organization_email": organizationEmail,
    "organization_address": organizationAddress,
    "organization_logo": organizationLogo,
  };
}
