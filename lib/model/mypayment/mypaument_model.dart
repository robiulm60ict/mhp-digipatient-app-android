// To parse this JSON data, do
//
//     final myPaymentModel = myPaymentModelFromJson(jsonString);

import 'dart:convert';

List<MyPaymentModel> myPaymentModelFromJson(String str) => List<MyPaymentModel>.from(json.decode(str).map((x) => MyPaymentModel.fromJson(x)));

String myPaymentModelToJson(List<MyPaymentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyPaymentModel {
  int? id;
  int? saasBranchId;
  String? saasBranchName;
  String? patientHnNumber;
  int? doctorId;
  String? inoviceNumber;
  DateTime? date;
  dynamic time;
  String? appointmentType;
  dynamic callingType;
  dynamic chamberId;
  String? disease;
  String? paymentType;
  String? amount;
  String? transactionNo;
  String? transactionPhoneNumber;
  String? shift;
  String? referredName;
  int? paymentConfirmation;
  int? isConfirmed;
  int? rescheduleId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctors? doctors;

  MyPaymentModel({
    this.id,
    this.saasBranchId,
    this.saasBranchName,
    this.patientHnNumber,
    this.doctorId,
    this.inoviceNumber,
    this.date,
    this.time,
    this.appointmentType,
    this.callingType,
    this.chamberId,
    this.disease,
    this.paymentType,
    this.amount,
    this.transactionNo,
    this.transactionPhoneNumber,
    this.shift,
    this.referredName,
    this.paymentConfirmation,
    this.isConfirmed,
    this.rescheduleId,
    this.createdAt,
    this.updatedAt,
    this.doctors,
  });

  factory MyPaymentModel.fromJson(Map<String, dynamic> json) => MyPaymentModel(
    id: json["id"],
    saasBranchId: json["saas_branch_id"],
    saasBranchName: json["saas_branch_name"],
    patientHnNumber: json["patient_hn_number"],
    doctorId: json["doctor_id"],
    inoviceNumber: json["inovice_number"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    appointmentType: json["appointment_type"],
    callingType: json["calling_type"],
    chamberId: json["chamber_id"],
    disease: json["disease"],
    paymentType: json["payment_type"],
    amount: json["amount"],
    transactionNo: json["transaction_no"],
    transactionPhoneNumber: json["transaction_phone_number"],
    shift: json["shift"],
    referredName: json["referred_name"],
    paymentConfirmation: json["payment_confirmation"],
    isConfirmed: json["is_confirmed"],
    rescheduleId: json["reschedule_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctors: json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "saas_branch_id": saasBranchId,
    "saas_branch_name": saasBranchName,
    "patient_hn_number": patientHnNumber,
    "doctor_id": doctorId,
    "inovice_number": inoviceNumber,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "appointment_type": appointmentType,
    "calling_type": callingType,
    "chamber_id": chamberId,
    "disease": disease,
    "payment_type": paymentType,
    "amount": amount,
    "transaction_no": transactionNo,
    "transaction_phone_number": transactionPhoneNumber,
    "shift": shift,
    "referred_name": referredName,
    "payment_confirmation": paymentConfirmation,
    "is_confirmed": isConfirmed,
    "reschedule_id": rescheduleId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctors": doctors?.toJson(),
  };
}

class Doctors {
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

  Doctors({
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
  });

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
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
