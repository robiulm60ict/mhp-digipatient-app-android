// To parse this JSON data, do
//
//     final myPaymentModel = myPaymentModelFromJson(jsonString);

import 'dart:convert';

List<MyPaymentModel> myPaymentModelFromJson(String str) => List<MyPaymentModel>.from(json.decode(str).map((x) => MyPaymentModel.fromJson(x)));

String myPaymentModelToJson(List<MyPaymentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyPaymentModel {
  int? id;
  int? saasBranchId;
  String? saasBranchName;
  String? patientHnNumber;
  int? doctorId;
  String? inoviceNumber;
  DateTime? date;
  dynamic time;
  String? appointmentType;
  dynamic callingType;
  dynamic chamberId;
  String? disease;
  String? paymentType;
  String? amount;
  String? transactionNo;
  String? transactionPhoneNumber;
  String? shift;
  String? referredName;
  int? paymentConfirmation;
  int? isConfirmed;
  int? rescheduleId;
  DateTime? createdAt;
  DateTime? updatedAt;

  MyPaymentModel({
    this.id,
    this.saasBranchId,
    this.saasBranchName,
    this.patientHnNumber,
    this.doctorId,
    this.inoviceNumber,
    this.date,
    this.time,
    this.appointmentType,
    this.callingType,
    this.chamberId,
    this.disease,
    this.paymentType,
    this.amount,
    this.transactionNo,
    this.transactionPhoneNumber,
    this.shift,
    this.referredName,
    this.paymentConfirmation,
    this.isConfirmed,
    this.rescheduleId,
    this.createdAt,
    this.updatedAt,
  });

  factory MyPaymentModel.fromJson(Map<String, dynamic> json) => MyPaymentModel(
    id: json["id"],
    saasBranchId: json["saas_branch_id"],
    saasBranchName: json["saas_branch_name"],
    patientHnNumber: json["patient_hn_number"],
    doctorId: json["doctor_id"],
    inoviceNumber: json["inovice_number"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    appointmentType: json["appointment_type"],
    callingType: json["calling_type"],
    chamberId: json["chamber_id"],
    disease: json["disease"],
    paymentType: json["payment_type"],
    amount: json["amount"],
    transactionNo: json["transaction_no"],
    transactionPhoneNumber: json["transaction_phone_number"],
    shift: json["shift"],
    referredName: json["referred_name"],
    paymentConfirmation: json["payment_confirmation"],
    isConfirmed: json["is_confirmed"],
    rescheduleId: json["reschedule_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "saas_branch_id": saasBranchId,
    "saas_branch_name": saasBranchName,
    "patient_hn_number": patientHnNumber,
    "doctor_id": doctorId,
    "inovice_number": inoviceNumber,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "appointment_type": appointmentType,
    "calling_type": callingType,
    "chamber_id": chamberId,
    "disease": disease,
    "payment_type": paymentType,
    "amount": amount,
    "transaction_no": transactionNo,
    "transaction_phone_number": transactionPhoneNumber,
    "shift": shift,
    "referred_name": referredName,
    "payment_confirmation": paymentConfirmation,
    "is_confirmed": isConfirmed,
    "reschedule_id": rescheduleId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
