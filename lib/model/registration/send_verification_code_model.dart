import 'dart:convert';
SendVerificationModel sendVerificationModelFromJson(String str) => SendVerificationModel.fromJson(json.decode(str));
String sendVerificationModelToJson(SendVerificationModel data) => json.encode(data.toJson());
class SendVerificationModel {
  SendVerificationModel({
      this.message, 
      this.token,});

  SendVerificationModel.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}