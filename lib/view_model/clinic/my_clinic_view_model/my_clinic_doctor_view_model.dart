import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/clinic/mydoctorlistbrance.dart';
import '../../../repository/my_clinic_repository/clinic_repo_database.dart';
import '../../../utils/message.dart';

class MyClinicDoctorViewModel with ChangeNotifier {
  ClinicRepository docRepo = ClinicRepository();
  TextEditingController controllerRequest = TextEditingController();

  bool isDoctorLoading = true;

  List<MyDoctorBrance> myDoctorFullList = [];
  List<Datum> myDoctorList = [];

  getmyAllDoctors(BuildContext context, DatabaseName,brancid) async {
    myDoctorList.clear();
    myDoctorFullList.clear();

    isDoctorLoading = true;
print("databasena");
    notifyListeners();
    await docRepo.getmybrnceDoctors(context, DatabaseName,brancid).then((value) {
      myDoctorFullList.add(value);
      myDoctorList.addAll(value.data!);
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
}
