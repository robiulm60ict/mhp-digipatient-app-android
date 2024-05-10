import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../model/appointment_model/todays_appointment_model.dart';
import '../../../model/appointment_model/upcomming_appointments_model.dart';
import '../../../model/clinic/mydoctorlistbrance.dart';
import '../../../model/mypayment/mypaument_model.dart';
import '../../../repository/my_clinic_repository/clinic_repo_database.dart';
import '../../../utils/message.dart';

class MyClinicDoctorViewModel with ChangeNotifier {
  ClinicRepository docRepo = ClinicRepository();
  TextEditingController controllerRequest = TextEditingController();

  bool isDoctorLoading = true;

  List<MyDoctorBrance> myDoctorFullList = [];

  // List<Datum> myDoctorList = [];
  List<Datum> mydepermentList = [];

  getmyAllDoctors(BuildContext context, DatabaseName, brancid) async {
    mydepermentList.clear();
    myDoctorFullList.clear();

    isDoctorLoading = true;
    print("databasena");
    notifyListeners();
    await docRepo
        .getmybrnceDoctors(context, DatabaseName, brancid)
        .then((value) {
      myDoctorFullList.add(value);
      mydepermentList.addAll(value.data!);
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

  List<TodaysAppointmentModel> todayAppointmentFullList = [];
  List<UpcommingAppointmentsModel> upcommingAppointmentFullList = [];

  List<TodaysPatientAppointment> todayAppointmentList = [];
  List<UpcomingAppointment> upcommingAppointmentList = [];

  bool isTodayAppointmentLoading = true;
  bool isUpcommingAppointmentLoading = true;

  getTodayAppointments(BuildContext context, DbName,branceid,id) async {
    isTodayAppointmentLoading = true;
    todayAppointmentFullList.clear();
    todayAppointmentList.clear();
    notifyListeners();
    todayAppointmentFullList.clear();
    await docRepo.getTodayAppointment(context, DbName,branceid,id).then((value) {
      todayAppointmentFullList.add(value);
      todayAppointmentList.addAll(value.todaysPatientAppointments!);
      isTodayAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(stackTrace);
      isTodayAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  getAppoinmentsqueue(BuildContext context, docid, appoinmentid, DbName,branceid) async {
    // isTodayAppointmentLoading = true;
    // todayAppointmentFullList.clear();
    // todayAppointmentList.clear();
    // notifyListeners();
    // todayAppointmentFullList.clear();
    await docRepo
        .getAppoinmentsqueue(docid, appoinmentid, DbName,branceid)
        .then((value) {
      print(value);
      // todayAppointmentFullList.add(value);
      // todayAppointmentList.addAll(value.todaysPatientAppointments!);
      isTodayAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(stackTrace);

      isTodayAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  getUpcommingAppointments(BuildContext context, DbName,branceid,id) async {
    isUpcommingAppointmentLoading = true;
    upcommingAppointmentFullList.clear();
    upcommingAppointmentList.clear();
    notifyListeners();
    await docRepo.getUpcommingAppointment(context, DbName,branceid,id).then((value) {
      upcommingAppointmentFullList.add(value);
      upcommingAppointmentList.addAll(value.upcomingAppointments!);
      isUpcommingAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(stackTrace);

      isUpcommingAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  List<MyPaymentModel> mypayment = [];



  getmypayment(BuildContext context,DBName) async {
    mypayment.clear();

    isDoctorLoading = true;

    notifyListeners();
    await docRepo.getmypayment(context,DBName).then((value) {
      mypayment=value;

      print(value);
      isDoctorLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;
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
