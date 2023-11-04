// To parse this JSON data, do
//
//     final userProfileModel = userProfileModelFromJson(jsonString);

import 'dart:convert';

UserProfileModel userProfileModelFromJson(String str) => UserProfileModel.fromJson(json.decode(str));

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  int? status;
  PatientsDetails? patientsDetails;
  List<dynamic>? appointments;

  UserProfileModel({
    this.status,
    this.patientsDetails,
    this.appointments,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    status: json["status"],
    patientsDetails: json["patients_details"] == null ? null : PatientsDetails.fromJson(json["patients_details"]),
    appointments: json["appointments"] == null ? [] : List<dynamic>.from(json["appointments"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "patients_details": patientsDetails?.toJson(),
    "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x)),
  };
}

class PatientsDetails {
  int? id;
  String? patientHnNumber;
  dynamic patientTitleId;
  dynamic patientNid;
  dynamic patientBcid;
  String? ptnBloodGroupId;
  String? patientFirstName;
  dynamic patientMiddleName;
  String? patientLastName;
  dynamic patientPreferredName;
  dynamic patientContactVia;
  dynamic patientHomePhone;
  dynamic patientWorkPhone;
  dynamic patientMobilePhone;
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
  dynamic title;
  dynamic religion;
  dynamic ethnicity;
  dynamic occupation;
  dynamic contactVia;
  PatientBirthSex? patientBirthSex;
  Statuses? statuses;
  dynamic city;
  dynamic state;
  dynamic usualProvider;
  dynamic usualAccount;
  BloodGroup? bloodGroup;
  dynamic vitalSign;

  PatientsDetails({
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
    this.title,
    this.religion,
    this.ethnicity,
    this.occupation,
    this.contactVia,
    this.patientBirthSex,
    this.statuses,
    this.city,
    this.state,
    this.usualProvider,
    this.usualAccount,
    this.bloodGroup,
    this.vitalSign,
  });

  factory PatientsDetails.fromJson(Map<String, dynamic> json) => PatientsDetails(
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
    title: json["title"],
    religion: json["religion"],
    ethnicity: json["ethnicity"],
    occupation: json["occupation"],
    contactVia: json["contact_via"],
    patientBirthSex: json["patient_birth_sex"] == null ? null : PatientBirthSex.fromJson(json["patient_birth_sex"]),
    statuses: json["statuses"] == null ? null : Statuses.fromJson(json["statuses"]),
    city: json["city"],
    state: json["state"],
    usualProvider: json["usual_provider"],
    usualAccount: json["usual_account"],
    bloodGroup: json["blood_group"] == null ? null : BloodGroup.fromJson(json["blood_group"]),
    vitalSign: json["vital_sign"],
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
    "title": title,
    "religion": religion,
    "ethnicity": ethnicity,
    "occupation": occupation,
    "contact_via": contactVia,
    "patient_birth_sex": patientBirthSex?.toJson(),
    "statuses": statuses?.toJson(),
    "city": city,
    "state": state,
    "usual_provider": usualProvider,
    "usual_account": usualAccount,
    "blood_group": bloodGroup?.toJson(),
    "vital_sign": vitalSign,
  };
}

class BloodGroup {
  int? id;
  String? bloodGroupName;

  BloodGroup({
    this.id,
    this.bloodGroupName,
  });

  factory BloodGroup.fromJson(Map<String, dynamic> json) => BloodGroup(
    id: json["id"],
    bloodGroupName: json["blood_group_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "blood_group_name": bloodGroupName,
  };
}

class PatientBirthSex {
  int? id;
  String? birthSexName;

  PatientBirthSex({
    this.id,
    this.birthSexName,
  });

  factory PatientBirthSex.fromJson(Map<String, dynamic> json) => PatientBirthSex(
    id: json["id"],
    birthSexName: json["birth_sex_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "birth_sex_name": birthSexName,
  };
}

class Statuses {
  int? id;
  String? statusName;

  Statuses({
    this.id,
    this.statusName,
  });

  factory Statuses.fromJson(Map<String, dynamic> json) => Statuses(
    id: json["id"],
    statusName: json["status_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status_name": statusName,
  };
}
