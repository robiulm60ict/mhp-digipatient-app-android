// To parse this JSON data, do
//
//     final preccriptionListModel = preccriptionListModelFromJson(jsonString);

import 'dart:convert';

List<PreccriptionListModel> preccriptionListModelFromJson(String str) => List<PreccriptionListModel>.from(json.decode(str).map((x) => PreccriptionListModel.fromJson(x)));

String preccriptionListModelToJson(List<PreccriptionListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreccriptionListModel {
  int? id;
  String? patientId;
  String? doctorId;
  String? date;
  String? prescriptionUrl;
  dynamic createdAt;
  dynamic updatedAt;
  Patient? patient;
  Doctor? doctor;

  PreccriptionListModel({
    this.id,
    this.patientId,
    this.doctorId,
    this.date,
    this.prescriptionUrl,
    this.createdAt,
    this.updatedAt,
    this.patient,
    this.doctor,
  });

  factory PreccriptionListModel.fromJson(Map<String, dynamic> json) => PreccriptionListModel(
    id: json["id"],
    patientId: json["patient_id"],
    doctorId: json["doctor_id"],
    date: json["date"],
    prescriptionUrl: json["prescription_url"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "doctor_id": doctorId,
    "date": date,
    "prescription_url": prescriptionUrl,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "patient": patient?.toJson(),
    "doctor": doctor?.toJson(),
  };
}

class Doctor {
  int? id;
  String? drIdentityNo;
  String? title;
  String? departmentId;
  String? specialistsId;
  dynamic departmentName;
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
  dynamic drIsReferred;
  DateTime? drDob;
  String? drBirthSexId;
  String? drCityId;
  String? drPostalCode;
  String? drHomePhone;
  String? drWorkPhone;
  String? drMobilePhone;
  String? drContactViaId;
  String? drProviderId;
  String? drImages;
  String? doctorFee;
  dynamic appToken;
  String? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Doctor({
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
    this.doctorFee,
    this.appToken,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    drIdentityNo: json["dr_identity_no"],
    title: json["title"],
    departmentId: json["department_id"],
    specialistsId: json["specialists_id"],
    departmentName: json["department_name"],
    drFamilyName: json["dr_family_name"],
    drGivenName: json["dr_given_name"],
    drMiddleName: json["dr_middle_name"],
    drLastName: json["dr_last_name"],
    drPreferredName: json["dr_preferred_name"],
    drAbout: json["dr_about"],
    workExperienceYears: json["work_experience_years"],
    drAddressLine1: json["dr_address_line_1"],
    drAddressLine2: json["dr_address_line_2"],
    drBmdcRegNo: json["dr_bmdc_reg_no"],
    drEmail: json["dr_email"],
    drIsReferred: json["dr_is_referred"],
    drDob: json["dr_dob"] == null ? null : DateTime.parse(json["dr_dob"]),
    drBirthSexId: json["dr_birth_sex_id"],
    drCityId: json["dr_city_id"],
    drPostalCode: json["dr_postal_code"],
    drHomePhone: json["dr_home_phone"],
    drWorkPhone: json["dr_work_phone"],
    drMobilePhone: json["dr_mobile_phone"],
    drContactViaId: json["dr_contact_via_id"],
    drProviderId: json["dr_provider_id"],
    drImages: json["dr_images"],
    doctorFee: json["doctor_fee"],
    appToken: json["app_token"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dr_identity_no": drIdentityNo,
    "title": title,
    "department_id": departmentId,
    "specialists_id": specialistsId,
    "department_name": departmentName,
    "dr_family_name": drFamilyName,
    "dr_given_name": drGivenName,
    "dr_middle_name": drMiddleName,
    "dr_last_name": drLastName,
    "dr_preferred_name": drPreferredName,
    "dr_about": drAbout,
    "work_experience_years": workExperienceYears,
    "dr_address_line_1": drAddressLine1,
    "dr_address_line_2": drAddressLine2,
    "dr_bmdc_reg_no": drBmdcRegNo,
    "dr_email": drEmail,
    "dr_is_referred": drIsReferred,
    "dr_dob": "${drDob!.year.toString().padLeft(4, '0')}-${drDob!.month.toString().padLeft(2, '0')}-${drDob!.day.toString().padLeft(2, '0')}",
    "dr_birth_sex_id": drBirthSexId,
    "dr_city_id": drCityId,
    "dr_postal_code": drPostalCode,
    "dr_home_phone": drHomePhone,
    "dr_work_phone": drWorkPhone,
    "dr_mobile_phone": drMobilePhone,
    "dr_contact_via_id": drContactViaId,
    "dr_provider_id": drProviderId,
    "dr_images": drImages,
    "doctor_fee": doctorFee,
    "app_token": appToken,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Patient {
  int? id;
  String? patientHnNumber;
  dynamic patientTitleId;
  dynamic patientNid;
  dynamic patientBcid;
  String? ptnBloodGroupId;
  String? patientFirstName;
  dynamic patientMiddleName;
  String? patientLastName;
  String? patientPreferredName;
  dynamic patientContactVia;
  dynamic patientHomePhone;
  dynamic patientWorkPhone;
  String? patientMobilePhone;
  dynamic patientHeadOfFamily;
  dynamic patientEmergencyContact;
  String? patientDob;
  dynamic patientPassport;
  String? patientStatus;
  String? patientEmail;
  String? patientBirthSexId;
  dynamic patientIndividualHealthIdentifierNo;
  dynamic patientReligionId;
  dynamic patientUsualProviderId;
  dynamic patientEthnicityId;
  dynamic patientParentId;
  String? patientAddress1;
  dynamic patientAddress2;
  dynamic patientUsualVisitTypeId;
  dynamic patientUsualAccount;
  dynamic patientDeceasedDate;
  dynamic patientNextOfKin;
  dynamic patientMedicalRecordNo;
  dynamic patientCityId;
  dynamic patientStateId;
  dynamic patientSafetyNetNo;
  dynamic patientPostalCode;
  dynamic patientHealthIncFund;
  dynamic patientHealthIncNo;
  dynamic patientExpireDate;
  dynamic patientMedicalNo;
  dynamic patientOccupationId;
  dynamic patientHccNo;
  String? patientImages;
  dynamic patientGeneralNotes;
  dynamic patientAppointmentNotes;
  int? lactation;
  dynamic appToken;
  int? deleteStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

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
    this.appToken,
    this.deleteStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    patientHnNumber: json["patient_hn_number"],
    patientTitleId: json["patient_title_id"],
    patientNid: json["patient_nid"],
    patientBcid: json["patient_bcid"],
    ptnBloodGroupId: json["ptn_blood_group_id"],
    patientFirstName: json["patient_first_name"],
    patientMiddleName: json["patient_middle_name"],
    patientLastName: json["patient_last_name"],
    patientPreferredName: json["patient_preferred_name"],
    patientContactVia: json["patient_contact_via"],
    patientHomePhone: json["patient_home_phone"],
    patientWorkPhone: json["patient_work_phone"],
    patientMobilePhone: json["patient_mobile_phone"],
    patientHeadOfFamily: json["patient_head_of_family"],
    patientEmergencyContact: json["patient_emergency_contact"],
    patientDob: json["patient_dob"],
    patientPassport: json["patient_passport"],
    patientStatus: json["patient_status"],
    patientEmail: json["patient_email"],
    patientBirthSexId: json["patient_birth_sex_id"],
    patientIndividualHealthIdentifierNo: json["patient_individual_health_identifier_no"],
    patientReligionId: json["patient_religion_id"],
    patientUsualProviderId: json["patient_usual_provider_id"],
    patientEthnicityId: json["patient_ethnicity_id"],
    patientParentId: json["patient_parent_id"],
    patientAddress1: json["patient_address1"],
    patientAddress2: json["patient_address2"],
    patientUsualVisitTypeId: json["patient_usual_visit_type_id"],
    patientUsualAccount: json["patient_usual_account"],
    patientDeceasedDate: json["patient_deceased_date"],
    patientNextOfKin: json["patient_next_of_kin"],
    patientMedicalRecordNo: json["patient_medical_record_no"],
    patientCityId: json["patient_city_id"],
    patientStateId: json["patient_state_id"],
    patientSafetyNetNo: json["patient_safety_net_no"],
    patientPostalCode: json["patient_postal_code"],
    patientHealthIncFund: json["patient_health_inc_fund"],
    patientHealthIncNo: json["patient_health_inc_no"],
    patientExpireDate: json["patient_expire_date"],
    patientMedicalNo: json["patient_medical_no"],
    patientOccupationId: json["patient_occupation_id"],
    patientHccNo: json["patient_hcc_no"],
    patientImages: json["patient_images"],
    patientGeneralNotes: json["patient_general_notes"],
    patientAppointmentNotes: json["patient_appointment_notes"],
    lactation: json["lactation"],
    appToken: json["app_token"],
    deleteStatus: json["delete_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_hn_number": patientHnNumber,
    "patient_title_id": patientTitleId,
    "patient_nid": patientNid,
    "patient_bcid": patientBcid,
    "ptn_blood_group_id": ptnBloodGroupId,
    "patient_first_name": patientFirstName,
    "patient_middle_name": patientMiddleName,
    "patient_last_name": patientLastName,
    "patient_preferred_name": patientPreferredName,
    "patient_contact_via": patientContactVia,
    "patient_home_phone": patientHomePhone,
    "patient_work_phone": patientWorkPhone,
    "patient_mobile_phone": patientMobilePhone,
    "patient_head_of_family": patientHeadOfFamily,
    "patient_emergency_contact": patientEmergencyContact,
    "patient_dob": patientDob,
    "patient_passport": patientPassport,
    "patient_status": patientStatus,
    "patient_email": patientEmail,
    "patient_birth_sex_id": patientBirthSexId,
    "patient_individual_health_identifier_no": patientIndividualHealthIdentifierNo,
    "patient_religion_id": patientReligionId,
    "patient_usual_provider_id": patientUsualProviderId,
    "patient_ethnicity_id": patientEthnicityId,
    "patient_parent_id": patientParentId,
    "patient_address1": patientAddress1,
    "patient_address2": patientAddress2,
    "patient_usual_visit_type_id": patientUsualVisitTypeId,
    "patient_usual_account": patientUsualAccount,
    "patient_deceased_date": patientDeceasedDate,
    "patient_next_of_kin": patientNextOfKin,
    "patient_medical_record_no": patientMedicalRecordNo,
    "patient_city_id": patientCityId,
    "patient_state_id": patientStateId,
    "patient_safety_net_no": patientSafetyNetNo,
    "patient_postal_code": patientPostalCode,
    "patient_health_inc_fund": patientHealthIncFund,
    "patient_health_inc_no": patientHealthIncNo,
    "patient_expire_date": patientExpireDate,
    "patient_medical_no": patientMedicalNo,
    "patient_occupation_id": patientOccupationId,
    "patient_hcc_no": patientHccNo,
    "patient_images": patientImages,
    "patient_general_notes": patientGeneralNotes,
    "patient_appointment_notes": patientAppointmentNotes,
    "lactation": lactation,
    "app_token": appToken,
    "delete_status": deleteStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
