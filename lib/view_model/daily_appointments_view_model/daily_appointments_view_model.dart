import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';

import '../../model/appointment_model/UpcommingAppointmentModel.dart';
import '../../model/appointment_model/todays_appointment_model.dart';
import '../../model/appointment_model/upcomming_appointments_model.dart';
import '../../model/notification/notification.dart';
import '../../repository/appointment_repo/appointment_repo.dart';

class DailyAndUpcommingViewModel with ChangeNotifier {
  List<NotificationModel> notificationFullList = [];
  List<TodaysAppointmentModel> todayAppointmentFullList = [];
  List<UpcommingAppointmentsModel> upcommingAppointmentFullList = [];

  List<NotoData> notificationList = [];
  List<TodaysPatientAppointment> todayAppointmentList = [];
  List<UpcomingAppointment> upcommingAppointmentList = [];

  AppointmentRepo appointmentRepo = AppointmentRepo();

  bool isTodayAppointmentLoading = true;
  bool isUpcommingAppointmentLoading = true;
  bool isNotificationAppointmentLoading = true;

  getNotification(BuildContext context) async {
    isNotificationAppointmentLoading = true;
    notificationFullList.clear();
    notificationList.clear();
    notifyListeners();
    notificationFullList.clear();
    await appointmentRepo.getNofification(context).then((value) {
      print(value);
      notificationFullList.add(value);
      notificationList.addAll(value.data!);
      isNotificationAppointmentLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(stackTrace);
      isNotificationAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }  putNofification(BuildContext context) async {
    isNotificationAppointmentLoading = true;
    notificationFullList.clear();
    notificationList.clear();
    notifyListeners();
    notificationFullList.clear();
    await appointmentRepo.putNofification(context).then((value) {
      print(value);
    getNotification(context);
      notifyListeners();
    }).onError((error, stackTrace) {
      print(stackTrace);
      isNotificationAppointmentLoading = true;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }
  getTodayAppointments(BuildContext context) async {
    isTodayAppointmentLoading = true;
    todayAppointmentFullList.clear();
    todayAppointmentList.clear();
    notifyListeners();
    todayAppointmentFullList.clear();
    await appointmentRepo.getTodayAppointment(context).then((value) {
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

  getAppoinmentsqueue(BuildContext context, docid, appoinmentid) async {
    // isTodayAppointmentLoading = true;
    // todayAppointmentFullList.clear();
    // todayAppointmentList.clear();
    // notifyListeners();
    // todayAppointmentFullList.clear();
    await appointmentRepo
        .getAppoinmentsqueue(docid, appoinmentid)
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

  getUpcommingAppointments(BuildContext context) async {
    isUpcommingAppointmentLoading = true;
    upcommingAppointmentFullList.clear();
    upcommingAppointmentList.clear();
    notifyListeners();
    await appointmentRepo.getUpcommingAppointment(context).then((value) {
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
}
