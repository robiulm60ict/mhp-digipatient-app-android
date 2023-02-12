import 'dart:convert';
/// token : "QpwL5tke4Pnpja7X4"

LogInResponse logInResponseFromJson(String str) => LogInResponse.fromJson(json.decode(str));
String logInResponseToJson(LogInResponse data) => json.encode(data.toJson());
class LogInResponse {
  LogInResponse({
      String? token,}){
    _token = token;
}

  LogInResponse.fromJson(dynamic json) {
    _token = json['token'];
  }
  String? _token;
LogInResponse copyWith({  String? token,
}) => LogInResponse(  token: token ?? _token,
);
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    return map;
  }

}