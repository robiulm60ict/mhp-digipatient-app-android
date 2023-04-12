import 'dart:convert';
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());
class UserModel {
  UserModel({
      this.status, 
      this.patient,});

  UserModel.fromJson(dynamic json) {
    status = json['status'];
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
  }
  num? status;
  Patient? patient;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    return map;
  }

}

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));
String patientToJson(Patient data) => json.encode(data.toJson());
class Patient {
  Patient({
      this.id, 
      this.patientHnNumber, 
      this.patientTitleId, 
      this.patientNid, 
      this.patientBcid, 
      this.ptnBloodGroupId, 
      this.patientFirstName, 
      this.patientMiddleName, 
      this.patientLastName, 
      this.patientPreferredName, 
      this.patientContactVia, 
      this.patientHomePhone, 
      this.patientWorkPhone, 
      this.patientMobilePhone, 
      this.patientHeadOfFamily, 
      this.patientEmergencyContact, 
      this.patientDob, 
      this.patientPassport, 
      this.patientStatus, 
      this.patientEmail, 
      this.patientBirthSexId, 
      this.patientIndividualHealthIdentifierNo, 
      this.patientReligionId, 
      this.patientUsualProviderId, 
      this.patientEthnicityId, 
      this.patientParentId, 
      this.patientAddress1, 
      this.patientAddress2, 
      this.patientUsualVisitTypeId, 
      this.patientUsualAccount, 
      this.patientDeceasedDate, 
      this.patientNextOfKin, 
      this.patientMedicalRecordNo, 
      this.patientCityId, 
      this.patientStateId, 
      this.patientSafetyNetNo, 
      this.patientPostalCode, 
      this.patientHealthIncFund, 
      this.patientHealthIncNo, 
      this.patientExpireDate, 
      this.patientMedicalNo, 
      this.patientOccupationId, 
      this.patientHccNo, 
      this.patientImages, 
      this.patientGeneralNotes, 
      this.patientAppointmentNotes, 
      this.lactation, 
      this.deleteStatus, 
      this.createdAt, 
      this.updatedAt, 
      this.patientBirthSex,});

  Patient.fromJson(dynamic json) {
    id = json['id'];
    patientHnNumber = json['patient_hn_number'];
    patientTitleId = json['patient_title_id'];
    patientNid = json['patient_nid'];
    patientBcid = json['patient_bcid'];
    ptnBloodGroupId = json['ptn_blood_group_id'];
    patientFirstName = json['patient_first_name'];
    patientMiddleName = json['patient_middle_name'];
    patientLastName = json['patient_last_name'];
    patientPreferredName = json['patient_preferred_name'];
    patientContactVia = json['patient_contact_via'];
    patientHomePhone = json['patient_home_phone'];
    patientWorkPhone = json['patient_work_phone'];
    patientMobilePhone = json['patient_mobile_phone'];
    patientHeadOfFamily = json['patient_head_of_family'];
    patientEmergencyContact = json['patient_emergency_contact'];
    patientDob = json['patient_dob'];
    patientPassport = json['patient_passport'];
    patientStatus = json['patient_status'];
    patientEmail = json['patient_email'];
    patientBirthSexId = json['patient_birth_sex_id'];
    patientIndividualHealthIdentifierNo = json['patient_individual_health_identifier_no'];
    patientReligionId = json['patient_religion_id'];
    patientUsualProviderId = json['patient_usual_provider_id'];
    patientEthnicityId = json['patient_ethnicity_id'];
    patientParentId = json['patient_parent_id'];
    patientAddress1 = json['patient_address1'];
    patientAddress2 = json['patient_address2'];
    patientUsualVisitTypeId = json['patient_usual_visit_type_id'];
    patientUsualAccount = json['patient_usual_account'];
    patientDeceasedDate = json['patient_deceased_date'];
    patientNextOfKin = json['patient_next_of_kin'];
    patientMedicalRecordNo = json['patient_medical_record_no'];
    patientCityId = json['patient_city_id'];
    patientStateId = json['patient_state_id'];
    patientSafetyNetNo = json['patient_safety_net_no'];
    patientPostalCode = json['patient_postal_code'];
    patientHealthIncFund = json['patient_health_inc_fund'];
    patientHealthIncNo = json['patient_health_inc_no'];
    patientExpireDate = json['patient_expire_date'];
    patientMedicalNo = json['patient_medical_no'];
    patientOccupationId = json['patient_occupation_id'];
    patientHccNo = json['patient_hcc_no'];
    patientImages = json['patient_images'];
    patientGeneralNotes = json['patient_general_notes'];
    patientAppointmentNotes = json['patient_appointment_notes'];
    lactation = json['lactation'];
    deleteStatus = json['delete_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    patientBirthSex = json['patient_birth_sex'] != null ? PatientBirthSex.fromJson(json['patient_birth_sex']) : null;
  }
  num? id;
  String? patientHnNumber;
  String? patientTitleId;
  String? patientNid;
  String? patientBcid;
  String? ptnBloodGroupId;
  String? patientFirstName;
  String? patientMiddleName;
  String? patientLastName;
  String? patientPreferredName;
  String? patientContactVia;
  String? patientHomePhone;
  String? patientWorkPhone;
  String? patientMobilePhone;
  String? patientHeadOfFamily;
  String? patientEmergencyContact;
  String? patientDob;
  String? patientPassport;
  String? patientStatus;
  String? patientEmail;
  String? patientBirthSexId;
  String? patientIndividualHealthIdentifierNo;
  String? patientReligionId;
  String? patientUsualProviderId;
  String? patientEthnicityId;
  String? patientParentId;
  String? patientAddress1;
  String? patientAddress2;
  String? patientUsualVisitTypeId;
  String? patientUsualAccount;
  String? patientDeceasedDate;
  String? patientNextOfKin;
  String? patientMedicalRecordNo;
  String? patientCityId;
  String? patientStateId;
  String? patientSafetyNetNo;
  String? patientPostalCode;
  String? patientHealthIncFund;
  String? patientHealthIncNo;
  String? patientExpireDate;
  String? patientMedicalNo;
  String? patientOccupationId;
  String? patientHccNo;
  String? patientImages;
  String? patientGeneralNotes;
  String? patientAppointmentNotes;
  String? lactation;
  String? deleteStatus;
  String? createdAt;
  String? updatedAt;
  PatientBirthSex? patientBirthSex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['patient_hn_number'] = patientHnNumber;
    map['patient_title_id'] = patientTitleId;
    map['patient_nid'] = patientNid;
    map['patient_bcid'] = patientBcid;
    map['ptn_blood_group_id'] = ptnBloodGroupId;
    map['patient_first_name'] = patientFirstName;
    map['patient_middle_name'] = patientMiddleName;
    map['patient_last_name'] = patientLastName;
    map['patient_preferred_name'] = patientPreferredName;
    map['patient_contact_via'] = patientContactVia;
    map['patient_home_phone'] = patientHomePhone;
    map['patient_work_phone'] = patientWorkPhone;
    map['patient_mobile_phone'] = patientMobilePhone;
    map['patient_head_of_family'] = patientHeadOfFamily;
    map['patient_emergency_contact'] = patientEmergencyContact;
    map['patient_dob'] = patientDob;
    map['patient_passport'] = patientPassport;
    map['patient_status'] = patientStatus;
    map['patient_email'] = patientEmail;
    map['patient_birth_sex_id'] = patientBirthSexId;
    map['patient_individual_health_identifier_no'] = patientIndividualHealthIdentifierNo;
    map['patient_religion_id'] = patientReligionId;
    map['patient_usual_provider_id'] = patientUsualProviderId;
    map['patient_ethnicity_id'] = patientEthnicityId;
    map['patient_parent_id'] = patientParentId;
    map['patient_address1'] = patientAddress1;
    map['patient_address2'] = patientAddress2;
    map['patient_usual_visit_type_id'] = patientUsualVisitTypeId;
    map['patient_usual_account'] = patientUsualAccount;
    map['patient_deceased_date'] = patientDeceasedDate;
    map['patient_next_of_kin'] = patientNextOfKin;
    map['patient_medical_record_no'] = patientMedicalRecordNo;
    map['patient_city_id'] = patientCityId;
    map['patient_state_id'] = patientStateId;
    map['patient_safety_net_no'] = patientSafetyNetNo;
    map['patient_postal_code'] = patientPostalCode;
    map['patient_health_inc_fund'] = patientHealthIncFund;
    map['patient_health_inc_no'] = patientHealthIncNo;
    map['patient_expire_date'] = patientExpireDate;
    map['patient_medical_no'] = patientMedicalNo;
    map['patient_occupation_id'] = patientOccupationId;
    map['patient_hcc_no'] = patientHccNo;
    map['patient_images'] = patientImages;
    map['patient_general_notes'] = patientGeneralNotes;
    map['patient_appointment_notes'] = patientAppointmentNotes;
    map['lactation'] = lactation;
    map['delete_status'] = deleteStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (patientBirthSex != null) {
      map['patient_birth_sex'] = patientBirthSex?.toJson();
    }
    return map;
  }

}

PatientBirthSex patientBirthSexFromJson(String str) => PatientBirthSex.fromJson(json.decode(str));
String patientBirthSexToJson(PatientBirthSex data) => json.encode(data.toJson());
class PatientBirthSex {
  PatientBirthSex({
      this.id, 
      this.birthSexName,});

  PatientBirthSex.fromJson(dynamic json) {
    id = json['id'];
    birthSexName = json['birth_sex_name'];
  }
  num? id;
  String? birthSexName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['birth_sex_name'] = birthSexName;
    return map;
  }

}