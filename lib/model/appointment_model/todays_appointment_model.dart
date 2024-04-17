// To parse this JSON data, do
//
//     final todaysAppointmentModel = todaysAppointmentModelFromJson(jsonString);

import 'dart:convert';

TodaysAppointmentModel todaysAppointmentModelFromJson(String str) => TodaysAppointmentModel.fromJson(json.decode(str));

String todaysAppointmentModelToJson(TodaysAppointmentModel data) => json.encode(data.toJson());

class TodaysAppointmentModel {
  int? status;
  String? message;
  List<TodaysPatientAppointment>? todaysPatientAppointments;

  TodaysAppointmentModel({
    this.status,
    this.message,
    this.todaysPatientAppointments,
  });

  factory TodaysAppointmentModel.fromJson(Map<String, dynamic> json) => TodaysAppointmentModel(
    status: json["status"],
    message: json["message"],
    todaysPatientAppointments: json["todaysPatientAppointments"] == null ? [] : List<TodaysPatientAppointment>.from(json["todaysPatientAppointments"]!.map((x) => TodaysPatientAppointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "todaysPatientAppointments": todaysPatientAppointments == null ? [] : List<dynamic>.from(todaysPatientAppointments!.map((x) => x.toJson())),
  };
}

class TodaysPatientAppointment {
  int? id;
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
  String? appointmentCompleted;
  String? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  Patient? patientAppionment;
  Patient? patients;
  OnlineApp? onlineApp;
  Doctors? doctors;

  TodaysPatientAppointment({
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
    this.appointmentCompleted,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.patientAppionment,
    this.patients,
    this.onlineApp,
    this.doctors,
  });

  factory TodaysPatientAppointment.fromJson(Map<String, dynamic> json) => TodaysPatientAppointment(
    id: json["id"],
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
    patientAppionment: json["patient_appionment"] == null ? null : Patient.fromJson(json["patient_appionment"]),
    patients: json["patients"] == null ? null : Patient.fromJson(json["patients"]),
    onlineApp: json["online_app"] == null ? null : OnlineApp.fromJson(json["online_app"]),
    doctors: json["doctors"] == null ? null : Doctors.fromJson(json["doctors"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "patients": patients?.toJson(),
    "online_app": onlineApp?.toJson(),
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

class OnlineApp {
  int? id;
  String? patientId;
  String? doctorId;
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
  String? paymentConfirmation;
  String? isConfirmed;
  String? rescheduleId;
  DateTime? createdAt;
  DateTime? updatedAt;

  OnlineApp({
    this.id,
    this.patientId,
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
  });

  factory OnlineApp.fromJson(Map<String, dynamic> json) => OnlineApp(
    id: json["id"],
    patientId: json["patient_id"],
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
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
  };
}

class Patient {
  int? id;
  String? patientFirstName;
  String? patientMiddleName;
  String? patientLastName;
  dynamic patientPreferredName;
  String? patientImages;
  dynamic patientCityId;
  dynamic patientAddress2;
  String? patientAddress1;
  dynamic patientBcid;
  String? ptnBloodGroupId;
  dynamic patientContactVia;
  DateTime? patientDob;
  String? patientBirthSexId;
  String? fullName;
  PatientBirthSex? patientBirthSex;
  dynamic contactVia;
  dynamic city;
  BloodGroup? bloodGroup;
  String? patientHnNumber;
  List<OnlineApp>? mhpPatientAppointment;
  Token? token;

  Patient({
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
    this.patientDob,
    this.patientBirthSexId,
    this.fullName,
    this.patientBirthSex,
    this.contactVia,
    this.city,
    this.bloodGroup,
    this.patientHnNumber,
    this.mhpPatientAppointment,
    this.token,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
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
    patientDob: json["patient_dob"] == null ? null : DateTime.parse(json["patient_dob"]),
    patientBirthSexId: json["patient_birth_sex_id"],
    fullName: json["fullName"],
    patientBirthSex: json["patient_birth_sex"] == null ? null : PatientBirthSex.fromJson(json["patient_birth_sex"]),
    contactVia: json["contact_via"],
    city: json["city"],
    bloodGroup: json["blood_group"] == null ? null : BloodGroup.fromJson(json["blood_group"]),
    patientHnNumber: json["patient_hn_number"],
    mhpPatientAppointment: json["mhp_patient_appointment"] == null ? [] : List<OnlineApp>.from(json["mhp_patient_appointment"]!.map((x) => OnlineApp.fromJson(x))),
    token: json["token"] == null ? null : Token.fromJson(json["token"]),
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
    "patient_dob": "${patientDob!.year.toString().padLeft(4, '0')}-${patientDob!.month.toString().padLeft(2, '0')}-${patientDob!.day.toString().padLeft(2, '0')}",
    "patient_birth_sex_id": patientBirthSexId,
    "fullName": fullName,
    "patient_birth_sex": patientBirthSex?.toJson(),
    "contact_via": contactVia,
    "city": city,
    "blood_group": bloodGroup?.toJson(),
    "patient_hn_number": patientHnNumber,
    "mhp_patient_appointment": mhpPatientAppointment == null ? [] : List<dynamic>.from(mhpPatientAppointment!.map((x) => x.toJson())),
    "token": token?.toJson(),
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

class Token {
  String? userType;
  String? userId;
  dynamic deviceToke;
  String? loginStatus;
  DateTime? lastLoginLogoutTime;
  String? profilePhotoUrl;

  Token({
    this.userType,
    this.userId,
    this.deviceToke,
    this.loginStatus,
    this.lastLoginLogoutTime,
    this.profilePhotoUrl,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    userType: json["user_type"],
    userId: json["user_id"],
    deviceToke: json["deviceToke"],
    loginStatus: json["login_status"],
    lastLoginLogoutTime: json["last_login_logout_time"] == null ? null : DateTime.parse(json["last_login_logout_time"]),
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "user_type": userType,
    "user_id": userId,
    "deviceToke": deviceToke,
    "login_status": loginStatus,
    "last_login_logout_time": lastLoginLogoutTime?.toIso8601String(),
    "profile_photo_url": profilePhotoUrl,
  };
}
