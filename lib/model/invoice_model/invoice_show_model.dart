import 'dart:convert';
InvoiceShowModel invoiceShowModelFromJson(String str) => InvoiceShowModel.fromJson(json.decode(str));
String invoiceShowModelToJson(InvoiceShowModel data) => json.encode(data.toJson());
class InvoiceShowModel {
  InvoiceShowModel({
    this.id,
    this.patientId,
    this.doctorId,
    this.date,
    this.time,
    this.appointmentType,
    this.callingType,
    this.chamberId,
    this.disease,
    this.paymentType,
    this.amount,
    this.transactionNo,
    this.isConfirmed,
    this.createdAt,
    this.updatedAt,});

  InvoiceShowModel.fromJson(dynamic json) {
    id = json['id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    time = json['time'];
    appointmentType = json['appointment_type'];
    callingType = json['calling_type'];
    chamberId = json['chamber_id'];
    disease = json['disease'];
    paymentType = json['payment_type'];
    amount = json['amount'];
    transactionNo = json['transaction_no'];
    isConfirmed = json['is_confirmed'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? patientId;
  String? doctorId;
  String? date;
  String? time;
  String? appointmentType;
  String? callingType;
  String? chamberId;
  String? disease;
  String? paymentType;
  String? amount;
  String? transactionNo;
  String? isConfirmed;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['patient_id'] = patientId;
    map['doctor_id'] = doctorId;
    map['date'] = date;
    map['time'] = time;
    map['appointment_type'] = appointmentType;
    map['calling_type'] = callingType;
    map['chamber_id'] = chamberId;
    map['disease'] = disease;
    map['payment_type'] = paymentType;
    map['amount'] = amount;
    map['transaction_no'] = transactionNo;
    map['is_confirmed'] = isConfirmed;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}