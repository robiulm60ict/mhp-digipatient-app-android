// To parse this JSON data, do
//
//     final upcommingAppointmentsModel = upcommingAppointmentsModelFromJson(jsonString);

import 'dart:convert';

UpcommingAppointmentsModel upcommingAppointmentsModelFromJson(String str) => UpcommingAppointmentsModel.fromJson(json.decode(str));

String upcommingAppointmentsModelToJson(UpcommingAppointmentsModel data) => json.encode(data.toJson());

class UpcommingAppointmentsModel {
  int? status;
  String? message;
  List<UpcomingAppointment>? upcomingAppointments;

  UpcommingAppointmentsModel({
    this.status,
    this.message,
    this.upcomingAppointments,
  });

  factory UpcommingAppointmentsModel.fromJson(Map<String, dynamic> json) => UpcommingAppointmentsModel(
    status: json["status"],
    message: json["message"],
    upcomingAppointments: json["upcomingAppointments"] == null ? [] : List<UpcomingAppointment>.from(json["upcomingAppointments"]!.map((x) => UpcomingAppointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "upcomingAppointments": upcomingAppointments == null ? [] : List<dynamic>.from(upcomingAppointments!.map((x) => x.toJson())),
  };
}

class UpcomingAppointment {
  int? id;
  int? saasBranchId;
  String? saasBranchName;
  String? doctorsId;
  String? patientId;
  String? patientName;
  String? patientMobile;
  dynamic notes;
  String? statusColor;
  String? statusName;
  DateTime? startTime;
  DateTime? endTime;
  dynamic subject;
  String? appType;
  dynamic mediaTypeOnline;
  dynamic media;
  int? appointmentCompleted;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  PatientAppionment? patientAppionment;
  Doctors? doctors;

  UpcomingAppointment({
    this.id,
    this.saasBranchId,
    this.saasBranchName,
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
    this.appointmentCompleted,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.patientAppionment,
    this.doctors,
  });

  factory UpcomingAppointment.fromJson(Map<String, dynamic> json) => UpcomingAppointment(
    id: json["id"],
    saasBranchId: json["saas_branch_id"],
    saasBranchName: json["saas_branch_name"],
    doctorsId: json["doctors_id"],
    patientId: json["patient_id"],
    patientName: json["patient_name"],
    patientMobile: json["patient_mobile"],
    notes: json["notes"],
    statusColor: json["status_color"],
    statusName: json["status_name"],
    startTime: json["StartTime"] == null ? null : DateTime.parse(json["StartTime"]),
    endTime: json["EndTime"] == null ? null : DateTime.parse(json["EndTime"]),
    subject: json["Subject"],
    appType: json["app_type"],
    mediaTypeOnline: json["mediaType_online"],
    media: json["media"],
    appointmentCompleted: json["appointment_completed"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    patientAppionment: json["patient_appionment"] == null ? null : PatientAppionment.fromJson(json["patient_appionment"]),
    doctors: json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "saas_branch_id": saasBranchId,
    "saas_branch_name": saasBranchName,
    "doctors_id": doctorsId,
    "patient_id": patientId,
    "patient_name": patientName,
    "patient_mobile": patientMobile,
    "notes": notes,
    "status_color": statusColor,
    "status_name": statusName,
    "StartTime": startTime?.toIso8601String(),
    "EndTime": endTime?.toIso8601String(),
    "Subject": subject,
    "app_type": appType,
    "mediaType_online": mediaTypeOnline,
    "media": media,
    "appointment_completed": appointmentCompleted,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "patient_appionment": patientAppionment?.toJson(),
    "doctors": doctors?.toJson(),
  };
}

class Doctors {
  int? id;
  String? drFamilyName;
  String? drGivenName;
  String? drMiddleName;
  String? drPreferredName;
  String? drLastName;
  String? drImages;
  Title? title;
  String? fullName;

  Doctors({
    this.id,
    this.drFamilyName,
    this.drGivenName,
    this.drMiddleName,
    this.drPreferredName,
    this.drLastName,
    this.drImages,
    this.title,
    this.fullName,
  });

  factory Doctors.fromJson(Map<String, dynamic> json) => Doctors(
    id: json["id"],
    drFamilyName: json["dr_family_name"],
    drGivenName: json["dr_given_name"],
    drMiddleName: json["dr_middle_name"],
    drPreferredName: json["dr_preferred_name"],
    drLastName: json["dr_last_name"],
    drImages: json["dr_images"],
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dr_family_name": drFamilyName,
    "dr_given_name": drGivenName,
    "dr_middle_name": drMiddleName,
    "dr_preferred_name": drPreferredName,
    "dr_last_name": drLastName,
    "dr_images": drImages,
    "title": title?.toJson(),
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

class PatientAppionment {
  int? id;
  String? patientFirstName;
  dynamic patientMiddleName;
  String? patientLastName;
  String? patientPreferredName;
  String? patientImages;
  dynamic patientCityId;
  dynamic patientAddress2;
  String? patientAddress1;
  dynamic patientBcid;
  String? ptnBloodGroupId;
  dynamic patientContactVia;
  String? patientHnNumber;
  DateTime? patientDob;
  String? patientBirthSexId;
  String? patientEmail;
  String? patientMobilePhone;
  String? fullName;
  PatientBirthSex? patientBirthSex;
  dynamic contactVia;
  dynamic city;
  BloodGroup? bloodGroup;

  PatientAppionment({
    this.id,
    this.patientFirstName,
    this.patientMiddleName,
    this.patientLastName,
    this.patientPreferredName,
    this.patientImages,
    this.patientCityId,
    this.patientAddress2,
    this.patientAddress1,
    this.patientBcid,
    this.ptnBloodGroupId,
    this.patientContactVia,
    this.patientHnNumber,
    this.patientDob,
    this.patientBirthSexId,
    this.patientEmail,
    this.patientMobilePhone,
    this.fullName,
    this.patientBirthSex,
    this.contactVia,
    this.city,
    this.bloodGroup,
  });

  factory PatientAppionment.fromJson(Map<String, dynamic> json) => PatientAppionment(
    id: json["id"],
    patientFirstName: json["patient_first_name"],
    patientMiddleName: json["patient_middle_name"],
    patientLastName: json["patient_last_name"],
    patientPreferredName: json["patient_preferred_name"],
    patientImages: json["patient_images"],
    patientCityId: json["patient_city_id"],
    patientAddress2: json["patient_address2"],
    patientAddress1: json["patient_address1"],
    patientBcid: json["patient_bcid"],
    ptnBloodGroupId: json["ptn_blood_group_id"],
    patientContactVia: json["patient_contact_via"],
    patientHnNumber: json["patient_hn_number"],
    patientDob: json["patient_dob"] == null ? null : DateTime.parse(json["patient_dob"]),
    patientBirthSexId: json["patient_birth_sex_id"],
    patientEmail: json["patient_email"],
    patientMobilePhone: json["patient_mobile_phone"],
    fullName: json["fullName"],
    patientBirthSex: json["patient_birth_sex"] == null ? null : PatientBirthSex.fromJson(json["patient_birth_sex"]),
    contactVia: json["contact_via"],
    city: json["city"],
    bloodGroup: json["blood_group"] == null ? null : BloodGroup.fromJson(json["blood_group"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_first_name": patientFirstName,
    "patient_middle_name": patientMiddleName,
    "patient_last_name": patientLastName,
    "patient_preferred_name": patientPreferredName,
    "patient_images": patientImages,
    "patient_city_id": patientCityId,
    "patient_address2": patientAddress2,
    "patient_address1": patientAddress1,
    "patient_bcid": patientBcid,
    "ptn_blood_group_id": ptnBloodGroupId,
    "patient_contact_via": patientContactVia,
    "patient_hn_number": patientHnNumber,
    "patient_dob": "${patientDob!.year.toString().padLeft(4, '0')}-${patientDob!.month.toString().padLeft(2, '0')}-${patientDob!.day.toString().padLeft(2, '0')}",
    "patient_birth_sex_id": patientBirthSexId,
    "patient_email": patientEmail,
    "patient_mobile_phone": patientMobilePhone,
    "fullName": fullName,
    "patient_birth_sex": patientBirthSex?.toJson(),
    "contact_via": contactVia,
    "city": city,
    "blood_group": bloodGroup?.toJson(),
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
