

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/assets.dart';
import '../../model/book_appointment_model/book_appointment_model.dart';
import '../../model/clinic/mydoctorlistbrance.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/doctor_model/doctors_model.dart';
import '../../model/invoice_model/invoice_show_model.dart';
import '../../model/online_model/online_model.dart';
import '../../model/social/social_model.dart';
import '../../repository/book_appointment/book_appointment_repo.dart';
import '../../repository/doctor_repository/doctor_repository.dart';
import '../../repository/invoice_repo/invoice_repo.dart';
import '../../repository/my_clinic_repository/clinic_repo_database.dart';
import '../../resources/colors.dart';
import '../../utils/datetime.dart';
import '../../utils/message.dart';
import '../../utils/popup_dialogue.dart';
import '../../utils/user.dart';
import '../../view/myClinic/myclinic_our_servic/appoinemtntdoctor/brance_single_invoice_view.dart';
import '../anatomy/anatomy_view_model.dart';
import '../push_notification/notification_service.dart';

class BranceAppointmentViewModel with ChangeNotifier {



  List<DoctorsModels> allDoctorList = [];

  DoctorRepository docRepo = DoctorRepository();
  final social = ClinicRepository();

  bool isDoctorLoading = true;
  bool issocialLoading = true;
  List<SocialListModel> sociallist = [];

  getSocialMediea(id,dbName,branceid) async {
    issocialLoading = true;
    sociallist.clear();
    social.getsocialmediea(id,dbName,branceid).then((value) {
      sociallist = value;
      // registerList.addAll(value.data as Iterable<Datum>);

      //  registerListfull.add(value as PaymentinboxRequestModel);

      issocialLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      issocialLoading = true;
      notifyListeners();
    });
  }
  var data ;
  getdoctorcountpatient(id,dbName,branceid) async {
    //issocialLoading = true;
    social.getdoctorpacatientcount(id,dbName,branceid).then((value) {
      data = value['data'];


      print("ddddddddddddddd${value['data']}");
      // print(value['data']);


      // issocialLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      issocialLoading = true;
      notifyListeners();
    });
  }


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
  List<DoctorChamberTimeModel> doctorTimeclnder = [];

  bool isDocChamberTimeLoading = true;
  List<DateTime> availableDates = [];

  getDocChamberTime(BuildContext context, date,databaseName,branceid, {required docId}) async {
    doctorTimeSlotList.clear();
    // availableDates.clear();
    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    notifyListeners();
    print(date);
    ClinicRepository().getDocChamberTime(docId, date,databaseName,branceid).then((value) {
      doctorTimeSlotList.addAll(value! as Iterable<DoctorChamberTimeModel>);
      // for (var i in value) {
      //   print(i.day);
      //   availableDates.add(DateTime(
      //       int.parse(i.year.toString()),
      //       int.parse(i.month.toString()),
      //       int.parse(i.day
      //           .toString()
      //           .split("/")
      //           .first))); // Use the day value from 'value'
      // }
      print(appointmentDate);
      isDocChamberTimeLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      print(stackTrace);
      isDocChamberTimeLoading = false;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  getDocChamberTimeCalender(BuildContext context, date,databaseName,branceid,
      {required docId}) async {
    // doctorTimeclnder.clear();
    print("apiccccccccccccccccccccccccccccccccccccccccccccccccccccdatabaseName$databaseName");
    availableDates.clear();
    notifyListeners();
    print(date);
    ClinicRepository().getDocChamberTime(docId, date,databaseName,branceid).then((value) {
      // doctorTimeclnder.addAll(value! as Iterable<DoctorChamberTimeModel>);
      for (var i in value) {
        print(i.day);
        availableDates.add(DateTime(
            int.parse(i.year.toString()),
            int.parse(i.month.toString()),
            int.parse(i.day
                .toString()
                .split("/")
                .first))); // Use the day value from 'value'
      }
      // print(appointmentDate);
      isDocChamberTimeLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDocChamberTimeLoading = false;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  DateTime? selectedDatee;

  // Future<void> selectDate(BuildContext context) async {
  //   final DateTime picked = await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Dialog(
  //         child: Container(
  //           height: 400,
  //           child: TableCalendar(
  //             focusedDay: DateTime.now(),
  //             calendarFormat: CalendarFormat.month,
  //             calendarStyle: const CalendarStyle(
  //                 selectedTextStyle: TextStyle(color: Colors.green)),
  //             onDayLongPressed: (selected, focusedDay) {
  //               print("selectedDate$selected");
  //               print("selectedDate$focusedDay");
  //               if (selected != null && selected != selectedDate) {
  //                 notifyListeners();
  //                 print("selectedDate${selectedDate}");
  //                 print("picked${selectedDate}");
  //                 selectedDate = selectedDate;
  //                 notifyListeners();
  //               }
  //             },
  //             firstDay: availableDates.first,
  //             lastDay: availableDates.last,
  //             selectedDayPredicate: (DateTime date) {
  //               return availableDates.any((availableDate) =>
  //                   date.year == availableDate.year &&
  //                   date.month == availableDate.month &&
  //                   date.day == availableDate.day);
  //             },
  //             onDaySelected: (selectedDay, focusedDay) {
  //               Navigator.of(context).pop(selectedDay);
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //
  //   if (picked != null && picked != selectedDate) {
  //     notifyListeners();
  //     print("selectedDate${selectedDate}");
  //     print("picked${picked}");
  //     selectedDate = picked;
  //     notifyListeners();
  //   }
  // }

  Future<void> selectDate(BuildContext context, docId,databaseName,branceid,) async {
    if (availableDates.isEmpty) {
      Messages.snackBar(context, "Doctor Schedule  not available!");
      // Handle the case when availableDates is empty.
      print("No available dates");
      return;
    }

    // DateTime initialDate = selectedDatee ?? DateTime.now();
    // print("Initial Date: $initialDate");

    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: availableDates.last.add(Duration(days: 0)),
      keyboardType: TextInputType.datetime,

      //barrierColor: Colors.green,
      anchorPoint: Offset(50.0, 100.0),
      selectableDayPredicate: (DateTime date) {
        return availableDates.any((availableDate) =>
        date.year == availableDate.year &&
            date.month == availableDate.month &&
            date.day == availableDate.day);
      },
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(

            dialogBackgroundColor: Colors.white,

            focusColor: Colors.purple,
            shadowColor: Colors.yellow,
            textTheme: TextTheme(
                bodyText1:TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                 fontSize: 20,
                 decorationColor: Colors.purple,
                ),
                // bodyText2: Style.alltext_default_balck_blodCalender
            ),
            highlightColor: Colors.red,
            primaryColor: Color(0xff128041),
            hintColor: Colors.blue, // Change accent color
            // Change color scheme

            colorScheme: ColorScheme.light(primary: Color(0xff128041),background: Colors.white,secondary: Colors.red), // Change color scheme
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent,highlightColor: Colors.red,),



          ),
          child: child!,
        );
      },


    );

    print("Picked Date: $picked");

    notifyListeners();
    if (picked != null && picked != selectedDatee) {
      selectedDatee = picked;

      getDocChamberTime(
        context,
        selectedDatee.toString().split(" ").first,databaseName,branceid,
        docId: docId,
      );

      print(appointmentDate.toString().split(" ").first);
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

  ClinicRepository bookAppointmentRepo = ClinicRepository();

  bookAppointmentbrance(BuildContext context,
      {required MhpDoctorsMaster doctor, required Map body ,
      String? DbName}) async {
    final anatomy = Provider.of<AnatomyModelView>(context, listen: false);
    print("aaaa$DbName");
    isBookAppointmentLoading = true;
    appointmentList.clear();
    notifyListeners();
    await bookAppointmentRepo.bookAppointment( body: body,DbName!).then((value) async {
      // appointmentList.add(value);
      if (value['transaction_no'].toString() ==
          "[The transaction no has already been taken.]") {
        // Messages.snackBar(context, value['transaction_no'].toString(), backgroundColor: Colors.red);
        Messages.snackBar(context, "The transaction no has already been taken.",
            backgroundColor: Colors.red);
      } else {
        print("ddddd$value");
        isBookAppointmentLoading = false;
        notifyListeners();

        branceinvoiceSuccessPopUp(
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
    await invoiceRepo.getInvoiceList(id.toString(),context).then((value) {
      invoiceList = value;
      setInvoiceLoading(false);
    }).onError((error, stackTrace) {
      setInvoiceLoading(true);
      print(stackTrace);
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
branceinvoiceSuccessPopUp(BuildContext context,
    {bool barrierDismissible = false,
      required String appointmentDate,
      required String doctorId,
      required String patientId,
      required String amount,
      required String paymentMethod,
      required String paymentnumber,
      required String appointmentType,
      required MhpDoctorsMaster doctor,
      required String trinscationNo,
      required String Shift,
      required invoice }) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useSafeArea: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        actionsPadding: EdgeInsets.only(bottom: 25.h),
        title: Lottie.asset(Assets.animationSuccessful, repeat: false),
        content: Text(
          'Payment Successful',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BranceSingleInvoiceView(
                        appointmentDate: appointmentDate,
                        doctorId: doctorId,
                        patientId: patientId,
                        amount: amount,
                        appointmentType: appointmentType,
                        doctor: doctor,
                        paymentMethod: paymentMethod,
                        trinscationNo: trinscationNo,
                        paymentnumber: paymentnumber,
                        invoicec: invoice, shift: Shift,
                      )));

              // context.router.push(SingleInvoiceRoute(appointmentDate: appointmentDate, doctorId: doctorId, patientId: patientId, amount: amount, appointmentType: appointmentType, doctor: doctor, paymentMethod: paymentMethod));
            },
            child: Text(
              'View Invoice',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}