import 'dart:convert';
ProcedureMhfgdModel procedureMhfgdModelFromJson(String str) => ProcedureMhfgdModel.fromJson(json.decode(str));
String procedureMhfgdModelToJson(ProcedureMhfgdModel data) => json.encode(data.toJson());
class ProcedureMhfgdModel {
  ProcedureMhfgdModel({
      this.status, 
      this.allProcedures,});

  ProcedureMhfgdModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['all_procedures'] != null) {
      allProcedures = [];
      json['all_procedures'].forEach((v) {
        allProcedures?.add(AllProcedures.fromJson(v));
      });
    }
  }
  num? status;
  List<AllProcedures>? allProcedures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (allProcedures != null) {
      map['all_procedures'] = allProcedures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

AllProcedures allProceduresFromJson(String str) => AllProcedures.fromJson(json.decode(str));
String allProceduresToJson(AllProcedures data) => json.encode(data.toJson());
class AllProcedures {
  AllProcedures({
      this.id, 
      this.procedureActionName, 
      this.procedureForName, 
      this.procedureFurtherDetails, 
      this.procedureName, 
      this.patientId, 
      this.deleteStatus, 
      this.createdAt, 
      this.updatedAt,});

  AllProcedures.fromJson(dynamic json) {
    id = json['id'];
    procedureActionName = json['procedure_action_name'];
    procedureForName = json['procedure_for_name'];
    procedureFurtherDetails = json['procedure_further_details'];
    procedureName = json['procedure_name'];
    patientId = json['patient_id'];
    deleteStatus = json['delete_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? procedureActionName;
  String? procedureForName;
  String? procedureFurtherDetails;
  String? procedureName;
  String? patientId;
  String? deleteStatus;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['procedure_action_name'] = procedureActionName;
    map['procedure_for_name'] = procedureForName;
    map['procedure_further_details'] = procedureFurtherDetails;
    map['procedure_name'] = procedureName;
    map['patient_id'] = patientId;
    map['delete_status'] = deleteStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}