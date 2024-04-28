// To parse this JSON data, do
//
//     final myDoctorBrance = myDoctorBranceFromJson(jsonString);

import 'dart:convert';

MyDoctorBrance myDoctorBranceFromJson(String str) => MyDoctorBrance.fromJson(json.decode(str));

String myDoctorBranceToJson(MyDoctorBrance data) => json.encode(data.toJson());

class MyDoctorBrance {
  String? success;
  List<Datum>? data;

  MyDoctorBrance({
    this.success,
    this.data,
  });

  factory MyDoctorBrance.fromJson(Map<String, dynamic> json) => MyDoctorBrance(
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
  int? saasBranchId;
  String? saasBranchName;
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
  Department? department;
  Specialist? specialist;
  ContactVia? contactVia;
  List<dynamic>? workExperience;
  List<dynamic>? academic;
  UsualProvider? usualProvider;
  Token? token;

  Datum({
    this.id,
    this.saasBranchId,
    this.saasBranchName,
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
    this.department,
    this.specialist,
    this.contactVia,
    this.workExperience,
    this.academic,
    this.usualProvider,
    this.token,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    saasBranchId: json["saas_branch_id"],
    saasBranchName: json["saas_branch_name"],
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
    department: json["department"] == null ? null : Department.fromJson(json["department"]),
    specialist: json["specialist"] == null ? null : Specialist.fromJson(json["specialist"]),
    contactVia: json["contact_via"] == null ? null : ContactVia.fromJson(json["contact_via"]),
    workExperience: json["work_experience"] == null ? [] : List<dynamic>.from(json["work_experience"]!.map((x) => x)),
    academic: json["academic"] == null ? [] : List<dynamic>.from(json["academic"]!.map((x) => x)),
    usualProvider: json["usual_provider"] == null ? null : UsualProvider.fromJson(json["usual_provider"]),
    token: json["token"] == null ? null : Token.fromJson(json["token"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "saas_branch_id": saasBranchId,
    "saas_branch_name": saasBranchName,
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
    "department": department?.toJson(),
    "specialist": specialist?.toJson(),
    "contact_via": contactVia?.toJson(),
    "work_experience": workExperience == null ? [] : List<dynamic>.from(workExperience!.map((x) => x)),
    "academic": academic == null ? [] : List<dynamic>.from(academic!.map((x) => x)),
    "usual_provider": usualProvider?.toJson(),
    "token": token?.toJson(),
  };
}

class ContactVia {
  int? id;
  String? contactViaName;

  ContactVia({
    this.id,
    this.contactViaName,
  });

  factory ContactVia.fromJson(Map<String, dynamic> json) => ContactVia(
    id: json["id"],
    contactViaName: json["contact_via_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "contact_via_name": contactViaName,
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

class Token {
  String? userType;
  String? userId;
  dynamic deviceToke;
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

class UsualProvider {
  int? id;
  String? usualProviderName;
  dynamic address;
  dynamic mobile;
  dynamic phone;
  dynamic email;

  UsualProvider({
    this.id,
    this.usualProviderName,
    this.address,
    this.mobile,
    this.phone,
    this.email,
  });

  factory UsualProvider.fromJson(Map<String, dynamic> json) => UsualProvider(
    id: json["id"],
    usualProviderName: json["usual_provider_name"],
    address: json["address"],
    mobile: json["mobile"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "usual_provider_name": usualProviderName,
    "address": address,
    "mobile": mobile,
    "phone": phone,
    "email": email,
  };
}
