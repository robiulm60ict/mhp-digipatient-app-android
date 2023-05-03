//
// import 'dart:convert';
// VitalsModel vitalsModelFromJson(String str) => VitalsModel.fromJson(json.decode(str));
// String vitalsModelToJson(VitalsModel data) => json.encode(data.toJson());
// class VitalsModel {
//   VitalsModel({
//     this.status,
//     this.vsArray,
//     this.bpArray,});
//
//   VitalsModel.fromJson(dynamic json) {
//     status = json['status'];
//     if (json['vsArray'] != null) {
//       vsArray = [];
//       json['vsArray'].forEach((v) {
//         vsArray?.add(VsArray.fromJson(v));
//       });
//     }
//     if (json['bpArray'] != null) {
//       bpArray = [];
//       json['bpArray'].forEach((v) {
//         bpArray?.add(BpArray.fromJson(v));
//       });
//     }
//   }
//   num? status;
//   List<VsArray>? vsArray;
//   List<BpArray>? bpArray;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (vsArray != null) {
//       map['vsArray'] = vsArray?.map((v) => v.toJson()).toList();
//     }
//     if (bpArray != null) {
//       map['bpArray'] = bpArray?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// BpArray bpArrayFromJson(String str) => BpArray.fromJson(json.decode(str));
// String bpArrayToJson(BpArray data) => json.encode(data.toJson());
// class BpArray {
//   BpArray({
//     this.name,
//     this.systolic,
//     this.diastolic,
//     this.icon,});
//
//   BpArray.fromJson(dynamic json) {
//     name = json['name'];
//     systolic = json['systolic'];
//     diastolic = json['diastolic'];
//     icon = json['icon'];
//   }
//   String? name;
//   num? systolic;
//   num? diastolic;
//   String? icon;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = name;
//     map['systolic'] = systolic;
//     map['diastolic'] = diastolic;
//     map['icon'] = icon;
//     return map;
//   }
//
// }
//
// VsArray vsArrayFromJson(String str) => VsArray.fromJson(json.decode(str));
// String vsArrayToJson(VsArray data) => json.encode(data.toJson());
// class VsArray {
//   VsArray({
//     this.patientsVs,});
//
//   VsArray.fromJson(dynamic json) {
//     if (json['patientsVs'] != null) {
//       patientsVs = [];
//       json['patientsVs'].forEach((v) {
//         patientsVs?.add(PatientsVs.fromJson(v));
//       });
//     }
//   }
//   List<PatientsVs>? patientsVs;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (patientsVs != null) {
//       map['patientsVs'] = patientsVs?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// PatientsVs patientsVsFromJson(String str) => PatientsVs.fromJson(json.decode(str));
// String patientsVsToJson(PatientsVs data) => json.encode(data.toJson());
// class PatientsVs {
//   PatientsVs({
//     this.id,
//     this.patientId,
//     this.name,
//     this.value,
//     this.desc,
//     this.icon,
//     this.color,
//     this.lastCheckUpDate,
//     this.unitsId,
//     this.statusId,
//     this.refRangeValue,
//     this.nurseId,
//     this.remarks,
//     this.createdAt,
//     this.updatedAt,});
//
//   PatientsVs.fromJson(dynamic json) {
//     id = json['id'];
//     patientId = json['patient_id'];
//     name = json['name'];
//     value = json['value'];
//     desc = json['desc'];
//     icon = json['icon'];
//     color = json['color'];
//     lastCheckUpDate = json['last_check_up_date'];
//     unitsId = json['units_id'];
//     statusId = json['status_id'];
//     refRangeValue = json['ref_range_value'];
//     nurseId = json['nurse_id'];
//     remarks = json['remarks'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//   num? id;
//   String? patientId;
//   String? name;
//   String? value;
//   String? desc;
//   String? icon;
//   String? color;
//   String? lastCheckUpDate;
//   String? unitsId;
//   String? statusId;
//   dynamic refRangeValue;
//   dynamic nurseId;
//   dynamic remarks;
//   String? createdAt;
//   String? updatedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['patient_id'] = patientId;
//     map['name'] = name;
//     map['value'] = value;
//     map['desc'] = desc;
//     map['icon'] = icon;
//     map['color'] = color;
//     map['last_check_up_date'] = lastCheckUpDate;
//     map['units_id'] = unitsId;
//     map['status_id'] = statusId;
//     map['ref_range_value'] = refRangeValue;
//     map['nurse_id'] = nurseId;
//     map['remarks'] = remarks;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     return map;
//   }
//
// }

import 'dart:convert';
VitalsModel vitalsModelFromJson(String str) => VitalsModel.fromJson(json.decode(str));
String vitalsModelToJson(VitalsModel data) => json.encode(data.toJson());
class VitalsModel {
  VitalsModel({
    this.status,
    this.vsArray,
    this.bpArray,});

  VitalsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['vsArray'] != null) {
      vsArray = [];
      json['vsArray'].forEach((v) {
        vsArray?.add(VsArray.fromJson(v));
      });
    }
    if (json['bpArray'] != null) {
      bpArray = [];
      json['bpArray'].forEach((v) {
        bpArray?.add(BpArray.fromJson(v));
      });
    }
  }
  num? status;
  List<VsArray>? vsArray;
  List<BpArray>? bpArray;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (vsArray != null) {
      map['vsArray'] = vsArray?.map((v) => v.toJson()).toList();
    }
    if (bpArray != null) {
      map['bpArray'] = bpArray?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

BpArray bpArrayFromJson(String str) => BpArray.fromJson(json.decode(str));
String bpArrayToJson(BpArray data) => json.encode(data.toJson());
class BpArray {
  BpArray({
    this.name,
    this.systolic,
    this.diastolic,
    this.icon,
    this.createdAt,});

  BpArray.fromJson(dynamic json) {
    name = json['name'];
    systolic = json['systolic'];
    diastolic = json['diastolic'];
    icon = json['icon'];
    createdAt = json['created_at'];
  }
  String? name;
  num? systolic;
  num? diastolic;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['systolic'] = systolic;
    map['diastolic'] = diastolic;
    map['icon'] = icon;
    map['created_at'] = createdAt;
    return map;
  }

}

VsArray vsArrayFromJson(String str) => VsArray.fromJson(json.decode(str));
String vsArrayToJson(VsArray data) => json.encode(data.toJson());
class VsArray {
  VsArray({
    this.patientsVs,});

  VsArray.fromJson(dynamic json) {
    if (json['patientsVs'] != null) {
      patientsVs = [];
      json['patientsVs'].forEach((v) {
        patientsVs?.add(PatientsVs.fromJson(v));
      });
    }
  }
  List<PatientsVs>? patientsVs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (patientsVs != null) {
      map['patientsVs'] = patientsVs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

PatientsVs patientsVsFromJson(String str) => PatientsVs.fromJson(json.decode(str));
String patientsVsToJson(PatientsVs data) => json.encode(data.toJson());
class PatientsVs {
  PatientsVs({
    this.id,
    this.patientId,
    this.name,
    this.value,
    this.desc,
    this.icon,
    this.color,
    this.lastCheckUpDate,
    this.unitsId,
    this.statusId,
    this.refRangeValue,
    this.nurseId,
    this.remarks,
    this.createdAt,
    this.updatedAt,});

  PatientsVs.fromJson(dynamic json) {
    id = json['id'];
    patientId = json['patient_id'];
    name = json['name'];
    value = json['value'];
    desc = json['desc'];
    icon = json['icon'];
    color = json['color'];
    lastCheckUpDate = json['last_check_up_date'];
    unitsId = json['units_id'];
    statusId = json['status_id'];
    refRangeValue = json['ref_range_value'];
    nurseId = json['nurse_id'];
    remarks = json['remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? patientId;
  String? name;
  String? value;
  String? desc;
  String? icon;
  String? color;
  String? lastCheckUpDate;
  String? unitsId;
  String? statusId;
  String? refRangeValue;
  String? nurseId;
  String? remarks;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['patient_id'] = patientId;
    map['name'] = name;
    map['value'] = value;
    map['desc'] = desc;
    map['icon'] = icon;
    map['color'] = color;
    map['last_check_up_date'] = lastCheckUpDate;
    map['units_id'] = unitsId;
    map['status_id'] = statusId;
    map['ref_range_value'] = refRangeValue;
    map['nurse_id'] = nurseId;
    map['remarks'] = remarks;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}