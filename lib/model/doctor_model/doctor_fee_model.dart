import 'dart:convert';
DoctorFeeModel doctorFeeModelFromJson(String str) => DoctorFeeModel.fromJson(json.decode(str));
String doctorFeeModelToJson(DoctorFeeModel data) => json.encode(data.toJson());
class DoctorFeeModel {
  DoctorFeeModel({
      this.status, 
      this.doctors,});

  DoctorFeeModel.fromJson(dynamic json) {
    status = json['status'];
    doctors = json['doctors'] != null ? DoctorsFee.fromJson(json['doctors']) : null;
  }
  num? status;
  DoctorsFee? doctors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (doctors != null) {
      map['doctors'] = doctors?.toJson();
    }
    return map;
  }

}

DoctorsFee doctorsFromJson(String str) => DoctorsFee.fromJson(json.decode(str));
String doctorsToJson(DoctorsFee data) => json.encode(data.toJson());
class DoctorsFee {
  DoctorsFee({
      this.feeType, 
      this.amount, 
      this.doctorId, 
      this.id,});

  DoctorsFee.fromJson(dynamic json) {
    feeType = json['fee_type'];
    amount = json['amount'];
    doctorId = json['doctor_id'];
    id = json['id'];
  }
  String? feeType;
  String? amount;
  String? doctorId;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fee_type'] = feeType;
    map['amount'] = amount;
    map['doctor_id'] = doctorId;
    map['id'] = id;
    return map;
  }

}