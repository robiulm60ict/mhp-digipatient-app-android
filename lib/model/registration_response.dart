import 'dart:convert';
/// id : 4
/// token : "QpwL5tke4Pnpja7X4"

RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));
String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());
class RegistrationResponse {
  RegistrationResponse({
      int? id, 
      String? token,}){
    _id = id;
    _token = token;
}

  RegistrationResponse.fromJson(dynamic json) {
    _id = json['id'];
    _token = json['token'];
  }
  int? _id;
  String? _token;
RegistrationResponse copyWith({  int? id,
  String? token,
}) => RegistrationResponse(  id: id ?? _id,
  token: token ?? _token,
);
  int? get id => _id;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['token'] = _token;
    return map;
  }

}