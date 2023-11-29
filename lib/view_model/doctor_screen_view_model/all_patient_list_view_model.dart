import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/repository/doctor_screen_repo/patient_list_repo.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/doctor_screen_model/patient_list_model.dart';
import '../../routes/routes.gr.dart';

class DoctorScreenViewModel extends ChangeNotifier{

  List<PatientListModel> allPatientList = [];

  PatientListRepo patientListRepo = PatientListRepo();

  bool isAllPatientListLoading = false;

  setAllPatientLoading(bool v){
    isAllPatientListLoading = v;
    notifyListeners();
  }
  getAllPatientList(BuildContext context)async{
    setAllPatientLoading(true);
    await patientListRepo.getAllPatients().then((value) {
      allPatientList.clear();
      allPatientList.add(value);
      setAllPatientLoading(false);
      // context.router.replace(const DoctorHomeRoute());

    }).onError((error, stackTrace) {
      setAllPatientLoading(true);
      debugPrint("Error: ${error.toString()}");
      Messages.snackBar(context, error.toString());
    });
  }

  saveDocFcm()async{
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(UserP.fcmToken).toString();

    Map<String, String> body = {
      'token' : token
    };

    final String docId = prefs.getInt(UserP.id).toString();
    patientListRepo.saveDocFCMToken(docId: docId, body: body);
  }

  savePtnFcm()async{
    final prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString(UserP.fcmToken).toString();
    Map<String, String> body = {
      'token' : token
    };

    final String ptnId = prefs.getInt(UserP.id).toString();
    patientListRepo.savePtnFCMToken(ptnId: ptnId, body: body);
  }

  saveTokenLocally(String token)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(UserP.fcmToken, token);
  }
}