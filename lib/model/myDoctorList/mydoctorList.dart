// To parse this JSON data, do
//
//     final myDoctorList = myDoctorListFromJson(jsonString);

import 'dart:convert';

MyDoctorList myDoctorListFromJson(String str) => MyDoctorList.fromJson(json.decode(str));

String myDoctorListToJson(MyDoctorList data) => json.encode(data.toJson());

class MyDoctorList {
  String? success;
  List<Datum>? data;

  MyDoctorList({
    this.success,
    this.data,
  });

  factory MyDoctorList.fromJson(Map<String, dynamic> json) => MyDoctorList(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  int? patientId;
  int? doctorsMasterId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctors? doctors;
  Token? token;

  Datum({
    this.id,
    this.patientId,
    this.doctorsMasterId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.doctors,
    this.token,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    patientId: json["patient_id"],
    doctorsMasterId: json["doctors_master_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctors: json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]),
    token: json["token"] == null ? null : Token.fromJson(json["token"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "doctors_master_id": doctorsMasterId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctors": doctors?.toJson(),
    "token": token?.toJson(),
  };
}

class Doctors {
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
  String? doctorFee;
  dynamic appToken;
  String? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullName;
  Specialist? specialist;
  Department? department;
  UsualProvider? usualProvider;
  List<Academic>? academic;

  Doctors({
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
    this.fullName,
    this.specialist,
    this.department,
    this.usualProvider,
    this.academic,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
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
    doctorFee: json["doctor_fee"],
    appToken: json["app_token"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    fullName: json["fullName"],
    specialist: json["specialist"] == null ? null : Specialist.fromJson(json["specialist"]),
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    usualProvider: json["usual_provider"] == null ? null : UsualProvider.fromJson(json["usual_provider"]),
    academic: json["academic"] == null ? [] : List<Academic>.from(json["academic"]!.map((x) => Academic.fromJson(x))),
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
    "doctor_fee": doctorFee,
    "app_token": appToken,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "fullName": fullName,
    "specialist": specialist?.toJson(),
    "department": department?.toJson(),
    "usual_provider": usualProvider?.toJson(),
    "academic": academic == null ? [] : List<dynamic>.from(academic!.map((x) => x.toJson())),
  };
}

class Academic {
  int? id;
  String? doctorsMasterId;
  String? degreeId;
  String? passingYear;
  String? result;
  String? institutionId;
  String? countryId;
  String? cityId;
  String? scanCopy;
  String? scanCopyTitle;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Inistitution>? inistitution;
  List<Country>? country;

  Academic({
    this.id,
    this.doctorsMasterId,
    this.degreeId,
    this.passingYear,
    this.result,
    this.institutionId,
    this.countryId,
    this.cityId,
    this.scanCopy,
    this.scanCopyTitle,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.inistitution,
    this.country,
  });

  factory Academic.fromJson(Map<String, dynamic> json) => Academic(
    id: json["id"],
    doctorsMasterId: json["doctors_master_id"],
    degreeId: json["degree_id"],
    passingYear: json["passing_year"],
    result: json["result"],
    institutionId: json["institution_id"],
    countryId: json["country_id"],
    cityId: json["city_id"],
    scanCopy: json["scan_copy"],
    scanCopyTitle: json["scan_copy_title"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    inistitution: json["inistitution"] == null ? [] : List<Inistitution>.from(json["inistitution"]!.map((x) => Inistitution.fromJson(x))),
    country: json["country"] == null ? [] : List<Country>.from(json["country"]!.map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctors_master_id": doctorsMasterId,
    "degree_id": degreeId,
    "passing_year": passingYear,
    "result": result,
    "institution_id": institutionId,
    "country_id": countryId,
    "city_id": cityId,
    "scan_copy": scanCopy,
    "scan_copy_title": scanCopyTitle,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "inistitution": inistitution == null ? [] : List<dynamic>.from(inistitution!.map((x) => x.toJson())),
    "country": country == null ? [] : List<dynamic>.from(country!.map((x) => x.toJson())),
  };
}

class Country {
  int? id;
  String? countryName;

  Country({
    this.id,
    this.countryName,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    countryName: json["country_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "country_name": countryName,
  };
}

class Inistitution {
  int? id;
  String? name;

  Inistitution({
    this.id,
    this.name,
  });

  factory Inistitution.fromJson(Map<String, dynamic> json) => Inistitution(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
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

class Token {
  String? userType;
  String? userId;
  String? deviceToke;
  String? profilePhotoUrl;

  Token({
    this.userType,
    this.userId,
    this.deviceToke,
    this.profilePhotoUrl,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    userType: json["user_type"],
    userId: json["user_id"],
    deviceToke: json["deviceToke"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "user_type": userType,
    "user_id": userId,
    "deviceToke": deviceToke,
    "profile_photo_url": profilePhotoUrl,
  };
}
