import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/view/home_item_pages/my_doctor_view.dart';
import 'package:digi_patient/view/my_medicine/my_medicine_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/daily_upcomming_appointment/daily_and_upcomming_appointments_view.dart';
import '../view/home_item_pages/my_record_view.dart';
import '../view/mypayment_view/mypayment_view.dart';
import '../view/qrcode/qrcode_scnner.dart';
import '../view/resources_view/resources_view.dart';
import '../view/tutrials/tutrials.dart';
import '../view/tutrials/tutrials_category.dart';
import 'doctor/my_doctor_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeItemsModel> homeItemsList = [
    HomeItemsModel(title: "My Doctor", image: Assets.homeMyDoc),
    HomeItemsModel(title: "My Records", image: Assets.homeMyRec),
    HomeItemsModel(title: "My Appointments", image: Assets.homeAppointments),

    HomeItemsModel(title: "My Medicine", image: Assets.homeMyMedicine),
    HomeItemsModel(title: "My Family", image: Assets.homeMyFamily),
    HomeItemsModel(title: "My Lab", image: Assets.homeMyLab),
    HomeItemsModel(title: "Resources", image: Assets.homeResources),
    HomeItemsModel(title: "Payments", image: Assets.homePayments),
    HomeItemsModel(title: "Tutorials", image: Assets.homeServices),
    //  HomeItemsModel(title: "My Qr  Doctor", image: Assets.homeMyDoc),
  ];

  homeItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDoctorView()));
      //  context.router.push(const MyDoctorRoute());
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyRecordView()));
      //   context.router.push(const MyRecordRoute());
    } else if (index == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DailyAndUpcommingView()));
    } else if (index == 3) {
      //  context.router.push(const MyMedicineRoute());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyMedicineView()));
    }else if (index == 6) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ResourcesView()));

    } else if (index == 7) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyPatientView()));
    } else if (index == 8) {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>const TutrialsCategory()));
    }
  }
}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;

  HomeItemsModel({required this.title, required this.image});
}
