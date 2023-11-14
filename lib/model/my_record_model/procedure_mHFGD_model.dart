// To parse this JSON data, do
//
//     final procedureMhfgdModel = procedureMhfgdModelFromJson(jsonString);

import 'dart:convert';

ProcedureMhfgdModel procedureMhfgdModelFromJson(String str) => ProcedureMhfgdModel.fromJson(json.decode(str));

String procedureMhfgdModelToJson(ProcedureMhfgdModel data) => json.encode(data.toJson());

class ProcedureMhfgdModel {
  int? status;
  List<AllProcedure>? allProcedures;

  ProcedureMhfgdModel({
    this.status,
    this.allProcedures,
  });

  factory ProcedureMhfgdModel.fromJson(Map<String, dynamic> json) => ProcedureMhfgdModel(
    status: json["status"],
    allProcedures: json["all_procedures"] == null ? [] : List<AllProcedure>.from(json["all_procedures"]!.map((x) => AllProcedure.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "all_procedures": allProcedures == null ? [] : List<dynamic>.from(allProcedures!.map((x) => x.toJson())),
  };
}

class AllProcedure {
  int? id;
  dynamic procedureActionName;
  dynamic procedureForName;
  dynamic procedureFurtherDetails;
  String? procedureName;
  String? patientId;
  int? deleteStatus;
  DateTime? createdAt;
  DateTime? updatedAt;

  AllProcedure({
    this.id,
    this.procedureActionName,
    this.procedureForName,
    this.procedureFurtherDetails,
    this.procedureName,
    this.patientId,
    this.deleteStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory AllProcedure.fromJson(Map<String, dynamic> json) => AllProcedure(
    id: json["id"],
    procedureActionName: json["procedure_action_name"],
    procedureForName: json["procedure_for_name"],
    procedureFurtherDetails: json["procedure_further_details"],
    procedureName: json["procedure_name"],
    patientId: json["patient_id"],
    deleteStatus: json["delete_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "procedure_action_name": procedureActionName,
    "procedure_for_name": procedureForName,
    "procedure_further_details": procedureFurtherDetails,
    "procedure_name": procedureName,
    "patient_id": patientId,
    "delete_status": deleteStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
