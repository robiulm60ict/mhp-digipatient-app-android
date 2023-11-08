
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routes.gr.dart';
import '../view/qrcode/qrcode_scnner.dart';
import 'doctor/my_doctor_view_model.dart';

class HomeViewModel with ChangeNotifier{

  List<HomeItemsModel> homeItemsList = [
    HomeItemsModel(title: "My Doctor", image: Assets.homeMyDoc),
    HomeItemsModel(title: "My Record", image:Assets.homeMyRec),
    HomeItemsModel(title: "My Appointments", image: Assets.homeAppointments),

    HomeItemsModel(title: "My Medicine", image: Assets.homeMyMedicine),
    HomeItemsModel(title: "My Family", image: Assets.homeMyFamily),
    HomeItemsModel(title: "My Lab", image: Assets.homeMyLab),
    HomeItemsModel(title: "Resources", image: Assets.homeResources),
    HomeItemsModel(title: "Payments", image: Assets.homePayments),
    HomeItemsModel(title: "Services", image: Assets.homeServices),
  //  HomeItemsModel(title: "My Qr  Doctor", image: Assets.homeMyDoc),

  ];


  homeItemsRouteTo(BuildContext context, int index){

    if(index == 0){
      context.router.push(const MyDoctorRoute());
    }else if(index == 1){
      context.router.push(const MyRecordRoute());
    }else if(index == 2){
      context.router.push(const DailyAndUpcommingRoute());

    }else if(index == 3){
      context.router.push(const MyMedicineRoute());

    }else if(index == 5){


    }else if(index == 9){

    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>QRCodeScanner()));
    }
  }

}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;
   HomeItemsModel({required this.title, required this.image});
}