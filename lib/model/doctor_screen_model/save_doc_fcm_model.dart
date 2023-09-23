class SaveDocFCMModel {
  int? status;
  String? message;
  Doctor? doctor;

  SaveDocFCMModel({this.status, this.message, this.doctor});

  SaveDocFCMModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    doctor =
    json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
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
  String? appToken;

  Doctor(
      {this.id,
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
        this.updatedAt,
        this.appToken});

  Doctor.fromJson(Map<String, dynamic> json) {
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
    appToken = json['app_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dr_identity_no'] = drIdentityNo;
    data['title'] = title;
    data['department_id'] = departmentId;
    data['specialists_id'] = specialistsId;
    data['department_name'] = departmentName;
    data['dr_family_name'] = drFamilyName;
    data['dr_given_name'] = drGivenName;
    data['dr_middle_name'] = drMiddleName;
    data['dr_last_name'] = drLastName;
    data['dr_preferred_name'] = drPreferredName;
    data['dr_about'] = drAbout;
    data['work_experience_years'] = workExperienceYears;
    data['dr_address_line_1'] = drAddressLine1;
    data['dr_address_line_2'] = drAddressLine2;
    data['dr_bmdc_reg_no'] = drBmdcRegNo;
    data['dr_email'] = drEmail;
    data['dr_is_referred'] = drIsReferred;
    data['dr_dob'] = drDob;
    data['dr_birth_sex_id'] = drBirthSexId;
    data['dr_city_id'] = drCityId;
    data['dr_postal_code'] = drPostalCode;
    data['dr_home_phone'] = drHomePhone;
    data['dr_work_phone'] = drWorkPhone;
    data['dr_mobile_phone'] = drMobilePhone;
    data['dr_contact_via_id'] = drContactViaId;
    data['dr_provider_id'] = drProviderId;
    data['dr_images'] = drImages;
    data['delete_status'] = deleteStatus;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['app_token'] = appToken;
    return data;
  }
}
