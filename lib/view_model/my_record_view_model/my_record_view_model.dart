import 'package:digi_patient/model/my_record_model/procedure_mHFGD_model.dart';
import 'package:digi_patient/model/my_record_model/reason_for_visit_model.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../model/my_record_model/medical_history_from_great_doc_model.dart';
import '../../repository/my_record_repo/my_record_repo.dart';

class MyRecordViewModel with ChangeNotifier{

  List<MedicalHistoryFromGreatDocModel> medicalHistoryFromGreatDocList = [];
  List<PastHistory> medicalHistoryFromGreatDocPastList = [];

  bool isMedicalHistoryFromGreatDocLoading = true;

  MyRecordRepo myRecordRepo = MyRecordRepo();

  getMedicalHistoryFromGreatDoc(BuildContext context)async{
    medicalHistoryFromGreatDocList.clear();
    medicalHistoryFromGreatDocPastList.clear();
    isMedicalHistoryFromGreatDocLoading = true;
    notifyListeners();
    await myRecordRepo.getMedicalHistoryFromGreatDoc().then((value) {
      medicalHistoryFromGreatDocList.add(value);
      medicalHistoryFromGreatDocPastList.addAll(value.pastHistory!);
      isMedicalHistoryFromGreatDocLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isMedicalHistoryFromGreatDocLoading = true;
      Messages.snackBar(context, error.toString());
    });
  }

  List<AllProcedures> procedureList = [];
  bool isProcedureLoading = true;

  getProcedureFromGreatDoc(BuildContext context)async{
    isProcedureLoading = true;
    procedureList.clear();
    notifyListeners();

    await myRecordRepo.getProcedureFromGreatDoc().then((value) {
      procedureList.addAll(value.allProcedures!);
      isProcedureLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isProcedureLoading = true;
      Messages.snackBar(context, error.toString());
    });
  }

  /// vitals

  bool isVitalLoading = true;

  List<VitalsModel> vitalsList = [];
  List<PatientsVs> patientVsList = [];

  getVitals(BuildContext context)async{
    isVitalLoading = true;
    vitalsList.clear();
    patientVsList.clear();
    notifyListeners();

    myRecordRepo.getVitals().then((value) {
      vitalsList.add(value);
      // patientVsList.addAll(value.vsArray?.first.patientsVs?);
      isVitalLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isVitalLoading = true;
      Messages.snackBar(context, error.toString());
    });
  }

  bool isReasonForVisitLoading = true;
  List<AllReasons> reasonForVisitList = [];

  getReasonForVisit(BuildContext context)async{
    isReasonForVisitLoading = true;
    reasonForVisitList.clear();
    await myRecordRepo.getReasonForVisit().then((value) {
      reasonForVisitList.addAll(value.allReasons!);
      isReasonForVisitLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isReasonForVisitLoading = true;
      Messages.snackBar(context, error.toString());
      notifyListeners();
    });

  }
  String getTime(String? date){
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if(dateObject != null){
      return DateFormat.jm().format(dateObject);
    }else{
      return "null";
    }
  }

  String getDate(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if(dateObject != null){
      return "${dateObject.day}-${dateObject.month}-${dateObject.year}";
    }else{
      return "null";
    }
  }
}