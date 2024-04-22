import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/view/home_item_pages/my_doctor_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view/myClinic/myclinic_our_servic/appoinemtntdoctor/my_doctor_view.dart';
import '../../view/myClinic/myclinic_our_servic/pathology/pathology_view_add_test.dart';

class ClinicServiceViewModel with ChangeNotifier {
  List<HomeItemsModel> serviceItemsList = [
    HomeItemsModel(title: "Appointment", image: Assets.service_appoinment),
    HomeItemsModel(title: "Pathology", image: Assets.service_pathology),
    HomeItemsModel(title: "Radiology", image: Assets.service_radiology),
    HomeItemsModel(title: "Ambulance", image: Assets.service_ambulance),
  ];

  homeItemsRouteTo(BuildContext context, int index) {
    if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ClinicBranchDoctorView()));
    } else if (index == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PathologyAddTest()));
    }
  }
}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;

  HomeItemsModel({required this.title, required this.image});
}

class TestItemsModel {
  String title;
  String price;

  TestItemsModel({required this.title, required this.price});
}
