import 'dart:convert';
BirthSexModel birthSexModelFromJson(String str) => BirthSexModel.fromJson(json.decode(str));
String birthSexModelToJson(BirthSexModel data) => json.encode(data.toJson());
class BirthSexModel {
  BirthSexModel({
      this.status, 
      this.birthSex,});

  BirthSexModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['birth_sex'] != null) {
      birthSex = [];
      json['birth_sex'].forEach((v) {
        birthSex?.add(BirthSex.fromJson(v));
      });
    }
  }
  num? status;
  List<BirthSex>? birthSex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (birthSex != null) {
      map['birth_sex'] = birthSex?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

BirthSex birthSexFromJson(String str) => BirthSex.fromJson(json.decode(str));
String birthSexToJson(BirthSex data) => json.encode(data.toJson());
class BirthSex {
  BirthSex({
      this.id, 
      this.birthSexName, 
      this.deleteStatus, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt,});

  BirthSex.fromJson(dynamic json) {
    id = json['id'];
    birthSexName = json['birth_sex_name'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? birthSexName;
  String? deleteStatus;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['birth_sex_name'] = birthSexName;
    map['delete_status'] = deleteStatus;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}