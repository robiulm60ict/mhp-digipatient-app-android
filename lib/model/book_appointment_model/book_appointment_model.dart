import 'dart:convert';
BookAppointmentModel bookAppointmentModelFromJson(String str) => BookAppointmentModel.fromJson(json.decode(str));
String bookAppointmentModelToJson(BookAppointmentModel data) => json.encode(data.toJson());
class BookAppointmentModel {
  BookAppointmentModel({
      this.doctorId, 
      this.patientId, 
      this.date, 
      this.time, 
      this.appointmentType, 
      this.callingType, 
      this.chamberId, 
      this.disease, 
      this.paymentType, 
      this.amount, 
      this.transactionNo, 
      this.updatedAt, 
      this.createdAt, 
      this.id,});

  BookAppointmentModel.fromJson(dynamic json) {
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    date = json['date'];
    time = json['time'];
    appointmentType = json['appointment_type'];
    callingType = json['calling_type'];
    chamberId = json['chamber_id'];
    disease = json['disease'];
    paymentType = json['payment_type'];
    amount = json['amount'];
    transactionNo = json['transaction_no'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? doctorId;
  String? patientId;
  String? date;
  String? time;
  String? appointmentType;
  String? callingType;
  String? chamberId;
  String? disease;
  String? paymentType;
  String? amount;
  String? transactionNo;
  String? updatedAt;
  String? createdAt;
  num? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctor_id'] = doctorId;
    map['patient_id'] = patientId;
    map['date'] = date;
    map['time'] = time;
    map['appointment_type'] = appointmentType;
    map['calling_type'] = callingType;
    map['chamber_id'] = chamberId;
    map['disease'] = disease;
    map['payment_type'] = paymentType;
    map['amount'] = amount;
    map['transaction_no'] = transactionNo;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}