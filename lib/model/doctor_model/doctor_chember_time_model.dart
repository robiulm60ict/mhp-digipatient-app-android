import 'dart:convert';
DoctorChamberTimeModel doctorChamberTimeModelFromJson(String str) => DoctorChamberTimeModel.fromJson(json.decode(str));
String doctorChamberTimeModelToJson(DoctorChamberTimeModel data) => json.encode(data.toJson());
class DoctorChamberTimeModel {
  DoctorChamberTimeModel({
      this.status, 
      this.docTimeSlots,});

  DoctorChamberTimeModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['docTimeSlots'] != null) {
      docTimeSlots = [];
      json['docTimeSlots'].forEach((v) {
        docTimeSlots?.add(DocTimeSlots.fromJson(v));
      });
    }
  }
  num? status;
  List<DocTimeSlots>? docTimeSlots;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (docTimeSlots != null) {
      map['docTimeSlots'] = docTimeSlots?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

DocTimeSlots docTimeSlotsFromJson(String str) => DocTimeSlots.fromJson(json.decode(str));
String docTimeSlotsToJson(DocTimeSlots data) => json.encode(data.toJson());
class DocTimeSlots {
  DocTimeSlots({
      this.id, 
      this.doctorId, 
      this.chamberId, 
      this.year, 
      this.month, 
      this.allMonth, 
      this.day, 
      this.slotFrom, 
      this.slotTo, 
      this.type, 
      this.deleteStatus, 
      this.createdAt, 
      this.updatedAt, 
      this.drGivenName, 
      this.usualProviderName,});

  DocTimeSlots.fromJson(dynamic json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    chamberId = json['chamber_id'];
    year = json['year'];
    month = json['month'];
    allMonth = json['all_month'];
    day = json['day'];
    slotFrom = json['slot_from'];
    slotTo = json['slot_to'];
    type = json['type'];
    deleteStatus = json['delete_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    drGivenName = json['dr_given_name'];
    usualProviderName = json['usual_provider_name'];
  }
  String? id;
  String? doctorId;
  String? chamberId;
  String? year;
  String? month;
  String? allMonth;
  String? day;
  String? slotFrom;
  String? slotTo;
  String? type;
  String? deleteStatus;
  String? createdAt;
  String? updatedAt;
  String? drGivenName;
  String? usualProviderName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doctor_id'] = doctorId;
    map['chamber_id'] = chamberId;
    map['year'] = year;
    map['month'] = month;
    map['all_month'] = allMonth;
    map['day'] = day;
    map['slot_from'] = slotFrom;
    map['slot_to'] = slotTo;
    map['type'] = type;
    map['delete_status'] = deleteStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['dr_given_name'] = drGivenName;
    map['usual_provider_name'] = usualProviderName;
    return map;
  }

}