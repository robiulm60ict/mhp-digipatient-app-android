// To parse this JSON data, do
//
//     final pastRxModel = pastRxModelFromJson(jsonString);

import 'dart:convert';

List<PastRxModel> pastRxModelFromJson(String str) => List<PastRxModel>.from(json.decode(str).map((x) => PastRxModel.fromJson(x)));

String pastRxModelToJson(List<PastRxModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PastRxModel {
  int? id;
  String? patientId;
  String? drugId;
  String? drugName;
  String? guid;
  String? drugGenericName;
  String? dose;
  String? frequency;
  String? food;
  String? others;
  String? route;
  dynamic tabsInistraction;
  String? complexInstruction;
  dynamic extraInstruction;
  dynamic drugsTimeLimit;
  dynamic prescribedAs;
  dynamic generalNote;
  dynamic pbsListing;
  String? quantity;
  String? repeats;
  String? condition;
  dynamic furtherDetails;
  int? iSAllergyCheck;
  int? isFvDose;
  int? isRegulation;
  int? isPrintBrandName;
  int? isPrintGenericName;
  int? isUrgentSupply;
  int? isAllowBrandSubstitution;
  int? isSaveDose;
  int? isConditionStatusRight;
  int? isConditionStatusLeft;
  int? isConditionStatusBilateral;
  int? isConditionStatusAcute;
  int? isConditionStatusChronic;
  int? isConditionStatusMild;
  int? isConditionStatusModerate;
  int? isConditionStatusSevere;
  int? isAddToPastHistory;
  int? isAddToReasonForVisit;
  int? isMarkAsConfidential;
  int? deleteStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  Medicine? medicine;

  PastRxModel({
    this.id,
    this.patientId,
    this.drugId,
    this.drugName,
    this.guid,
    this.drugGenericName,
    this.dose,
    this.frequency,
    this.food,
    this.others,
    this.route,
    this.tabsInistraction,
    this.complexInstruction,
    this.extraInstruction,
    this.drugsTimeLimit,
    this.prescribedAs,
    this.generalNote,
    this.pbsListing,
    this.quantity,
    this.repeats,
    this.condition,
    this.furtherDetails,
    this.iSAllergyCheck,
    this.isFvDose,
    this.isRegulation,
    this.isPrintBrandName,
    this.isPrintGenericName,
    this.isUrgentSupply,
    this.isAllowBrandSubstitution,
    this.isSaveDose,
    this.isConditionStatusRight,
    this.isConditionStatusLeft,
    this.isConditionStatusBilateral,
    this.isConditionStatusAcute,
    this.isConditionStatusChronic,
    this.isConditionStatusMild,
    this.isConditionStatusModerate,
    this.isConditionStatusSevere,
    this.isAddToPastHistory,
    this.isAddToReasonForVisit,
    this.isMarkAsConfidential,
    this.deleteStatus,
    this.createdAt,
    this.updatedAt,
    this.medicine,
  });

  factory PastRxModel.fromJson(Map<String, dynamic> json) => PastRxModel(
    id: json["id"],
    patientId: json["patient_id"],
    drugId: json["drug_id"],
    drugName: json["drug_name"],
    guid: json["guid"],
    drugGenericName: json["drug_generic_name"],
    dose: json["dose"],
    frequency: json["frequency"],
    food: json["food"],
    others: json["others"],
    route: json["route"],
    tabsInistraction: json["tabs_inistraction"],
    complexInstruction: json["Complex_instruction"],
    extraInstruction: json["extra_instruction"],
    drugsTimeLimit: json["drugsTimeLimit"],
    prescribedAs: json["prescribedAs"],
    generalNote: json["general_note"],
    pbsListing: json["pbs_listing"],
    quantity: json["quantity"],
    repeats: json["repeats"],
    condition: json["condition"],
    furtherDetails: json["further_details"],
    iSAllergyCheck: json["iSAllergyCheck"],
    isFvDose: json["is_FVDose"],
    isRegulation: json["is_Regulation"],
    isPrintBrandName: json["is_print_brand_name"],
    isPrintGenericName: json["is_print_generic_name"],
    isUrgentSupply: json["is_urgent_supply"],
    isAllowBrandSubstitution: json["is_allow_brand_substitution"],
    isSaveDose: json["is_save_dose"],
    isConditionStatusRight: json["is_condition_status_right"],
    isConditionStatusLeft: json["is_condition_status_left"],
    isConditionStatusBilateral: json["is_condition_status_bilateral"],
    isConditionStatusAcute: json["is_condition_status_acute"],
    isConditionStatusChronic: json["is_condition_status_chronic"],
    isConditionStatusMild: json["is_condition_status_mild"],
    isConditionStatusModerate: json["is_condition_status_moderate"],
    isConditionStatusSevere: json["is_condition_status_severe"],
    isAddToPastHistory: json["is_add_to_past_history"],
    isAddToReasonForVisit: json["is_add_to_reason_for_visit"],
    isMarkAsConfidential: json["is_mark_as_confidential"],
    deleteStatus: json["delete_status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    medicine: json["medicine"] == null ? null : Medicine.fromJson(json["medicine"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "patient_id": patientId,
    "drug_id": drugId,
    "drug_name": drugName,
    "guid": guid,
    "drug_generic_name": drugGenericName,
    "dose": dose,
    "frequency": frequency,
    "food": food,
    "others": others,
    "route": route,
    "tabs_inistraction": tabsInistraction,
    "Complex_instruction": complexInstruction,
    "extra_instruction": extraInstruction,
    "drugsTimeLimit": drugsTimeLimit,
    "prescribedAs": prescribedAs,
    "general_note": generalNote,
    "pbs_listing": pbsListing,
    "quantity": quantity,
    "repeats": repeats,
    "condition": condition,
    "further_details": furtherDetails,
    "iSAllergyCheck": iSAllergyCheck,
    "is_FVDose": isFvDose,
    "is_Regulation": isRegulation,
    "is_print_brand_name": isPrintBrandName,
    "is_print_generic_name": isPrintGenericName,
    "is_urgent_supply": isUrgentSupply,
    "is_allow_brand_substitution": isAllowBrandSubstitution,
    "is_save_dose": isSaveDose,
    "is_condition_status_right": isConditionStatusRight,
    "is_condition_status_left": isConditionStatusLeft,
    "is_condition_status_bilateral": isConditionStatusBilateral,
    "is_condition_status_acute": isConditionStatusAcute,
    "is_condition_status_chronic": isConditionStatusChronic,
    "is_condition_status_mild": isConditionStatusMild,
    "is_condition_status_moderate": isConditionStatusModerate,
    "is_condition_status_severe": isConditionStatusSevere,
    "is_add_to_past_history": isAddToPastHistory,
    "is_add_to_reason_for_visit": isAddToReasonForVisit,
    "is_mark_as_confidential": isMarkAsConfidential,
    "delete_status": deleteStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "medicine": medicine?.toJson(),
  };
}

class Medicine {
  int? id;
  String? macrohealthSg;

  Medicine({
    this.id,
    this.macrohealthSg,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
    id: json["id"],
    macrohealthSg: json["macrohealth_sg"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "macrohealth_sg": macrohealthSg,
  };
}
