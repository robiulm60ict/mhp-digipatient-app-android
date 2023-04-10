//
// class DepartmentModel {
//   DepartmentModel({
//       this.status,
//       this.department,});
//
//   DepartmentModel.fromJson(dynamic json) {
//     status = json['status'];
//     if (json['department'] != null) {
//       department = [];
//       json['department'].forEach((v) {
//         department?.add(AllDepartment.fromJson(v));
//       });
//     }
//   }
//   int? status;
//   List<AllDepartment>? department;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (department != null) {
//       map['department'] = department?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// class AllDepartment {
//   AllDepartment({
//     this.id,
//     this.departmentsName,
//     this.deleteStatus,
//     this.createdBy,
//     this.updatedBy,
//     this.createdAt,
//     this.updatedAt,});
//
//   AllDepartment.fromJson(dynamic json) {
//     id = json['id'];
//     departmentsName = json['departments_name'];
//     deleteStatus = json['delete_status'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//   int? id;
//   String? departmentsName;
//   String? deleteStatus;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['departments_name'] = departmentsName;
//     map['delete_status'] = deleteStatus;
//     map['created_by'] = createdBy;
//     map['updated_by'] = updatedBy;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     return map;
//   }
//
// }

import 'dart:convert';

DepartmentModel departmentModelsFromJson(String str) => DepartmentModel.fromJson(json.decode(str));
String departmentModelsToJson(DepartmentModel data) => json.encode(data.toJson());
class DepartmentModel {
  DepartmentModel({
    this.status,
    this.department,});

  DepartmentModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['department'] != null) {
      department = [];
      json['department'].forEach((v) {
        department?.add(AllDepartment.fromJson(v));
      });
    }
  }
  num? status;
  List<AllDepartment>? department;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (department != null) {
      map['department'] = department?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

AllDepartment departmentFromJson(String str) => AllDepartment.fromJson(json.decode(str));
String departmentToJson(AllDepartment data) => json.encode(data.toJson());
class AllDepartment {
  AllDepartment({
    this.id,
    this.departmentsName,
    this.departmentImage,
    this.deleteStatus,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,});

  AllDepartment.fromJson(dynamic json) {
    id = json['id'];
    departmentsName = json['departments_name'];
    departmentImage = json['department_image'];
    deleteStatus = json['delete_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? departmentsName;
  String? departmentImage;
  String? deleteStatus;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['departments_name'] = departmentsName;
    map['department_image'] = departmentImage;
    map['delete_status'] = deleteStatus;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}