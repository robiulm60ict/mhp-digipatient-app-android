import 'package:digi_patient/model/book_appointment_model/book_appointment_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/invoice_model/invoice_show_model.dart';
import 'package:digi_patient/repository/book_appointment/book_appointment_repo.dart';
import 'package:digi_patient/repository/invoice_repo/invoice_repo.dart';
import 'package:digi_patient/utils/datetime.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/utils/popup_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../model/online_model/online_model.dart';
import '../../utils/user.dart';

class AppointmentViewModel with ChangeNotifier {
  DateTime appointmentDate = DateTime.now();

  String monthName = DateFormat('MMMM').format(DateTime.now());

  String year = DateTime.now().year.toString();

  List<WeekDayModel> weekDayList = [];

  setAppointmentDate(BuildContext context) async {
    DateTime? selectedDate =
        await PickDateTime().pickDate(context, initialDate: appointmentDate);

    if (selectedDate != null) {
      appointmentDate = selectedDate;

      DateTime startWeekDay = getDate(appointmentDate
          .subtract(Duration(days: appointmentDate.weekday - 1)));

      // startWeekDay = startWeekDay.subtract(const Duration(days: 2));

      weekDayList.clear();

      for (var i = 0; i < 7; i++) {
        DateTime date = startWeekDay.add(Duration(days: i));
        weekDayList.add(WeekDayModel(
            weekName: DateFormat("EEEE").format(date).substring(0, 3),
            isSelected: isSameDate(date1: date, date2: selectedDate),
            dateTime: date,
            day: date.day));
      }

      monthName = DateFormat('MMMM').format(appointmentDate);

      year = appointmentDate.year.toString();

      notifyListeners();
    }
  }

  bool isSameDate({required DateTime date1, required DateTime date2}) {
    if (date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day) {
      return true;
    } else {
      return false;
    }
  }

  setWeekDays() {
    weekDayList.clear();
    notifyListeners();
    DateTime selectedDate = DateTime.now();
    DateTime startWeekDay = getDate(
        selectedDate.subtract(Duration(days: appointmentDate.weekday - 7)));

    for (var i = 0; i < 7; i++) {
      DateTime date = startWeekDay.add(Duration(days: i));

      weekDayList.add(WeekDayModel(
          weekName: DateFormat("EEEE").format(date).substring(0, 3),
          isSelected: isSameDate(date1: date, date2: selectedDate),
          dateTime: date,
          day: date.day));
      // debugPrint("Date: ${date.toString()} week day: ${weekDayList[i].dateTime.toString()} is Selected: ${weekDayList[i].isSelected}-- is same date: ${date.isAtSameMomentAs(DateTime.now())}");
    }
    monthName = DateFormat('MMMM').format(appointmentDate);

    year = appointmentDate.year.toString();

    notifyListeners();
  }

  int? patientId;

  // int? docId;
  // String appointmentType = 'Chamber';
  // String paymentType = 'cash';
  // String? transactionNo;

  Future<int?> getPatientId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    patientId = prefs.getInt(UserP.id);
    notifyListeners();
    return patientId;
  }

  /// book appointment

  List<BookAppointmentModel> appointmentList = [];
  bool isBookAppointmentLoading = false;

  BookAppointmentRepo bookAppointmentRepo = BookAppointmentRepo();

  bookAppointment(BuildContext context,
      {required Datum doctor, required Map body}) async {
    isBookAppointmentLoading = true;
    appointmentList.clear();
    notifyListeners();
    await bookAppointmentRepo.bookAppointment(body: body).then((value) {
      appointmentList.add(value);
      //Messages.snackBar(context, "Appointment Successful", backgroundColor: Colors.green);
      isBookAppointmentLoading = false;
      notifyListeners();
      invoiceSuccessPopUp(
        context,
        appointmentDate: body["date"],
        amount: body["amount"],
        doctorId: body["doctor_id"],
        appointmentType: body["appointment_type"],
        doctor: doctor,
        patientId: body["patient_id"],
        paymentMethod: body["payment_type"],
      );
    }).onError((error, stackTrace) {
      Messages.snackBar(context, error.toString());
      isBookAppointmentLoading = true;
      notifyListeners();
    });
  }

  Map<String, dynamic> body = {};

  setBody({
    required String docIcd,
    required String patientId,
    required String date,
    required String appointmentType,
    required String disease,
    required String paymentType,
    required String amount,
    required String trNxNo,
  }) async {
    body = {
      "doctor_id": docIcd,
      "patient_id": patientId,
      "date": date,
      "appointment_type": appointmentType,
      "disease": disease,
      "payment_type": paymentType,
      "amount": amount,
      "transaction_no": trNxNo,
    };
    notifyListeners();
  }

  selectButton(int index) {
    for (var i = 0; i < weekDayList.length; i++) {
      if (i == index) {
        weekDayList[index].isSelected = true;
        appointmentDate = weekDayList[index].dateTime;
        notifyListeners();
      } else {
        weekDayList[i].isSelected = false;
      }
    }
    notifyListeners();
  }

  List<OnlineModel> onlineList = [
    OnlineModel(
        title: "Voice Call",
        subTitle: "Can you make voice call",
        amount: 150.00,
        iconData: Icons.call),
    OnlineModel(
        title: "Video Call",
        subTitle: "Can you make video call",
        amount: 1500.00,
        iconData: Icons.video_call),
    OnlineModel(
        title: "Messaging",
        subTitle: "Can messaging with Doctor",
        amount: 100.00,
        iconData: Icons.message),
  ];

  selectOnline(int index) {
    for (var i = 0; i < onlineList.length; i++) {
      if (i == index) {
        onlineList[i].isSelected = true;
      } else {
        onlineList[i].isSelected = false;
      }

      notifyListeners();
    }
  }

  InvoiceRepo invoiceRepo = InvoiceRepo();
  List<InvoiceShowModel> invoiceList = [];
  bool isInvoiceLoading = true;

  setInvoiceLoading(bool val) {
    isInvoiceLoading = val;
    notifyListeners();
  }

  getInvoiceList(BuildContext context) async {
    invoiceList.clear();
    setInvoiceLoading(true);
    final id = await getPatientId();
    await invoiceRepo.getInvoiceList(id.toString()).then((value) {
      invoiceList.add(value);
      setInvoiceLoading(false);
    }).onError((error, stackTrace) {
      setInvoiceLoading(true);
      debugPrint("\n\n\n\n\n\n\n\n\n Error: $error");
      Messages.snackBar(context, error.toString());
    });
  }
}

DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

class WeekDayModel {
  String weekName;
  DateTime dateTime;
  bool isSelected;
  int day;

  WeekDayModel(
      {required this.weekName,
      this.isSelected = false,
      required this.dateTime,
      required this.day});
}
