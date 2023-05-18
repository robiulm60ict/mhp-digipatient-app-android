import 'dart:convert';
DiagnosisProcedureModel diagnosisProcedureModelFromJson(String str) => DiagnosisProcedureModel.fromJson(json.decode(str));
String diagnosisProcedureModelToJson(DiagnosisProcedureModel data) => json.encode(data.toJson());
class DiagnosisProcedureModel {
  DiagnosisProcedureModel({
      this.status, 
      this.data,});

  DiagnosisProcedureModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.diagnosisProcedureCode, 
      this.diagnosisProcedureName,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    diagnosisProcedureCode = json['DiagnosisProcedure_code'];
    diagnosisProcedureName = json['DiagnosisProcedure_name'];
  }
  num? id;
  String? diagnosisProcedureCode;
  String? diagnosisProcedureName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['DiagnosisProcedure_code'] = diagnosisProcedureCode;
    map['DiagnosisProcedure_name'] = diagnosisProcedureName;
    return map;
  }

}