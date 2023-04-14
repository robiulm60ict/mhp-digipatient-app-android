import 'dart:convert';
TodaysAppointmentModel todaysAppointmentModelFromJson(String str) => TodaysAppointmentModel.fromJson(json.decode(str));
String todaysAppointmentModelToJson(TodaysAppointmentModel data) => json.encode(data.toJson());
class TodaysAppointmentModel {
  TodaysAppointmentModel({
      this.status, 
      this.message, 
      this.todaysPatientAppointments,});

  TodaysAppointmentModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['todaysPatientAppointments'] != null) {
      todaysPatientAppointments = [];
      json['todaysPatientAppointments'].forEach((v) {
        todaysPatientAppointments?.add(TodaysPatientAppointments.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  List<TodaysPatientAppointments>? todaysPatientAppointments;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (todaysPatientAppointments != null) {
      map['todaysPatientAppointments'] = todaysPatientAppointments?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

TodaysPatientAppointments todaysPatientAppointmentsFromJson(String str) => TodaysPatientAppointments.fromJson(json.decode(str));
String todaysPatientAppointmentsToJson(TodaysPatientAppointments data) => json.encode(data.toJson());
class TodaysPatientAppointments {
  TodaysPatientAppointments({
      this.id, 
      this.doctorsId, 
      this.patientId, 
      this.patientName, 
      this.patientMobile, 
      this.notes, 
      this.statusColor, 
      this.statusName, 
      this.startTime, 
      this.endTime, 
      this.subject, 
      this.appType, 
      this.mediaTypeOnline, 
      this.media, 
      this.deleteStatus, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt, 
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
      this.mediaTypeOnlineName,});

  TodaysPatientAppointments.fromJson(dynamic json) {
    id = json['id'];
    doctorsId = json['doctors_id'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    patientMobile = json['patient_mobile'];
    notes = json['notes'];
    statusColor = json['status_color'];
    statusName = json['status_name'];
    startTime = json['StartTime'];
    endTime = json['EndTime'];
    subject = json['Subject'];
    appType = json['app_type'];
    mediaTypeOnline = json['mediaType_online'];
    media = json['media'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    mediaTypeOnlineName = json['media_typeOnline_name'];
  }
  String? id;
  String? doctorsId;
  String? patientId;
  String? patientName;
  String? patientMobile;
  String? notes;
  String? statusColor;
  String? statusName;
  String? startTime;
  String? endTime;
  String? subject;
  String? appType;
  String? mediaTypeOnline;
  dynamic media;
  String? deleteStatus;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
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
  String? mediaTypeOnlineName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doctors_id'] = doctorsId;
    map['patient_id'] = patientId;
    map['patient_name'] = patientName;
    map['patient_mobile'] = patientMobile;
    map['notes'] = notes;
    map['status_color'] = statusColor;
    map['status_name'] = statusName;
    map['StartTime'] = startTime;
    map['EndTime'] = endTime;
    map['Subject'] = subject;
    map['app_type'] = appType;
    map['mediaType_online'] = mediaTypeOnline;
    map['media'] = media;
    map['delete_status'] = deleteStatus;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
    map['media_typeOnline_name'] = mediaTypeOnlineName;
    return map;
  }

}