// import 'dart:convert';
// AnatomySymptoms anatomySymptomsFromJson(String str) => AnatomySymptoms.fromJson(json.decode(str));
// String anatomySymptomsToJson(AnatomySymptoms data) => json.encode(data.toJson());
// class AnatomySymptoms {
//   AnatomySymptoms({
//       this.status,
//       this.symptomsAnatomy,});
//
//   AnatomySymptoms.fromJson(dynamic json) {
//     status = json['status'];
//     if (json['symptoms_anatomy'] != null) {
//       symptomsAnatomy = [];
//       json['symptoms_anatomy'].forEach((v) {
//         symptomsAnatomy?.add(SymptomsAnatomy.fromJson(v));
//       });
//     }
//   }
//   num? status;
//   List<SymptomsAnatomy>? symptomsAnatomy;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (symptomsAnatomy != null) {
//       map['symptoms_anatomy'] = symptomsAnatomy?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }
//
// SymptomsAnatomy symptomsAnatomyFromJson(String str) => SymptomsAnatomy.fromJson(json.decode(str));
// String symptomsAnatomyToJson(SymptomsAnatomy data) => json.encode(data.toJson());
// class SymptomsAnatomy {
//   SymptomsAnatomy({
//       this.id,
//       this.mainBodyPartId,
//       this.subBodyPartId,
//       this.sideSelectionName,
//       this.genderId,
//       this.symptomName,
//       this.deleteStatus,
//       this.createdAt,
//       this.updatedAt,
//       this.mainBodyPartName,
//       this.subBodyPartName,
//       this.birthSexName,
//   this.isSelected = false,
//   });
//
//   SymptomsAnatomy.fromJson(dynamic json) {
//     id = json['id'];
//     mainBodyPartId = json['main_body_part_id'];
//     subBodyPartId = json['sub_body_part_id'];
//     sideSelectionName = json['side_selection_name'];
//     genderId = json['gender_id'];
//     symptomName = json['symptom_name'];
//     deleteStatus = json['delete_status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     mainBodyPartName = json['MainBodyPart_name'];
//     subBodyPartName = json['SubBodyPart_name'];
//     birthSexName = json['birth_sex_name'];
//     isSelected = false;
//   }
//   String? id;
//   String? mainBodyPartId;
//   String? subBodyPartId;
//   String? sideSelectionName;
//   String? genderId;
//   String? symptomName;
//   String? deleteStatus;
//   String? createdAt;
//   String? updatedAt;
//   String? mainBodyPartName;
//   String? subBodyPartName;
//   String? birthSexName;
//   bool isSelected;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['main_body_part_id'] = mainBodyPartId;
//     map['sub_body_part_id'] = subBodyPartId;
//     map['side_selection_name'] = sideSelectionName;
//     map['gender_id'] = genderId;
//     map['symptom_name'] = symptomName;
//     map['delete_status'] = deleteStatus;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     map['MainBodyPart_name'] = mainBodyPartName;
//     map['SubBodyPart_name'] = subBodyPartName;
//     map['birth_sex_name'] = birthSexName;
//     return map;
//   }
//
// }