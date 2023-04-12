import 'dart:convert';
CurrentRxModel currentRxModelFromJson(String str) => CurrentRxModel.fromJson(json.decode(str));
String currentRxModelToJson(CurrentRxModel data) => json.encode(data.toJson());
class CurrentRxModel {
  CurrentRxModel({
      this.status, 
      this.message, 
      this.drugs,});

  CurrentRxModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['drugs'] != null) {
      drugs = [];
      json['drugs'].forEach((v) {
        drugs?.add(Drugs.fromJson(v));
      });
    }
  }
  num? status;
  String? message;
  List<Drugs>? drugs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (drugs != null) {
      map['drugs'] = drugs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Drugs drugsFromJson(String str) => Drugs.fromJson(json.decode(str));
String drugsToJson(Drugs data) => json.encode(data.toJson());
class Drugs {
  Drugs({
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
      this.isFVDose, 
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
      this.updatedAt,});

  Drugs.fromJson(dynamic json) {
    id = json['id'];
    patientId = json['patient_id'];
    drugId = json['drug_id'];
    drugName = json['drug_name'];
    guid = json['guid'];
    drugGenericName = json['drug_generic_name'];
    dose = json['dose'];
    frequency = json['frequency'];
    food = json['food'];
    others = json['others'];
    route = json['route'];
    tabsInistraction = json['tabs_inistraction'];
    complexInstruction = json['Complex_instruction'];
    extraInstruction = json['extra_instruction'];
    drugsTimeLimit = json['drugsTimeLimit'];
    prescribedAs = json['prescribedAs'];
    generalNote = json['general_note'];
    pbsListing = json['pbs_listing'];
    quantity = json['quantity'];
    repeats = json['repeats'];
    condition = json['condition'];
    furtherDetails = json['further_details'];
    iSAllergyCheck = json['iSAllergyCheck'];
    isFVDose = json['is_FVDose'];
    isRegulation = json['is_Regulation'];
    isPrintBrandName = json['is_print_brand_name'];
    isPrintGenericName = json['is_print_generic_name'];
    isUrgentSupply = json['is_urgent_supply'];
    isAllowBrandSubstitution = json['is_allow_brand_substitution'];
    isSaveDose = json['is_save_dose'];
    isConditionStatusRight = json['is_condition_status_right'];
    isConditionStatusLeft = json['is_condition_status_left'];
    isConditionStatusBilateral = json['is_condition_status_bilateral'];
    isConditionStatusAcute = json['is_condition_status_acute'];
    isConditionStatusChronic = json['is_condition_status_chronic'];
    isConditionStatusMild = json['is_condition_status_mild'];
    isConditionStatusModerate = json['is_condition_status_moderate'];
    isConditionStatusSevere = json['is_condition_status_severe'];
    isAddToPastHistory = json['is_add_to_past_history'];
    isAddToReasonForVisit = json['is_add_to_reason_for_visit'];
    isMarkAsConfidential = json['is_mark_as_confidential'];
    deleteStatus = json['delete_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
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
  String? tabsInistraction;
  dynamic complexInstruction;
  dynamic extraInstruction;
  String? drugsTimeLimit;
  dynamic prescribedAs;
  dynamic generalNote;
  dynamic pbsListing;
  String? quantity;
  String? repeats;
  String? condition;
  dynamic furtherDetails;
  String? iSAllergyCheck;
  String? isFVDose;
  String? isRegulation;
  String? isPrintBrandName;
  String? isPrintGenericName;
  String? isUrgentSupply;
  String? isAllowBrandSubstitution;
  String? isSaveDose;
  String? isConditionStatusRight;
  String? isConditionStatusLeft;
  String? isConditionStatusBilateral;
  String? isConditionStatusAcute;
  String? isConditionStatusChronic;
  String? isConditionStatusMild;
  String? isConditionStatusModerate;
  String? isConditionStatusSevere;
  String? isAddToPastHistory;
  String? isAddToReasonForVisit;
  String? isMarkAsConfidential;
  String? deleteStatus;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['patient_id'] = patientId;
    map['drug_id'] = drugId;
    map['drug_name'] = drugName;
    map['guid'] = guid;
    map['drug_generic_name'] = drugGenericName;
    map['dose'] = dose;
    map['frequency'] = frequency;
    map['food'] = food;
    map['others'] = others;
    map['route'] = route;
    map['tabs_inistraction'] = tabsInistraction;
    map['Complex_instruction'] = complexInstruction;
    map['extra_instruction'] = extraInstruction;
    map['drugsTimeLimit'] = drugsTimeLimit;
    map['prescribedAs'] = prescribedAs;
    map['general_note'] = generalNote;
    map['pbs_listing'] = pbsListing;
    map['quantity'] = quantity;
    map['repeats'] = repeats;
    map['condition'] = condition;
    map['further_details'] = furtherDetails;
    map['iSAllergyCheck'] = iSAllergyCheck;
    map['is_FVDose'] = isFVDose;
    map['is_Regulation'] = isRegulation;
    map['is_print_brand_name'] = isPrintBrandName;
    map['is_print_generic_name'] = isPrintGenericName;
    map['is_urgent_supply'] = isUrgentSupply;
    map['is_allow_brand_substitution'] = isAllowBrandSubstitution;
    map['is_save_dose'] = isSaveDose;
    map['is_condition_status_right'] = isConditionStatusRight;
    map['is_condition_status_left'] = isConditionStatusLeft;
    map['is_condition_status_bilateral'] = isConditionStatusBilateral;
    map['is_condition_status_acute'] = isConditionStatusAcute;
    map['is_condition_status_chronic'] = isConditionStatusChronic;
    map['is_condition_status_mild'] = isConditionStatusMild;
    map['is_condition_status_moderate'] = isConditionStatusModerate;
    map['is_condition_status_severe'] = isConditionStatusSevere;
    map['is_add_to_past_history'] = isAddToPastHistory;
    map['is_add_to_reason_for_visit'] = isAddToReasonForVisit;
    map['is_mark_as_confidential'] = isMarkAsConfidential;
    map['delete_status'] = deleteStatus;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}