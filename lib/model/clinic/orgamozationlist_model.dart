// To parse this JSON data, do
//
//     final organizationListModle = organizationListModleFromJson(jsonString);

import 'dart:convert';

List<OrganizationListModle> organizationListModleFromJson(String str) => List<OrganizationListModle>.from(json.decode(str).map((x) => OrganizationListModle.fromJson(x)));

String organizationListModleToJson(List<OrganizationListModle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrganizationListModle {
  int? id;
  int? patientId;
  int? organizationId;
  Organization? organization;

  OrganizationListModle({
    this.id,
    this.patientId,
    this.organizationId,
    this.organization,
  });

  factory OrganizationListModle.fromJson(Map<String, dynamic> json) => OrganizationListModle(
    id: json["id"],
    patientId: json["patient_id"],
    organizationId: json["organization_id"],
    organization: json["organization"] == null ? null : Organization.fromJson(json["organization"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "organization_id": organizationId,
    "organization": organization?.toJson(),
  };
}

class Organization {
  int? id;
  String? code;
  String? name;
  String? address;
  String? mobile;
  String? email;
  String? contactPersonName;
  String? contactPersonMobile;
  String? contactPersonEmail;
  String? contactPersonDesignation;
  String? description;
  String? logo;
  String? dbName;
  dynamic metaTags;
  int? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Branch>? branch;

  Organization({
    this.id,
    this.code,
    this.name,
    this.address,
    this.mobile,
    this.email,
    this.contactPersonName,
    this.contactPersonMobile,
    this.contactPersonEmail,
    this.contactPersonDesignation,
    this.description,
    this.logo,
    this.dbName,
    this.metaTags,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.branch,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    address: json["address"],
    mobile: json["mobile"],
    email: json["email"],
    contactPersonName: json["contact_person_name"],
    contactPersonMobile: json["contact_person_mobile"],
    contactPersonEmail: json["contact_person_email"],
    contactPersonDesignation: json["contact_person_designation"],
    description: json["description"],
    logo: json["logo"],
    dbName: json["db_name"],
    metaTags: json["meta_tags"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    branch: json["branch"] == null ? [] : List<Branch>.from(json["branch"]!.map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "address": address,
    "mobile": mobile,
    "email": email,
    "contact_person_name": contactPersonName,
    "contact_person_mobile": contactPersonMobile,
    "contact_person_email": contactPersonEmail,
    "contact_person_designation": contactPersonDesignation,
    "description": description,
    "logo": logo,
    "db_name": dbName,
    "meta_tags": metaTags,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "branch": branch == null ? [] : List<dynamic>.from(branch!.map((x) => x.toJson())),
  };
}

class Branch {
  int? id;
  String? name;
  String? address;
  int? organizationId;
  String? phone;
  String? email;
  dynamic logo;
  String? status;
  String? organizationName;
  String? contactPersonName;
  dynamic division;
  dynamic district;
  dynamic area;
  DateTime? createdAt;
  DateTime? updatedAt;

  Branch({
    this.id,
    this.name,
    this.address,
    this.organizationId,
    this.phone,
    this.email,
    this.logo,
    this.status,
    this.organizationName,
    this.contactPersonName,
    this.division,
    this.district,
    this.area,
    this.createdAt,
    this.updatedAt,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    organizationId: json["organization_id"],
    phone: json["phone"],
    email: json["email"],
    logo: json["logo"],
    status: json["status"],
    organizationName: json["organization_name"],
    contactPersonName: json["contact_person_name"],
    division: json["division"],
    district: json["district"],
    area: json["area"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
    "organization_id": organizationId,
    "phone": phone,
    "email": email,
    "logo": logo,
    "status": status,
    "organization_name": organizationName,
    "contact_person_name": contactPersonName,
    "division": division,
    "district": district,
    "area": area,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
