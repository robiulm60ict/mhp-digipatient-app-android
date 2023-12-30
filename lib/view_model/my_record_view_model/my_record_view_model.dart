import 'package:another_flushbar/flushbar.dart';
import 'package:digi_patient/model/my_record_model/add_medical_history_model.dart';
import 'package:digi_patient/model/my_record_model/diagnosis_procedure_model.dart';
import 'package:digi_patient/model/my_record_model/procedure_mHFGD_model.dart';
import 'package:digi_patient/model/my_record_model/reason_for_visit_model.dart';
import 'package:digi_patient/model/my_record_model/save_vital_model.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view/my_record/vital_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/my_record_model/medical_history_from_great_doc_model.dart';
import '../../repository/my_record_repo/my_record_repo.dart';
import '../../utils/user.dart';
import '../../view/my_record/add_medical_history_view.dart';
import '../../view/my_record/my_medical_history_view.dart';

class MyRecordViewModel with ChangeNotifier {
  List<MedicalHistoryFromGreatDocModel> medicalHistoryFromGreatDocList = [];
  List<PastHistory> medicalHistoryFromGreatDocPastList = [];
  bool showPastHistory=true;

  past(){
    notifyListeners();
    showPastHistory=true;
    print(showPastHistory);
    notifyListeners();

  }
  procedure(){
    notifyListeners();
    showPastHistory=false;

    notifyListeners();
  }
  bool isMedicalHistoryFromGreatDocLoading = true;
  MyRecordRepo myRecordRepo = MyRecordRepo();
  double bmiResult = 0.0;

  void calculateBMI(bmiw,bmih) {

    double weight = double.tryParse(bmiw.text) ?? 0.0;
    double height = double.tryParse(bmih.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      bmiResult = double.parse(bmi.toStringAsFixed(2));
      print(bmiResult);


      print("bmiResultvvvvvvvvvvvvvvvvvvvvv${bmiResult}");
      notifyListeners();
    } else {
      // Handle invalid input

      print("eeeeeeeeeeeeeeeeeeee${bmiResult}");
      bmiResult = 0.0;
      notifyListeners();
    }

  }
  getMedicalHistoryFromGreatDoc(BuildContext context) async {
    // medicalHistoryFromGreatDocList.clear();
    medicalHistoryFromGreatDocPastList.clear();
    isMedicalHistoryFromGreatDocLoading = true;
    notifyListeners();
    await myRecordRepo.getMedicalHistoryFromGreatDoc().then((value) {
      // medicalHistoryFromGreatDocList.add(value);
      medicalHistoryFromGreatDocPastList.addAll(value.pastHistory!);
      isMedicalHistoryFromGreatDocLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isMedicalHistoryFromGreatDocLoading = true;
      Messages.snackBar(context, error.toString());
    });
  }

  List<AllProcedure> procedureList = [];
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

  getVitals(
    BuildContext context,
  ) async {
    isVitalLoading = true;
    vitalsList.clear();
    patientVsList.clear();
    notifyListeners();

    myRecordRepo.getVitals().then((value) {
      vitalsList.add(value);
      // tabController = TabController(length: vitalsList.first.vsArray!.length + 1, vsync: vsync);
       patientVsList.addAll(value.vsArray!.first.patientsVs!);
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
  List<AllReason> reasonForVisitList = [];

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
  String vitalStatus = "Enter Data";

  setVitalStatus(String val) {
    vitalStatus = val;
    notifyListeners();
  }

  saveVitals(BuildContext context,
      {required String vitalName,
      required String icon,
      required String value,
      required String unitId,
      required String color}) async {
    setVitalStatus("Please wait----");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(UserP.id);
    saveVitalList.clear();
    isSaveVitalLoading = true;
    notifyListeners();

    Map<String, dynamic> body = {
      "patient_id": "$id",
      // "doctor_id": "1",
      "name": vitalName,
      "value": value,
      "desc": "",
      "color": color,
      "last_check_up_date": DateTime.now().toString(),
      "icon": icon,
      "units_id": unitId,
      "status_id": "1",
    };
    await myRecordRepo.saveVital(body).then((value) {
      saveVitalList.add(value);
      setVitalStatus("$vitalName Added Successfully");
      // Messages.snackBar(context, "$vitalName Added Successfully");
      isSaveVitalLoading = false;
     // getVitals(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VitalsView()));
      Messages.flushBarMessage(context, "$vitalName Added Successfully",
          flushBarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.green);
    }).onError((error, stackTrace) {
      debugPrint("Error: \n\n\n\n\n\n$error");
      setVitalStatus("Something went wrong please try again later");
      isSaveVitalLoading = true;
      Messages.flushBarMessage(context, error.toString(),
          flushBarPosition: FlushbarPosition.TOP);
    });
  }

  List<AddMedicalHistoryModel> addMedicalHistoryList = [];
  bool isAddMedicalHistoryLoading = false;

  setAddMedicalHistoryLoading(bool val) {
    isAddMedicalHistoryLoading = val;
    notifyListeners();
  }

  bool isDiagnosisLoading = true;
  String diagnosisStatus = "";
  List<Data> diagnosisList = [];

  setDiagnosisLoadingAndStatus(bool val, String status) {
    isDiagnosisLoading = val;
    diagnosisStatus = status;
    notifyListeners();
  }

  Future<List<Data>> getDiagnosisList(BuildContext context) async {
    List<Data>? data = await myRecordRepo
        .getDiagnosisProcedure()
        .then((value) => value.data)
        .onError((error, stackTrace) =>
            Messages.snackBar(context, error.toString()));
    return data ?? <Data>[];
  }

  getDiagnosis() async {
    diagnosisList.clear();
    setDiagnosisLoadingAndStatus(true, "Loading...");
    await myRecordRepo.getDiagnosisProcedure().then((value) {
      // diagnosisList.add(value.data);
      diagnosisList = value.data!;
      setDiagnosisLoadingAndStatus(false, "Successful");
    }).onError((error, stackTrace) {
      setDiagnosisLoadingAndStatus(true, error.toString());
    });
  }

  addMedicalHistory(BuildContext context, dynamic body) async {
    addMedicalHistoryList.clear();
    setAddMedicalHistoryLoading(true);
    medicalHistoryFromGreatDocPastList.clear();

    notifyListeners();

    myRecordRepo.addMedicalHistory(body).then((value) {
      addMedicalHistoryList.add(value);
      Messages.snackBar(context, "Medical History Added Successfully",
          backgroundColor: Colors.green);
      medicalHistoryFromGreatDocPastList.clear();
      setAddMedicalHistoryLoading(false);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => AddMedicalHistoryView()));
      getMedicalHistoryFromGreatDoc(context);
      notifyListeners();
    }).onError((error, stackTrace) {
      Messages.snackBar(context, error.toString());
      setAddMedicalHistoryLoading(false);
    });
  }

  String getTime(String? date, BuildContext context) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");

    if (dateObject != null) {
      TimeOfDay timeOfDay = TimeOfDay.fromDateTime(dateObject);

      // return DateFormat.jm().format(dateObject);
      // return DateFormat("h:mm a").format(dateObject);
      return timeOfDay.format(context);
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

  DateTime getDateTime(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return dateObject;
    } else {
      return DateTime.now();
    }
  }
}
