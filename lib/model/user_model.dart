// import 'dart:convert';
// /// id : 4
// /// token : "QpwL5tke4Pnpja7X4"
//
// UserModel userModel(String str) => UserModel.fromJson(json.decode(str));
// String userModelToJson(UserModel data) => json.encode(data.toJson());
// class UserModel {
//   UserModel({
//     int? id,
//     String? token,}){
//     _id = id;
//     _token = token;
//   }
//
//   UserModel.fromJson(dynamic json) {
//     _id = json['id'];
//     _token = json['token'];
//   }
//   int? _id;
//   String? _token;
//   UserModel copyWith({  int? id,
//     String? token,
//   }) => UserModel(  id: id ?? _id,
//     token: token ?? _token,
//   );
//   int? get id => _id;
//   String? get token => _token;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['token'] = _token;
//     return map;
//   }
//
// }