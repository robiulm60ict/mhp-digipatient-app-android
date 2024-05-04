import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/doctor_model/doctor_chember_time_model.dart';
import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/repository/department_repo/department_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/department_model/department_model.dart';
import '../../model/doctor_model/doctors_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../repository/doctor_repository/doctor_repository.dart';
import '../../utils/message.dart';

class MyDoctorDelaisViewModel with ChangeNotifier {
  DoctorRepository docRepo = DoctorRepository();
  TextEditingController controllerRequest = TextEditingController();

  bool isDoctorLoading = true;

  docotrRequest(BuildContext context, drId) async {
    isDoctorLoading = true;
    Map body = {"dr_identity_no": "DC-${drId.toString()}"};

    await DoctorRepository().postdoctorRequest(body).then((value) {
      print(value);
      controllerRequest.clear();
      if (value['message'].toString() == "Successfully store data") {
        Messages.snackBar(context, value['message'].toString(),
            backgroundColor: Colors.green);
        // getmyAllDoctors(context);
      } else {
        Messages.snackBar(context, value['message'].toString());
      }

      isDoctorLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;

      debugPrint(error.toString());
    });

    notifyListeners();
  }

  List<MyDoctorList> myDoctorFullList = [];
  List<Datum> myDoctorList = [];

  getmyAllDoctors(BuildContext context) async {
    myDoctorList.clear();
    myDoctorFullList.clear();

    isDoctorLoading = true;

    notifyListeners();
    await DoctorRepository().getmyAllActiveDoctors(context).then((value) {
      myDoctorFullList.add(value);
      myDoctorList.addAll(value.data!);
      print(myDoctorList.length);
      isDoctorLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;
      print(stackTrace);

      debugPrint(error.toString());

      Messages.snackBar(
        context,
        error.toString(),
      );
    });

    notifyListeners();
  }

  List<MyDoctorList> myDoctordeactiveFullList = [];
  List<Datum> myDoctordeactiveList = [];

  getmyAllDeactiveDoctors(BuildContext context) async {
    myDoctordeactiveList.clear();
    myDoctordeactiveFullList.clear();

    isDoctorLoading = true;

    notifyListeners();
    await DoctorRepository().getmyAllDeactiveDoctors(context).then((value) {
      print("rerrrrrrrrrrrrrrrr$value");
      myDoctordeactiveFullList.add(value);
      myDoctordeactiveList.addAll(value.data!);
      isDoctorLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;

      debugPrint(error.toString());

      Messages.snackBar(
        context,
        error.toString(),
      );
    });

    notifyListeners();
  }

  deactiveDoctors(BuildContext context, doctorid) async {
    isDoctorLoading = true;

    notifyListeners();
    await DoctorRepository().deactivedoctor(doctorid).then((value) {
      // getmyAllDoctors(context);
      getmyAllDeactiveDoctors(context);
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;
    });

    notifyListeners();
  }

  activedoctor(BuildContext context, doctorid) async {
    isDoctorLoading = true;

    notifyListeners();
    await DoctorRepository().activedoctor(doctorid).then((value) {
      // getmyAllDoctors(context);
      getmyAllDeactiveDoctors(context);
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;
    });

    notifyListeners();
  }
}
