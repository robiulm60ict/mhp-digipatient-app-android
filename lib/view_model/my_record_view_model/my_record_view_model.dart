import 'package:another_flushbar/flushbar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/my_record_model/procedure_mHFGD_model.dart';
import 'package:digi_patient/model/my_record_model/reason_for_visit_model.dart';
import 'package:digi_patient/model/my_record_model/save_vital_model.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/my_record_model/medical_history_from_great_doc_model.dart';
import '../../repository/my_record_repo/my_record_repo.dart';
import '../../routes/routes.gr.dart';
import '../../utils/user.dart';

class MyRecordViewModel with ChangeNotifier {
  List<MedicalHistoryFromGreatDocModel> medicalHistoryFromGreatDocList = [];
  List<PastHistory> medicalHistoryFromGreatDocPastList = [];

  bool isMedicalHistoryFromGreatDocLoading = true;

  MyRecordRepo myRecordRepo = MyRecordRepo();

  getMedicalHistoryFromGreatDoc(BuildContext context) async {
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

  getProcedureFromGreatDoc(BuildContext context) async {
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
  // TabController? tabController ;

  getVitals(BuildContext context,) async {
    isVitalLoading = true;
    vitalsList.clear();
    patientVsList.clear();
    notifyListeners();

    myRecordRepo.getVitals().then((value) {
      vitalsList.add(value);
      // tabController = TabController(length: vitalsList.first.vsArray!.length + 1, vsync: vsync);
      // patientVsList.addAll(value.vsArray!.first.patientsVs!);
      isVitalLoading = false;
      notifyListeners();

      // if(vitalsList.first.bpArray != null){
      //   context.router.push( VitalsRoute(tabLength: vitalsList.first.vsArray!.length.toInt()+1));
      // }else{
      //   context.router.push( VitalsRoute(tabLength: vitalsList.first.vsArray!.length.toInt()));
      // }

    }).onError((error, stackTrace) {
      isVitalLoading = true;
      Messages.snackBar(context, error.toString());
    });
  }

  bool isReasonForVisitLoading = true;
  List<AllReasons> reasonForVisitList = [];

  getReasonForVisit(BuildContext context) async {
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

  List<SaveVitalModel> saveVitalList = [];
  bool isSaveVitalLoading = false;
  String vitalStatus = "Enter Data" ;

  setVitalStatus(String val){
    vitalStatus = val;
    notifyListeners();
  }
  
  saveVitals(BuildContext context, {required String vitalName, required String value})async{
    setVitalStatus("Please wait----");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(UserP.id);
    saveVitalList.clear();
    isSaveVitalLoading = true;
    notifyListeners();

    Map<String,dynamic> body = {
      "patient_id": "$id",
      "name": vitalName,
      "value": value,
      "desc": "",
      "color": "",
      "last_check_up_date": DateTime.now().toString(),
      "icon": "null",
      "units_id": "",
      "status_id": "",
    };
    await myRecordRepo.saveVital(body).then((value) {
      saveVitalList.add(value);
      setVitalStatus("$vitalName Added Successfully");
      // Messages.snackBar(context, "$vitalName Added Successfully");
      isSaveVitalLoading = false;
      Messages.flushBarMessage(context, "$vitalName Added Successfully", flushBarPosition: FlushbarPosition.TOP);

    }).onError((error, stackTrace) {
      setVitalStatus("Something went wrong please try again later");
      isSaveVitalLoading = true;
      Messages.flushBarMessage(context, error.toString(), flushBarPosition: FlushbarPosition.TOP);
    });
  }


  String getTime(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return DateFormat.jm().format(dateObject);
    } else {
      return "null";
    }
  }

  String getDate(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return "${dateObject.day}-${dateObject.month}-${dateObject.year}";
    } else {
      return "null";
    }
  }

  DateTime getDateTime(String? date){
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return dateObject;
    } else {
      return DateTime.now();
    }
  }
}
