import 'dart:convert';

import 'package:digi_patient/model/my_record_model/medical_history_from_great_doc_model.dart';
AddMedicalHistoryModel addMedicalHistoryModelFromJson(String str) => AddMedicalHistoryModel.fromJson(json.decode(str));
String addMedicalHistoryModelToJson(AddMedicalHistoryModel data) => json.encode(data.toJson());
class AddMedicalHistoryModel {
  AddMedicalHistoryModel({
      this.status, 
      this.message, 
      this.pastHistory,});

  AddMedicalHistoryModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['pastHistory'] != null) {
      pastHistory = [];
      json['pastHistory'].forEach((v) {
        pastHistory?.add(PastHistory.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  List<PastHistory>? pastHistory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (pastHistory != null) {
      map['pastHistory'] = pastHistory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}