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
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../model/online_model/online_model.dart';
import '../../repository/doctor_repository/doctor_repository.dart';
import '../../utils/user.dart';
import '../../view/payment/ivoice/pdf_invoice_api.dart';
import '../anatomy/anatomy_view_model.dart';
import '../push_notification/notification_service.dart';

class AppointmentViewModel with ChangeNotifier {
  DateTime appointmentDate = DateTime.now();
  var date = DateTime.now();

  String monthName = DateFormat('MMMM').format(DateTime.now());

  String year = DateTime.now().year.toString();

  List<WeekDayModel> weekDayList = [];

  var selected;
  String morningeveingButton = "";
  String isChamber = '';

  appoinmentmorningeveing(String val) {
    morningeveingButton = val;
    print(morningeveingButton);

    notifyListeners();
  }

  appoinmentchamber(String val) {
    isChamber = val;
    print(isChamber);

    notifyListeners();
  }
  setAppointmentDatee(BuildContext context,docid) async {
    selectedDate = await PickDateTime().pickDate(context,
        initialDate: appointmentDate);
    notifyListeners();

    if (selectedDate != null) {
      print("selectedDate$selectedDate");
      appointmentDate = selectedDate!;
      print("selectedDate$appointmentDate");

    getDocChamberTime(
        context,
        appointmentDate.toString().split(" ").first, docId: docid,
      );

      print(appointmentDate.toString().split(" ").first);
      notifyListeners();
    }
  }
  //
  // appoinmentonline() {
  //   isChamber = false;
  //   print(isChamber);
  //   notifyListeners();
  // }
  DateTime? selectedDate = DateTime.now();

  setAppointmentDate(BuildContext context) async {
    selectedDate =
        await PickDateTime().pickDate(context, initialDate: appointmentDate);
    notifyListeners();
    if (selectedDate != null) {
      appointmentDate = selectedDate!;
      print(selectedDate);



      notifyListeners();
    }
  }
  List<DoctorChamberTimeModel> doctorTimeSlotList = [];

  bool isDocChamberTimeLoading = true;

  getDocChamberTime(BuildContext context,date, {required docId}) async {
    doctorTimeSlotList.clear();
    DoctorRepository().getDocChamberTime(docId,date).then((value) {
      doctorTimeSlotList.addAll(value! as Iterable<DoctorChamberTimeModel>);
      isDocChamberTimeLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDocChamberTimeLoading = false;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
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
        selectedDate.subtract(Duration(days: appointmentDate.weekday + 1)));

    for (var i = 0; i < 7; i++) {
      DateTime date = startWeekDay.add(Duration(days: i));

      weekDayList.add(WeekDayModel(
          weekName: DateFormat("EEEE").format(date).substring(0, 1),
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
  NotificationService notificationService = NotificationService();

  List<BookAppointmentModel> appointmentList = [];
  bool isBookAppointmentLoading = false;

  BookAppointmentRepo bookAppointmentRepo = BookAppointmentRepo();

  bookAppointment(BuildContext context,
      {required Datum doctor, required Map body}) async {
    final anatomy = Provider.of<AnatomyModelView>(context, listen: false);
    print("aaaa");
    isBookAppointmentLoading = true;
    appointmentList.clear();
    notifyListeners();
    await bookAppointmentRepo.bookAppointment(body: body).then((value) async {

      // appointmentList.add(value);
      if(value['transaction_no'].toString()=="[The transaction no has already been taken.]"){
        // Messages.snackBar(context, value['transaction_no'].toString(), backgroundColor: Colors.red);
        Messages.snackBar(context, "The transaction no has already been taken.", backgroundColor: Colors.red);

      }else{
        print("ddddd$value");
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
          trinscationNo: body["transaction_no"],
          invoice: value['inovice_number'].toString(),
          paymentnumber: body["transaction_phone_number"],
          Shift: body["shift"],
         );
        print("${doctor.token!.deviceToke.toString()}");
        final Map dataa = {
          'to': "${doctor.token!.deviceToke.toString()}",
          'notification': {
            'title': 'Your Appointment Request',
            'body': "Please Check your Payment Inbox",
            // "image":
            //     "${visitorController.piketImagePath.value}",
            //"image": "https://proshort.ai/static/img/ps_logo.png",
            'sound': 'default',
            'badge': '1',
          },
          'priority': 'high',
          // 'data': {
          //   'type': 'chat',
          //   'id':
          //   'Asif Taj ffffffffffffff'
          // }
        };
        print(dataa);
        notificationService.sendPushNotification(dataa);
        anatomy.favourite.clear();
        // anatomy.symptomsList.removeLast();
        anatomy.getSymptomsList.clear();
         // anatomy.getSymptomsList.removeLast();
      }

    }).onError((error, stackTrace) {
      print(error);
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

  var online_amount = 0;

  selectOnline(int index) {
    for (var i = 0; i < onlineList.length; i++) {
      if (i == index) {
        //print(index);

        onlineList[i].isSelected = true;
        //onlineList.add( onlineList[i].amount.toDouble() as OnlineModel)  ;
        // print(onlineList);
        online_amount = onlineList[i].amount.toInt();
        print(online_amount);
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
      invoiceList = value;
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
