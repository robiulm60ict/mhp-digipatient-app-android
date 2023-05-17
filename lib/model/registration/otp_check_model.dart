import 'dart:convert';
OtpCheckModel otpCheckModelFromJson(String str) => OtpCheckModel.fromJson(json.decode(str));
String otpCheckModelToJson(OtpCheckModel data) => json.encode(data.toJson());
class OtpCheckModel {
  OtpCheckModel({
      this.message, 
      this.verify,});

  OtpCheckModel.fromJson(dynamic json) {
    message = json['message'];
    verify = json['verify'];
  }
  String? message;
  bool? verify;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['verify'] = verify;
    return map;
  }

}