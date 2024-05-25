// To parse this JSON data, do
//
//     final myLabRequestDataList = myLabRequestDataListFromJson(jsonString);

import 'dart:convert';

List<MyLabRequestDataList> myLabRequestDataListFromJson(String str) => List<MyLabRequestDataList>.from(json.decode(str).map((x) => MyLabRequestDataList.fromJson(x)));

String myLabRequestDataListToJson(List<MyLabRequestDataList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyLabRequestDataList {
  int? id;
  int? patientId;
  int? branchId;
  String? testType;
  String? testName;
  dynamic amount;
  String? lat;
  String? long;
  String? sampleCollention;
  dynamic paymentNumber;
  dynamic tranId;
  dynamic refNum;
  dynamic status;
  dynamic date;
  dynamic address;
  DateTime? createdAt;
  DateTime? updatedAt;

  MyLabRequestDataList({
    this.id,
    this.patientId,
    this.branchId,
    this.testType,
    this.testName,
    this.amount,
    this.lat,
    this.long,
    this.sampleCollention,
    this.paymentNumber,
    this.tranId,
    this.refNum,
    this.status,
    this.date,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory MyLabRequestDataList.fromJson(Map<String, dynamic> json) => MyLabRequestDataList(
    id: json["id"],
    patientId: json["patient_id"],
    branchId: json["branch_id"],
    testType: json["test_type"],
    testName: json["test_name"],
    amount: json["amount"],
    lat: json["lat"],
    long: json["long"],
    sampleCollention: json["sample_collention"],
    paymentNumber: json["payment_number"],
    tranId: json["tran_id"],
    refNum: json["ref_num"],
    status: json["status"],
    date: json["date"],
    address: json["address"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "branch_id": branchId,
    "test_type": testType,
    "test_name": testName,
    "amount": amount,
    "lat": lat,
    "long": long,
    "sample_collention": sampleCollention,
    "payment_number": paymentNumber,
    "tran_id": tranId,
    "ref_num": refNum,
    "status": status,
    "date": date,
    "address": address,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
