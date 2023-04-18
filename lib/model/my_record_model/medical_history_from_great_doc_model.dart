import 'dart:convert';
MedicalHistoryFromGreatDocModel medicalHistoryFromGreatDocModelFromJson(String str) => MedicalHistoryFromGreatDocModel.fromJson(json.decode(str));
String medicalHistoryFromGreatDocModelToJson(MedicalHistoryFromGreatDocModel data) => json.encode(data.toJson());
class MedicalHistoryFromGreatDocModel {
  MedicalHistoryFromGreatDocModel({
      this.status, 
      this.message, 
      this.pastHistory,});

  MedicalHistoryFromGreatDocModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['past_history'] != null) {
      pastHistory = [];
      json['past_history'].forEach((v) {
        pastHistory?.add(PastHistory.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  List<PastHistory>? pastHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (pastHistory != null) {
      map['past_history'] = pastHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

PastHistory pastHistoryFromJson(String str) => PastHistory.fromJson(json.decode(str));
String pastHistoryToJson(PastHistory data) => json.encode(data.toJson());
class PastHistory {
  PastHistory({
      this.id, 
      this.patientId, 
      this.doctorId, 
      this.date, 
      this.condition, 
      this.code, 
      this.saverty, 
      this.description, 
      this.summary, 
      this.confidential, 
      this.myHealthRecord, 
      this.details, 
      this.createdAt, 
      this.updatedAt, 
      this.doctor,});

  PastHistory.fromJson(dynamic json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    condition = json['condition'];
    code = json['code'];
    saverty = json['saverty'];
    description = json['description'];
    summary = json['summary'];
    confidential = json['confidential'];
    myHealthRecord = json['myHealthRecord'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctor = json['doctor'] != null ? DoctorGreatDoc.fromJson(json['doctor']) : null;
  }
  num? id;
  String? patientId;
  String? doctorId;
  String? date;
  String? condition;
  String? code;
  String? saverty;
  String? description;
  String? summary;
  String? confidential;
  String? myHealthRecord;
  String? details;
  String? createdAt;
  String? updatedAt;
  DoctorGreatDoc? doctor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['patient_id'] = patientId;
    map['doctor_id'] = doctorId;
    map['date'] = date;
    map['condition'] = condition;
    map['code'] = code;
    map['saverty'] = saverty;
    map['description'] = description;
    map['summary'] = summary;
    map['confidential'] = confidential;
    map['myHealthRecord'] = myHealthRecord;
    map['details'] = details;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (doctor != null) {
      map['doctor'] = doctor?.toJson();
    }
    return map;
  }

}

DoctorGreatDoc doctorFromJson(String str) => DoctorGreatDoc.fromJson(json.decode(str));
String doctorToJson(DoctorGreatDoc data) => json.encode(data.toJson());
class DoctorGreatDoc {
  DoctorGreatDoc({
      this.id, 
      this.drIdentityNo, 
      this.title, 
      this.departmentId, 
      this.specialistsId, 
      this.departmentName, 
      this.drFamilyName, 
      this.drGivenName, 
      this.drMiddleName, 
      this.drLastName, 
      this.drPreferredName, 
      this.drAbout, 
      this.workExperienceYears, 
      this.drAddressLine1, 
      this.drAddressLine2, 
      this.drBmdcRegNo, 
      this.drEmail, 
      this.drIsReferred, 
      this.drDob, 
      this.drBirthSexId, 
      this.drCityId, 
      this.drPostalCode, 
      this.drHomePhone, 
      this.drWorkPhone, 
      this.drMobilePhone, 
      this.drContactViaId, 
      this.drProviderId, 
      this.drImages, 
      this.deleteStatus, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt,});

  DoctorGreatDoc.fromJson(dynamic json) {
    id = json['id'];
    drIdentityNo = json['dr_identity_no'];
    title = json['title'];
    departmentId = json['department_id'];
    specialistsId = json['specialists_id'];
    departmentName = json['department_name'];
    drFamilyName = json['dr_family_name'];
    drGivenName = json['dr_given_name'];
    drMiddleName = json['dr_middle_name'];
    drLastName = json['dr_last_name'];
    drPreferredName = json['dr_preferred_name'];
    drAbout = json['dr_about'];
    workExperienceYears = json['work_experience_years'];
    drAddressLine1 = json['dr_address_line_1'];
    drAddressLine2 = json['dr_address_line_2'];
    drBmdcRegNo = json['dr_bmdc_reg_no'];
    drEmail = json['dr_email'];
    drIsReferred = json['dr_is_referred'];
    drDob = json['dr_dob'];
    drBirthSexId = json['dr_birth_sex_id'];
    drCityId = json['dr_city_id'];
    drPostalCode = json['dr_postal_code'];
    drHomePhone = json['dr_home_phone'];
    drWorkPhone = json['dr_work_phone'];
    drMobilePhone = json['dr_mobile_phone'];
    drContactViaId = json['dr_contact_via_id'];
    drProviderId = json['dr_provider_id'];
    drImages = json['dr_images'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? drIdentityNo;
  String? title;
  String? departmentId;
  String? specialistsId;
  String? departmentName;
  String? drFamilyName;
  String? drGivenName;
  String? drMiddleName;
  String? drLastName;
  String? drPreferredName;
  String? drAbout;
  String? workExperienceYears;
  String? drAddressLine1;
  String? drAddressLine2;
  String? drBmdcRegNo;
  String? drEmail;
  String? drIsReferred;
  String? drDob;
  String? drBirthSexId;
  String? drCityId;
  String? drPostalCode;
  String? drHomePhone;
  String? drWorkPhone;
  String? drMobilePhone;
  String? drContactViaId;
  String? drProviderId;
  String? drImages;
  String? deleteStatus;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['dr_identity_no'] = drIdentityNo;
    map['title'] = title;
    map['department_id'] = departmentId;
    map['specialists_id'] = specialistsId;
    map['department_name'] = departmentName;
    map['dr_family_name'] = drFamilyName;
    map['dr_given_name'] = drGivenName;
    map['dr_middle_name'] = drMiddleName;
    map['dr_last_name'] = drLastName;
    map['dr_preferred_name'] = drPreferredName;
    map['dr_about'] = drAbout;
    map['work_experience_years'] = workExperienceYears;
    map['dr_address_line_1'] = drAddressLine1;
    map['dr_address_line_2'] = drAddressLine2;
    map['dr_bmdc_reg_no'] = drBmdcRegNo;
    map['dr_email'] = drEmail;
    map['dr_is_referred'] = drIsReferred;
    map['dr_dob'] = drDob;
    map['dr_birth_sex_id'] = drBirthSexId;
    map['dr_city_id'] = drCityId;
    map['dr_postal_code'] = drPostalCode;
    map['dr_home_phone'] = drHomePhone;
    map['dr_work_phone'] = drWorkPhone;
    map['dr_mobile_phone'] = drMobilePhone;
    map['dr_contact_via_id'] = drContactViaId;
    map['dr_provider_id'] = drProviderId;
    map['dr_images'] = drImages;
    map['delete_status'] = deleteStatus;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}