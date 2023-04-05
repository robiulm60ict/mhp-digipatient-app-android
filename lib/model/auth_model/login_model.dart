import 'dart:convert';
LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());
class LoginModel {
  LoginModel({
    this.message,
    this.user,});

  LoginModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.userType,
    this.userId,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    userId = json['user_id'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? userType;
  String? userId;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['user_type'] = userType;
    map['user_id'] = userId;
    map['current_team_id'] = currentTeamId;
    map['profile_photo_path'] = profilePhotoPath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }

}