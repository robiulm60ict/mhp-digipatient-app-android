class PatientListModel {
  int? status;
  List<Patients>? patients;

  PatientListModel({this.status, this.patients});

  PatientListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['patients'] != null) {
      patients = <Patients>[];
      json['patients'].forEach((v) {
        patients!.add(Patients.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (patients != null) {
      data['patients'] = patients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Patients {
  int? id;
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
  Title? title;
  PatientBirthSex? patientBirthSex;
  Statuses? statuses;
  UsualProvider? usualProvider;

  Patients(
      {this.id,
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
        this.title,
        this.patientBirthSex,
        this.statuses,
        this.usualProvider});

  Patients.fromJson(Map<String, dynamic> json) {
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
    patientIndividualHealthIdentifierNo =
    json['patient_individual_health_identifier_no'];
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
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    patientBirthSex = json['patient_birth_sex'] != null
        ?  PatientBirthSex.fromJson(json['patient_birth_sex'])
        : null;
    statuses = json['statuses'] != null
        ?  Statuses.fromJson(json['statuses'])
        : null;
    usualProvider = json['usual_provider'] != null
        ?  UsualProvider.fromJson(json['usual_provider'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['patient_hn_number'] = patientHnNumber;
    data['patient_title_id'] = patientTitleId;
    data['patient_nid'] = patientNid;
    data['patient_bcid'] = patientBcid;
    data['ptn_blood_group_id'] = ptnBloodGroupId;
    data['patient_first_name'] = patientFirstName;
    data['patient_middle_name'] = patientMiddleName;
    data['patient_last_name'] = patientLastName;
    data['patient_preferred_name'] = patientPreferredName;
    data['patient_contact_via'] = patientContactVia;
    data['patient_home_phone'] = patientHomePhone;
    data['patient_work_phone'] = patientWorkPhone;
    data['patient_mobile_phone'] = patientMobilePhone;
    data['patient_head_of_family'] = patientHeadOfFamily;
    data['patient_emergency_contact'] = patientEmergencyContact;
    data['patient_dob'] = patientDob;
    data['patient_passport'] = patientPassport;
    data['patient_status'] = patientStatus;
    data['patient_email'] = patientEmail;
    data['patient_birth_sex_id'] = patientBirthSexId;
    data['patient_individual_health_identifier_no'] =
        patientIndividualHealthIdentifierNo;
    data['patient_religion_id'] = patientReligionId;
    data['patient_usual_provider_id'] = patientUsualProviderId;
    data['patient_ethnicity_id'] = patientEthnicityId;
    data['patient_parent_id'] = patientParentId;
    data['patient_address1'] = patientAddress1;
    data['patient_address2'] = patientAddress2;
    data['patient_usual_visit_type_id'] = patientUsualVisitTypeId;
    data['patient_usual_account'] = patientUsualAccount;
    data['patient_deceased_date'] = patientDeceasedDate;
    data['patient_next_of_kin'] = patientNextOfKin;
    data['patient_medical_record_no'] = patientMedicalRecordNo;
    data['patient_city_id'] = patientCityId;
    data['patient_state_id'] = patientStateId;
    data['patient_safety_net_no'] = patientSafetyNetNo;
    data['patient_postal_code'] = patientPostalCode;
    data['patient_health_inc_fund'] = patientHealthIncFund;
    data['patient_health_inc_no'] = patientHealthIncNo;
    data['patient_expire_date'] = patientExpireDate;
    data['patient_medical_no'] = patientMedicalNo;
    data['patient_occupation_id'] = patientOccupationId;
    data['patient_hcc_no'] = patientHccNo;
    data['patient_images'] = patientImages;
    data['patient_general_notes'] = patientGeneralNotes;
    data['patient_appointment_notes'] = patientAppointmentNotes;
    data['lactation'] = lactation;
    data['delete_status'] = deleteStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (patientBirthSex != null) {
      data['patient_birth_sex'] = patientBirthSex!.toJson();
    }
    if (statuses != null) {
      data['statuses'] = statuses!.toJson();
    }
    if (usualProvider != null) {
      data['usual_provider'] = usualProvider!.toJson();
    }
    return data;
  }
}

class Title {
  int? id;
  String? titleName;

  Title({this.id, this.titleName});

  Title.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleName = json['title_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title_name'] = titleName;
    return data;
  }
}

class PatientBirthSex {
  int? id;
  String? birthSexName;

  PatientBirthSex({this.id, this.birthSexName});

  PatientBirthSex.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    birthSexName = json['birth_sex_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['birth_sex_name'] = birthSexName;
    return data;
  }
}

class Statuses {
  int? id;
  String? statusName;

  Statuses({this.id, this.statusName});

  Statuses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status_name'] = statusName;
    return data;
  }
}

class UsualProvider {
  int? id;
  String? usualProviderName;

  UsualProvider({this.id, this.usualProviderName});

  UsualProvider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    usualProviderName = json['usual_provider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['usual_provider_name'] = usualProviderName;
    return data;
  }
}
