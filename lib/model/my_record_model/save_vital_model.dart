import 'dart:convert';
SaveVitalModel saveVitalModelFromJson(String str) => SaveVitalModel.fromJson(json.decode(str));
String saveVitalModelToJson(SaveVitalModel data) => json.encode(data.toJson());
class SaveVitalModel {
  SaveVitalModel({
      this.status, 
      this.message, 
      this.vitalSign,});

  SaveVitalModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    vitalSign = json['vitalSign'] != null ? VitalSign.fromJson(json['vitalSign']) : null;
  }
  num? status;
  String? message;
  VitalSign? vitalSign;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (vitalSign != null) {
      map['vitalSign'] = vitalSign?.toJson();
    }
    return map;
  }

}

VitalSign vitalSignFromJson(String str) => VitalSign.fromJson(json.decode(str));
String vitalSignToJson(VitalSign data) => json.encode(data.toJson());
class VitalSign {
  VitalSign({
      this.patientId, 
      this.name, 
      this.value, 
      this.desc, 
      this.color, 
      this.lastCheckUpDate, 
      this.icon, 
      this.unitsId, 
      this.statusId, 
      this.refRangeValue, 
      this.remarks, 
      this.nurseId, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  VitalSign.fromJson(dynamic json) {
    patientId = json['patient_id'];
    name = json['name'];
    value = json['value'];
    desc = json['desc'];
    color = json['color'];
    lastCheckUpDate = json['last_check_up_date'];
    icon = json['icon'];
    unitsId = json['units_id'];
    statusId = json['status_id'];
    refRangeValue = json['ref_range_value'];
    remarks = json['remarks'];
    nurseId = json['nurse_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? patientId;
  String? name;
  String? value;
  String? desc;
  String? color;
  String? lastCheckUpDate;
  String? icon;
  String? unitsId;
  String? statusId;
  String? refRangeValue;
  String? remarks;
  String? nurseId;
  String? updatedAt;
  String? createdAt;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_id'] = patientId;
    map['name'] = name;
    map['value'] = value;
    map['desc'] = desc;
    map['color'] = color;
    map['last_check_up_date'] = lastCheckUpDate;
    map['icon'] = icon;
    map['units_id'] = unitsId;
    map['status_id'] = statusId;
    map['ref_range_value'] = refRangeValue;
    map['remarks'] = remarks;
    map['nurse_id'] = nurseId;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}