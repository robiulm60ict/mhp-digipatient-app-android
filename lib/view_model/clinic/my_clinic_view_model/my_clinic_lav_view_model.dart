import 'package:digi_patient/dashboard.dart';
import 'package:digi_patient/view/bottom_navigation_buttons/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/clinic/lab_request_data.dart';
import '../../../model/clinic/orgamozationlist_model.dart';
import '../../../model/mypayment/mypaument_model.dart';
import '../../../repository/my_clinic_repository/clinic_repo_database.dart';
import '../../../repository/my_clinic_repository/my_Clinic_repo.dart';
import '../../../utils/message.dart';
import '../../../utils/user.dart';

class MyClinicLabViewModel with ChangeNotifier {
  final myRepo = ClinicRepository();
  TextEditingController controllerRequest = TextEditingController();
  TextEditingController payNumberRequest = TextEditingController();
  TextEditingController trnsctionIdRequest = TextEditingController();
  TextEditingController referNameRequest = TextEditingController();

  bookTest(BuildContext context, body, DbName) async {
    print(body);
    await myRepo.bookTest(DbName, body: body).then((value) {
      print(value);
      print("postclinicRequest");

      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardView()));
      controllerRequest.clear();

      // if (value['message'].toString() == "Successfully store data") {
        Messages.snackBar(context, value['message'].toString(),
            backgroundColor: Colors.green);
      //
      // } else {
      //   Messages.snackBar(context, value['message'].toString());
      // }

      notifyListeners();
    }).onError((error, stackTrace) {
      print("ddddddddddddd$error");
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    });

    notifyListeners();
  }

  List<MyLabRequestDataList> mypayment = [];

  bool isLabLoading = false;

  getlab(BuildContext context,brid, DBName) async {
    mypayment.clear();

    isLabLoading = true;

    notifyListeners();
    await myRepo.getlabdata(context,brid, DBName).then((value) {
      mypayment = value;

      print(value);
      isLabLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isLabLoading = true;
      debugPrint(error.toString());
      print(stackTrace);

      Messages.snackBar(
        context,
        error.toString(),
      );
    });

    notifyListeners();
  }
}
