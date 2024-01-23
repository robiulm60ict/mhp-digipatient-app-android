// To parse this JSON data, do
//
//     final doctorProfiles = doctorProfilesFromJson(jsonString);

import 'dart:convert';

DoctorProfiles doctorProfilesFromJson(String str) => DoctorProfiles.fromJson(json.decode(str));

String doctorProfilesToJson(DoctorProfiles data) => json.encode(data.toJson());

class DoctorProfiles {
  int? status;
  List<Doctor>? doctors;
  List<BirthSexElement>? birthSex;

  DoctorProfiles({
    this.status,
    this.doctors,
    this.birthSex,
  });

  factory DoctorProfiles.fromJson(Map<String, dynamic> json) => DoctorProfiles(
    status: json["status"],
    doctors: json["doctors"] == null ? [] : List<Doctor>.from(json["doctors"]!.map((x) => Doctor.fromJson(x))),
    birthSex: json["birth_sex"] == null ? [] : List<BirthSexElement>.from(json["birth_sex"]!.map((x) => BirthSexElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "doctors": doctors == null ? [] : List<dynamic>.from(doctors!.map((x) => x.toJson())),
    "birth_sex": birthSex == null ? [] : List<dynamic>.from(birthSex!.map((x) => x.toJson())),
  };
}

class BirthSexElement {
  int? id;
  String? birthSexName;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  BirthSexElement({
    this.id,
    this.birthSexName,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory BirthSexElement.fromJson(Map<String, dynamic> json) => BirthSexElement(
    id: json["id"],
    birthSexName: json["birth_sex_name"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "birth_sex_name": birthSexName,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Doctor {
  int? id;
  String? drIdentityNo;
  Title? title;
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
  dynamic appToken;
  String? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  DoctorBirthSex? birthSex;
  UsualProvider? usualProvider;
  Department? department;
  Specialist? specialist;

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
    this.appToken,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.birthSex,
    this.usualProvider,
    this.department,
    this.specialist,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    drIdentityNo: json["dr_identity_no"],
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
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
    appToken: json["app_token"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    birthSex: json["birth_sex"] == null ? null : DoctorBirthSex.fromJson(json["birth_sex"]),
    usualProvider: json["usual_provider"] == null ? null : UsualProvider.fromJson(json["usual_provider"]),
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    specialist: json["specialist"] == null ? null : Specialist.fromJson(json["specialist"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dr_identity_no": drIdentityNo,
    "title": title?.toJson(),
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
    "app_token": appToken,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "birth_sex": birthSex?.toJson(),
    "usual_provider": usualProvider?.toJson(),
    "department": department?.toJson(),
    "specialist": specialist?.toJson(),
  };
}

class DoctorBirthSex {
  int? id;
  String? birthSexName;

  DoctorBirthSex({
    this.id,
    this.birthSexName,
  });

  factory DoctorBirthSex.fromJson(Map<String, dynamic> json) => DoctorBirthSex(
    id: json["id"],
    birthSexName: json["birth_sex_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "birth_sex_name": birthSexName,
  };
}

class Department {
  int? id;
  String? departmentsName;

  Department({
    this.id,
    this.departmentsName,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    departmentsName: json["departments_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "departments_name": departmentsName,
  };
}

class Specialist {
  int? id;
  String? specialistsName;

  Specialist({
    this.id,
    this.specialistsName,
  });

  factory Specialist.fromJson(Map<String, dynamic> json) => Specialist(
    id: json["id"],
    specialistsName: json["specialists_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "specialists_name": specialistsName,
  };
}

class Title {
  int? id;
  String? titleName;

  Title({
    this.id,
    this.titleName,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
    id: json["id"],
    titleName: json["title_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title_name": titleName,
  };
}

class UsualProvider {
  int? id;
  String? usualProviderName;

  UsualProvider({
    this.id,
    this.usualProviderName,
  });

  factory UsualProvider.fromJson(Map<String, dynamic> json) => UsualProvider(
    id: json["id"],
    usualProviderName: json["usual_provider_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "usual_provider_name": usualProviderName,
  };
}
