// To parse this JSON data, do
//
//     final departmentsListModel = departmentsListModelFromJson(jsonString);

import 'dart:convert';

DepartmentsListModel departmentsListModelFromJson(String str) => DepartmentsListModel.fromJson(json.decode(str));

String departmentsListModelToJson(DepartmentsListModel data) => json.encode(data.toJson());

class DepartmentsListModel {
  int? status;
  List<Department>? department;

  DepartmentsListModel({
    this.status,
    this.department,
  });

  factory DepartmentsListModel.fromJson(Map<String, dynamic> json) => DepartmentsListModel(
    status: json["status"],
    department: json["department"] == null ? [] : List<Department>.from(json["department"]!.map((x) => Department.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "department": department == null ? [] : List<dynamic>.from(department!.map((x) => x.toJson())),
  };
}

class Department {
  int? id;
  dynamic saasBranchId;
  dynamic saasBranchName;
  String? departmentsName;
  String? departmentImage;
  int? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  Department({
    this.id,
    this.saasBranchId,
    this.saasBranchName,
    this.departmentsName,
    this.departmentImage,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
    id: json["id"],
    saasBranchId: json["saas_branch_id"],
    saasBranchName: json["saas_branch_name"],
    departmentsName: json["departments_name"],
    departmentImage: json["department_image"],
    deleteStatus: json["delete_status"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "saas_branch_id": saasBranchId,
    "saas_branch_name": saasBranchName,
    "departments_name": departmentsName,
    "department_image": departmentImage,
    "delete_status": deleteStatus,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
