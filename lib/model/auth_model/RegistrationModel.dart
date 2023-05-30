// import 'dart:convert';
// RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));
// String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());
// class RegistrationModel {
//   RegistrationModel({
//       this.message,
//       this.patients,});
//
//   RegistrationModel.fromJson(dynamic json) {
//     message = json['message'];
//     patients = json['patients'] != null ? Patients.fromJson(json['patients']) : null;
//   }
//   String? message;
//   Patients? patients;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['message'] = message;
//     if (patients != null) {
//       map['patients'] = patients?.toJson();
//     }
//     return map;
//   }
//
// }
//
// Patients patientsFromJson(String str) => Patients.fromJson(json.decode(str));
// String patientsToJson(Patients data) => json.encode(data.toJson());
// class Patients {
//   Patients({
//       this.patientHnNumber,
//       this.patientFirstName,
//       this.ptnBloodGroupId,
//       this.patientLastName,
//       this.patientMobilePhone,
//       this.patientBirthSexId,
//       this.patientAddress1,
//       this.patientImages,
//       this.patientDob,
//       this.patientStatus,
//       this.patientEmail,
//       this.updatedAt,
//       this.createdAt,
//       this.id,});
//
//   Patients.fromJson(dynamic json) {
//     patientHnNumber = json['patient_hn_number'];
//     patientFirstName = json['patient_first_name'];
//     ptnBloodGroupId = json['ptn_blood_group_id'];
//     patientLastName = json['patient_last_name'];
//     patientMobilePhone = json['patient_mobile_phone'];
//     patientBirthSexId = json['patient_birth_sex_id'];
//     patientAddress1 = json['patient_address1'];
//     patientImages = json['patient_images'];
//     patientDob = json['patient_dob'];
//     patientStatus = json['patient_status'];
//     patientEmail = json['patient_email'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//     id = json['id'];
//   }
//   String? patientHnNumber;
//   String? patientFirstName;
//   String? ptnBloodGroupId;
//   String? patientLastName;
//   String? patientMobilePhone;
//   String? patientBirthSexId;
//   String? patientAddress1;
//   String? patientImages;
//   String? patientDob;
//   num? patientStatus;
//   String? patientEmail;
//   String? updatedAt;
//   String? createdAt;
//   num? id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['patient_hn_number'] = patientHnNumber;
//     map['patient_first_name'] = patientFirstName;
//     map['ptn_blood_group_id'] = ptnBloodGroupId;
//     map['patient_last_name'] = patientLastName;
//     map['patient_mobile_phone'] = patientMobilePhone;
//     map['patient_birth_sex_id'] = patientBirthSexId;
//     map['patient_address1'] = patientAddress1;
//     map['patient_images'] = patientImages;
//     map['patient_dob'] = patientDob;
//     map['patient_status'] = patientStatus;
//     map['patient_email'] = patientEmail;
//     map['updated_at'] = updatedAt;
//     map['created_at'] = createdAt;
//     map['id'] = id;
//     return map;
//   }
//
// }

import 'dart:convert';
RegistrationModel registrationModelLFromJson(String str) => RegistrationModel.fromJson(json.decode(str));
String registrationModelLToJson(RegistrationModel data) => json.encode(data.toJson());
class RegistrationModel {
  RegistrationModel({
    this.message,
    this.patients,
    this.data,});

  RegistrationModel.fromJson(dynamic json) {
    message = json['message'];
    patients = json['patients'] != null ? Patients.fromJson(json['patients']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Patients? patients;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (patients != null) {
      map['patients'] = patients?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    this.name,
    this.email,
    this.userType,
    this.userId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.profilePhotoUrl,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    userType = json['user_type'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  String? name;
  String? email;
  String? userType;
  num? userId;
  String? updatedAt;
  String? createdAt;
  num? id;
  String? profilePhotoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['user_type'] = userType;
    map['user_id'] = userId;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }

}

Patients patientsFromJson(String str) => Patients.fromJson(json.decode(str));
String patientsToJson(Patients data) => json.encode(data.toJson());
class Patients {
  Patients({
    this.patientHnNumber,
    this.patientFirstName,
    this.ptnBloodGroupId,
    this.patientLastName,
    this.patientMobilePhone,
    this.patientBirthSexId,
    this.patientAddress1,
    this.patientImages,
    this.patientDob,
    this.patientStatus,
    this.patientEmail,
    this.updatedAt,
    this.createdAt,
    this.id,});

  Patients.fromJson(dynamic json) {
    patientHnNumber = json['patient_hn_number'];
    patientFirstName = json['patient_first_name'];
    ptnBloodGroupId = json['ptn_blood_group_id'];
    patientLastName = json['patient_last_name'];
    patientMobilePhone = json['patient_mobile_phone'];
    patientBirthSexId = json['patient_birth_sex_id'];
    patientAddress1 = json['patient_address1'];
    patientImages = json['patient_images'];
    patientDob = json['patient_dob'];
    patientStatus = json['patient_status'];
    patientEmail = json['patient_email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? patientHnNumber;
  String? patientFirstName;
  String? ptnBloodGroupId;
  String? patientLastName;
  String? patientMobilePhone;
  String? patientBirthSexId;
  String? patientAddress1;
  String? patientImages;
  String? patientDob;
  num? patientStatus;
  String? patientEmail;
  String? updatedAt;
  String? createdAt;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['patient_hn_number'] = patientHnNumber;
    map['patient_first_name'] = patientFirstName;
    map['ptn_blood_group_id'] = ptnBloodGroupId;
    map['patient_last_name'] = patientLastName;
    map['patient_mobile_phone'] = patientMobilePhone;
    map['patient_birth_sex_id'] = patientBirthSexId;
    map['patient_address1'] = patientAddress1;
    map['patient_images'] = patientImages;
    map['patient_dob'] = patientDob;
    map['patient_status'] = patientStatus;
    map['patient_email'] = patientEmail;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}