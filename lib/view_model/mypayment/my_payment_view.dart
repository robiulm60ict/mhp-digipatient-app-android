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
import '../../model/mypayment/mypaument_model.dart';
import '../../repository/doctor_repository/doctor_repository.dart';
import '../../repository/mypayment/mypayment_repo.dart';
import '../../utils/message.dart';

class MyPaymentViewModel with ChangeNotifier {
  List<MyPaymentModel> mypayment = [];
  final myRepo = MyPaymentRepo();

  bool isDoctorLoading = true;


  getmypayment(BuildContext context) async {
    mypayment.clear();

    isDoctorLoading = true;

    notifyListeners();
    await myRepo.getmypayment().then((value) {
      mypayment=value;

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


}
