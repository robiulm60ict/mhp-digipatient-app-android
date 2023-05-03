import 'dart:convert';
ReasonForVisitModel reasonForVisitModelFromJson(String str) => ReasonForVisitModel.fromJson(json.decode(str));
String reasonForVisitModelToJson(ReasonForVisitModel data) => json.encode(data.toJson());
class ReasonForVisitModel {
  ReasonForVisitModel({
      this.status, 
      this.allReasons,});

  ReasonForVisitModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['allReasons'] != null) {
      allReasons = [];
      json['allReasons'].forEach((v) {
        allReasons?.add(AllReasons.fromJson(v));
      });
    }
  }
  num? status;
  List<AllReasons>? allReasons;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (allReasons != null) {
      map['allReasons'] = allReasons?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

AllReasons allReasonsFromJson(String str) => AllReasons.fromJson(json.decode(str));
String allReasonsToJson(AllReasons data) => json.encode(data.toJson());
class AllReasons {
  AllReasons({
      this.id, 
      this.resonForName, 
      this.code, 
      this.resonFurtherDetails, 
      this.resonName, 
      this.deleteStatus, 
      this.patientId, 
      this.nurseId, 
      this.categoryName, 
      this.lastCheckUpDate, 
      this.date, 
      this.createdAt, 
      this.updatedAt,});

  AllReasons.fromJson(dynamic json) {
    id = json['id'];
    resonForName = json['reson_for_name'];
    code = json['code'];
    resonFurtherDetails = json['reson_further_details'];
    resonName = json['reson_name'];
    deleteStatus = json['delete_status'];
    patientId = json['patient_id'];
    nurseId = json['nurse_id'];
    categoryName = json['category_name'];
    lastCheckUpDate = json['last_check_up_date'];
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? resonForName;
  String? code;
  String? resonFurtherDetails;
  String? resonName;
  String? deleteStatus;
  String? patientId;
  String? nurseId;
  String? categoryName;
  String? lastCheckUpDate;
  String? date;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['reson_for_name'] = resonForName;
    map['code'] = code;
    map['reson_further_details'] = resonFurtherDetails;
    map['reson_name'] = resonName;
    map['delete_status'] = deleteStatus;
    map['patient_id'] = patientId;
    map['nurse_id'] = nurseId;
    map['category_name'] = categoryName;
    map['last_check_up_date'] = lastCheckUpDate;
    map['date'] = date;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}