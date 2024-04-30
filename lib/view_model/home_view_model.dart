import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/view/home_item_pages/my_doctor_view.dart';
import 'package:digi_patient/view/my_medicine/my_medicine_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/daily_upcomming_appointment/daily_and_upcomming_appointments_view.dart';
import '../view/daily_upcomming_appointment/myclinic_appoinment_view.dart';
import '../view/home_item_pages/deperment_view.dart';
import '../view/home_item_pages/my_record_view.dart';
import '../view/myClinic/myclinic_view.dart';
import '../view/mypayment_view/mypayment_view.dart';
import '../view/qrcode/qrcode_scnner.dart';
import '../view/resources_view/resources_view.dart';
import '../view/tutrials/tutrials.dart';
import '../view/tutrials/tutrials_category.dart';
import '../view/upcamming/upcamming_view.dart';
import 'doctor/my_doctor_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeItemsModel> homeItemsList = [
    HomeItemsModel(title: "My Doctor", image: Assets.homeMyDoc),
    // HomeItemsModel(title: "My Records", image: Assets.homeMyRec),
    // HomeItemsModel(title: "My Appointments", image: Assets.homeAppointments),
    //
    // HomeItemsModel(title: "My Medicine", image: Assets.homeMyMedicine),
    HomeItemsModel(title: "My Clinic", image: Assets.myclinic),
    HomeItemsModel(title: "My Medicines", image: Assets.mymedicines),
    // HomeItemsModel(title: "My Lab", image: Assets.homeMyLab),
    // HomeItemsModel(title: "Resources", image: Assets.homeResources),
    // HomeItemsModel(title: "Payments", image: Assets.homePayments),
    // HomeItemsModel(title: "User Guidelines", image: Assets.homeServices),
    //  HomeItemsModel(title: "My Qr  Doctor", image: Assets.homeMyDoc),
  ]; List<HomeItemsModel> serviceItemsList = [
    HomeItemsModel(title: "Appointment with Doctors", image: Assets.homeMyDoc),
    HomeItemsModel(title: "Appointment at Clinic", image: Assets.homeMyRec),

  ];
  appoinmentcatagoryItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DailyAndUpcommingView()));
      //  context.router.push(const MyDoctorRoute());
    }

    else if (index == 1) {   Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyClinicAppoinmentView()));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyRecordView()));

    }
  }

  homeItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DepermentView()));
      //  context.router.push(const MyDoctorRoute());
    }

    else if (index == 1) {   Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyClinicView()));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyRecordView()));

    } else if (index == 2) {   Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyMedicineView()));
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => DailyAndUpcommingView()));
    } else if (index == 3) {

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyMedicineView()));
    } else if (index == 4) {

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyClinicView()));
    } else if (index == 5) {

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Upcamming()));
    } else if (index == 6) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResourcesView()));
    } else if (index == 7) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyPatientView()));
    } else if (index == 8) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TutrialsCategory()));
    }
  }
  List<String> imgList = [
    // 'assets/images/b1.jpg',
    'assets/images/b4.jpg',
    'assets/images/b2.jpg',
    'assets/images/b3.jpg'
  ];
}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;

  HomeItemsModel({required this.title, required this.image});
}
