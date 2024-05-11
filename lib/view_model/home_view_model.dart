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
import '../view/mypayment_view/myclinic_payment_view.dart';
import '../view/mypayment_view/mypayment_view.dart';
import '../view/qrcode/qrcode_scnner.dart';
import '../view/resources_view/resources_view.dart';
import '../view/tutrials/tutrials.dart';
import '../view/tutrials/tutrials_category.dart';
import '../view/upcamming/upcamming_view.dart';
import 'doctor/my_doctor_view_model.dart';

class HomeViewModel with ChangeNotifier {
  List<HomeItemsModelData> homeItemsList = [
    HomeItemsModelData(title: "My Doctor", image: Assets.homeMyDoc, des: "Find your own doctor from app",),
    // HomeItemsModel(title: "My Records", image: Assets.homeMyRec),
    // HomeItemsModel(title: "My Appointments", image: Assets.homeAppointments),
    //
    // HomeItemsModel(title: "My Medicine", image: Assets.homeMyMedicine),
    HomeItemsModelData(title: "My Clinic", image: Assets.myclinic, des: "Find your own clinics from app",),
    HomeItemsModelData(title: "My Medicines", image: Assets.mymedicines, des: "Find your own medicines from app",),
    // HomeItemsModel(title: "My Lab", image: Assets.homeMyLab),
    // HomeItemsModel(title: "Resources", image: Assets.homeResources),
    // HomeItemsModel(title: "Payments", image: Assets.homePayments),
    // HomeItemsModel(title: "User Guidelines", image: Assets.homeServices),
    //  HomeItemsModel(title: "My Qr  Doctor", image: Assets.homeMyDoc),
  ]; List<HomeItemsModel> serviceItemsList = [
    HomeItemsModel(title: "Appointment with Doctors", image: Assets.homeMyDoc),
    HomeItemsModel(title: "Appointment at Clinic", image: Assets.homeMyRec),

  ];

  List<HomeItemsModel> serviceItemsListpayment = [
    HomeItemsModel(title: "Appointment with Doctors", image: Assets.homePayments),
    HomeItemsModel(title: "Appointment at Clinic", image: Assets.homeServices),

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
  paymentcatagoryItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyPatientView()));
      //  context.router.push(const MyDoctorRoute());
    }

    else if (index == 1) {   Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyClinicPaymentView()));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => MyRecordView()));

    }
  }

  homeItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDoctorView()));
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
class HomeItemsModelData {
  String title;
  String des;
  String image;

  HomeItemsModelData({required this.title,required this.des, required this.image});
}

class HomeItemsModel {
  String title;
  String image;

  HomeItemsModel({required this.title, required this.image});
}
