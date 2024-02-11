// To parse this JSON data, do
//
//     final prescriptionListGreatDoc = prescriptionListGreatDocFromJson(jsonString);

import 'dart:convert';

List<PrescriptionListGreatDoc> prescriptionListGreatDocFromJson(String str) => List<PrescriptionListGreatDoc>.from(json.decode(str).map((x) => PrescriptionListGreatDoc.fromJson(x)));

String prescriptionListGreatDocToJson(List<PrescriptionListGreatDoc> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrescriptionListGreatDoc {
  int? id;
  String? patientId;
  String? prescriptionName;
  String? investigation;
  String? advice;
  String? doctorId;
  String? reasonForVisit;
  String? doctorsNote;
  String? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  Doctor? doctor;
  List<Detail>? details;
  Patient? patient;

  PrescriptionListGreatDoc({
    this.id,
    this.patientId,
    this.prescriptionName,
    this.investigation,
    this.advice,
    this.doctorId,
    this.reasonForVisit,
    this.doctorsNote,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.doctor,
    this.details,
    this.patient,
  });

  factory PrescriptionListGreatDoc.fromJson(Map<String, dynamic> json) => PrescriptionListGreatDoc(
    id: json["id"],
    patientId: json["patient_id"],
    prescriptionName: json["prescription_name"],
    investigation: json["investigation"],
    advice: json["advice"],
    doctorId: json["doctor_id"],
    reasonForVisit: json["reason_for_visit"],
    doctorsNote: json["doctors_note"],
    date: json["date"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    doctor: json["doctor"] == null ? null : Doctor.fromJson(json["doctor"]),
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
    patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "prescription_name": prescriptionName,
    "investigation": investigation,
    "advice": advice,
    "doctor_id": doctorId,
    "reason_for_visit": reasonForVisit,
    "doctors_note": doctorsNote,
    "date": date,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "doctor": doctor?.toJson(),
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
    "patient": patient?.toJson(),
  };
}

class Detail {
  int? id;
  int? prescriptionId;
  int? rxId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Rx? rx;

  Detail({
    this.id,
    this.prescriptionId,
    this.rxId,
    this.createdAt,
    this.updatedAt,
    this.rx,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    prescriptionId: json["prescription_id"],
    rxId: json["rx_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    rx: json["rx"] == null ? null : Rx.fromJson(json["rx"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prescription_id": prescriptionId,
    "rx_id": rxId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "rx": rx?.toJson(),
  };
}

class Rx {
  int? id;
  String? patientId;
  String? drugId;
  String? drugName;
  String? drugGenericName;
  String? dose;
  String? frequency;
  String? food;
  String? others;
  String? route;
  String? quantity;

  Rx({
    this.id,
    this.patientId,
    this.drugId,
    this.drugName,
    this.drugGenericName,
    this.dose,
    this.frequency,
    this.food,
    this.others,
    this.route,
    this.quantity,
  });

  factory Rx.fromJson(Map<String, dynamic> json) => Rx(
    id: json["id"],
    patientId: json["patient_id"],
    drugId: json["drug_id"],
    drugName: json["drug_name"],
    drugGenericName: json["drug_generic_name"],
    dose: json["dose"],
    frequency: json["frequency"],
    food: json["food"],
    others: json["others"],
    route: json["route"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "drug_id": drugId,
    "drug_name": drugName,
    "drug_generic_name": drugGenericName,
    "dose": dose,
    "frequency": frequency,
    "food": food,
    "others": others,
    "route": route,
    "quantity": quantity,
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
  dynamic drMiddleName;
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
  List<WorkExperience>? workExperience;
  List<Academic>? academic;
  UsualProvider? usualProvider;

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
    this.workExperience,
    this.academic,
    this.usualProvider,
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
    workExperience: json["work_experience"] == null ? [] : List<WorkExperience>.from(json["work_experience"]!.map((x) => WorkExperience.fromJson(x))),
    academic: json["academic"] == null ? [] : List<Academic>.from(json["academic"]!.map((x) => Academic.fromJson(x))),
    usualProvider: json["usual_provider"] == null ? null : UsualProvider.fromJson(json["usual_provider"]),
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
    "department": department?.toJson(),
    "specialist": specialist?.toJson(),
    "work_experience": workExperience == null ? [] : List<dynamic>.from(workExperience!.map((x) => x.toJson())),
    "academic": academic == null ? [] : List<dynamic>.from(academic!.map((x) => x.toJson())),
    "usual_provider": usualProvider?.toJson(),
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
  String? address;
  String? mobile;
  String? phone;
  String? email;

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

class WorkExperience {
  int? id;
  String? doctorsMasterId;
  String? workExperienceTitle;
  String? employmentTitle;
  String? company;
  String? location;
  String? startDate;
  String? endDate;
  String? isPresent;
  String? certificatesCopyTitle;
  String? certificatesCopy;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  WorkExperience({
    this.id,
    this.doctorsMasterId,
    this.workExperienceTitle,
    this.employmentTitle,
    this.company,
    this.location,
    this.startDate,
    this.endDate,
    this.isPresent,
    this.certificatesCopyTitle,
    this.certificatesCopy,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) => WorkExperience(
    id: json["id"],
    doctorsMasterId: json["doctors_master_id"],
    workExperienceTitle: json["work_experience_title"],
    employmentTitle: json["employment_title"],
    company: json["company"],
    location: json["location"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    isPresent: json["is_present"],
    certificatesCopyTitle: json["certificates_copy_title"],
    certificatesCopy: json["certificates_copy"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "doctors_master_id": doctorsMasterId,
    "work_experience_title": workExperienceTitle,
    "employment_title": employmentTitle,
    "company": company,
    "location": location,
    "start_date": startDate,
    "end_date": endDate,
    "is_present": isPresent,
    "certificates_copy_title": certificatesCopyTitle,
    "certificates_copy": certificatesCopy,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Patient {
  int? id;
  String? patientLastName;
  String? patientFirstName;
  dynamic patientMiddleName;
  DateTime? patientDob;
  String? patientBirthSexId;
  String? fullName;
  PatientBirthSex? patientBirthSex;

  Patient({
    this.id,
    this.patientLastName,
    this.patientFirstName,
    this.patientMiddleName,
    this.patientDob,
    this.patientBirthSexId,
    this.fullName,
    this.patientBirthSex,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["id"],
    patientLastName: json["patient_last_name"],
    patientFirstName: json["patient_first_name"],
    patientMiddleName: json["patient_middle_name"],
    patientDob: json["patient_dob"] == null ? null : DateTime.parse(json["patient_dob"]),
    patientBirthSexId: json["patient_birth_sex_id"],
    fullName: json["fullName"],
    patientBirthSex: json["patient_birth_sex"] == null ? null : PatientBirthSex.fromJson(json["patient_birth_sex"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_last_name": patientLastName,
    "patient_first_name": patientFirstName,
    "patient_middle_name": patientMiddleName,
    "patient_dob": "${patientDob!.year.toString().padLeft(4, '0')}-${patientDob!.month.toString().padLeft(2, '0')}-${patientDob!.day.toString().padLeft(2, '0')}",
    "patient_birth_sex_id": patientBirthSexId,
    "fullName": fullName,
    "patient_birth_sex": patientBirthSex?.toJson(),
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
