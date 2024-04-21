import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/view/home_item_pages/my_doctor_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ClinicServiceViewModel with ChangeNotifier {
  List<HomeItemsModel> serviceItemsList = [
    HomeItemsModel(title: "Appointment", image: Assets.service_appoinment),
    HomeItemsModel(title: "Pathology", image: Assets.service_pathology),
    HomeItemsModel(title: "Radiology", image: Assets.service_radiology),
    HomeItemsModel(title: "Ambulance", image: Assets.service_ambulance),


  ];

  homeItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDoctorView()));
      //  context.router.push(const MyDoctorRoute());
    }
  }
}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;

  HomeItemsModel({required this.title, required this.image});
}
