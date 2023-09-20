import 'package:digi_patient/repository/doctor_screen_repo/patient_list_repo.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';

import '../../model/doctor_screen_model/patient_list_model.dart';

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
    }).onError((error, stackTrace) {
      setAllPatientLoading(true);
      Messages.snackBar(context, error.toString());
    });
  }
}