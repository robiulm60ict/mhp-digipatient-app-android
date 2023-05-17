import 'dart:convert';
BloodGroupModel bloodGroupModelFromJson(String str) => BloodGroupModel.fromJson(json.decode(str));
String bloodGroupModelToJson(BloodGroupModel data) => json.encode(data.toJson());
class BloodGroupModel {
  BloodGroupModel({
      this.status, 
      this.bloodGroup,});

  BloodGroupModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['blood_group'] != null) {
      bloodGroup = [];
      json['blood_group'].forEach((v) {
        bloodGroup?.add(BloodGroup.fromJson(v));
      });
    }
  }
  num? status;
  List<BloodGroup>? bloodGroup;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (bloodGroup != null) {
      map['blood_group'] = bloodGroup?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

BloodGroup bloodGroupFromJson(String str) => BloodGroup.fromJson(json.decode(str));
String bloodGroupToJson(BloodGroup data) => json.encode(data.toJson());
class BloodGroup {
  BloodGroup({
      this.id, 
      this.bloodGroupName, 
      this.deleteStatus, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt,});

  BloodGroup.fromJson(dynamic json) {
    id = json['id'];
    bloodGroupName = json['blood_group_name'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? bloodGroupName;
  String? deleteStatus;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['blood_group_name'] = bloodGroupName;
    map['delete_status'] = deleteStatus;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}