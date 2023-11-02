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
  List<MyDoctorList> myDoctorFullList = [];
  List<Datum> myDoctorList = [];
  DoctorRepository docRepo = DoctorRepository();
  TextEditingController controllerRequest = TextEditingController();

  bool isDoctorLoading = true;

  docotrRequest(BuildContext context, drId) async {
    isDoctorLoading = true;
    Map body = {"dr_identity_no": "${drId.toString()}"};

    await DoctorRepository().postdoctorRequest(body).then((value) {
      getmyAllDoctors(context);
      controllerRequest.clear();
      isDoctorLoading = false;
      Messages.snackBar(
        context,
        value['message'],
      );
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

  getmyAllDoctors(BuildContext context) async {
    myDoctorList.clear();
    myDoctorFullList.clear();

    isDoctorLoading = true;

    notifyListeners();
    await DoctorRepository().getmyAllDoctors().then((value) {
      myDoctorFullList.add(value);
      myDoctorList.addAll(value.data!);
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

// List<DocTimeSlots> doctorTimeSlotList = [];
//
// bool isDocChamberTimeLoading = true;
//
// getDocChamberTime(BuildContext context, {required dynamic docId}) async {
//   doctorTimeSlotList.clear();
//   isDocChamberTimeLoading = true;
//   notifyListeners();
//   DoctorRepository().getDocChamberTime(docId).then((value) {
//     doctorTimeSlotList.addAll(value.docTimeSlots!);
//     isDocChamberTimeLoading = false;
//     // debugPrint("-------------------------------------------\n\n\n\n\n");
//     // debugPrint(doctorTimeSlotList.length.toString());
//     notifyListeners();
//   }).onError((error, stackTrace) {
//     isDocChamberTimeLoading = true;
//     notifyListeners();
//     Messages.snackBar(context, error.toString());
//   });
// }
//
// String getTime(String? date) {
//   DateTime? dateObject = DateTime.tryParse(date ?? "");
//
//   if (dateObject != null) {
//     return DateFormat.jm().format(dateObject);
//   } else {
//     return "null";
//   }
// }
//
// List<DoctorFeeModel> docFeeList = [];
//
// getDoctorFee(dynamic id) async {
//   docFeeList.clear();
//   debugPrint(" id is = $id");
//   await DoctorRepository().getDocFee(id).then((value) {
//     docFeeList.add(value);
//   }).onError((error, stackTrace) {
//     debugPrint(error.toString());
//   });
// }
//
//
//
//
// List<Doctor>? getDoctorsByType({required num departmentId}) {
//   return allDoctorList.first.doctors
//       ?.where((element) => element.department?.id == departmentId)
//       .toList();
// }

  /// Department Model

// List<DepartmentModel> departmentList = [];
//
// bool isDepartmentLoading = true;
//
// getDepartments(BuildContext context) async {
//   departmentList.clear();
//
//   await DepartmentRepository().getAllDepartment().then((value) {
//     departmentList.add(value);
//
//     isDepartmentLoading = false;
//   }).onError((error, stackTrace) {
//     isDepartmentLoading = true;
//
//     Messages.snackBar(context, error.toString());
//   });
//
//   notifyListeners();
// }
}
