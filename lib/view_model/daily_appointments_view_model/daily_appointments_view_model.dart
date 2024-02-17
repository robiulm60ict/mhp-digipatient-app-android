import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';

import '../../model/appointment_model/UpcommingAppointmentModel.dart';
import '../../model/appointment_model/todays_appointment_model.dart';
import '../../model/appointment_model/upcomming_appointments_model.dart';
import '../../repository/appointment_repo/appointment_repo.dart';

class DailyAndUpcommingViewModel with ChangeNotifier{

  List<TodaysAppointmentModel> todayAppointmentFullList = [];
  List<UpcommingAppointmentsModel> upcommingAppointmentFullList = [];

  List<TodaysPatientAppointment> todayAppointmentList = [];
  List<UpcomingAppointment> upcommingAppointmentList = [];

  AppointmentRepo appointmentRepo = AppointmentRepo();

  bool isTodayAppointmentLoading = true;
  bool isUpcommingAppointmentLoading = true;

  getTodayAppointments(BuildContext context)async{
    isTodayAppointmentLoading = true;
    todayAppointmentFullList.clear();
    todayAppointmentList.clear();
    notifyListeners();
    todayAppointmentFullList.clear();
    await appointmentRepo.getTodayAppointment().then((value) {
      todayAppointmentFullList.add(value);
      todayAppointmentList.addAll(value.todaysPatientAppointments!);
      isTodayAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isTodayAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  getAppoinmentsqueue(BuildContext context,docid,appoinmentid)async{
    // isTodayAppointmentLoading = true;
    // todayAppointmentFullList.clear();
    // todayAppointmentList.clear();
    // notifyListeners();
    // todayAppointmentFullList.clear();
    await appointmentRepo.getAppoinmentsqueue(docid,appoinmentid).then((value) {
      print(value);
      // todayAppointmentFullList.add(value);
      // todayAppointmentList.addAll(value.todaysPatientAppointments!);
      isTodayAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isTodayAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  getUpcommingAppointments(BuildContext context)async{
    isUpcommingAppointmentLoading = true;
    upcommingAppointmentFullList.clear();
    upcommingAppointmentList.clear();
    notifyListeners();
    await appointmentRepo.getUpcommingAppointment().then((value) {
      upcommingAppointmentFullList.add(value);
      upcommingAppointmentList.addAll(value.upcomingAppointments!);
      isUpcommingAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isUpcommingAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

}