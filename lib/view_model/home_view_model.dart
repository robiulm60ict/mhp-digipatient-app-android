
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/cupertino.dart';

import '../routes/routes.gr.dart';

class HomeViewModel with ChangeNotifier{

  List<HomeItemsModel> homeItemsList = [
    HomeItemsModel(title: "My Doctor", image: Assets.homeMyDoc),
    HomeItemsModel(title: "My Record", image:Assets.homeMyRec),
    HomeItemsModel(title: "My Lab", image: Assets.homeMyLab),
    HomeItemsModel(title: "My Medicine", image: Assets.homeMyMedicine),
    HomeItemsModel(title: "My Family", image: Assets.homeMyFamily),
    HomeItemsModel(title: "Appointments", image: Assets.homeAppointments),
    HomeItemsModel(title: "Resources", image: Assets.homeResources),
    HomeItemsModel(title: "Payments", image: Assets.homePayments),
    HomeItemsModel(title: "Services", image: Assets.homeServices),
  ];


  homeItemsRouteTo(BuildContext context, int index){
    if(index == 0){
      context.router.push(const MyDoctorRoute());
    }else if(index == 1){
      context.router.push(const MyRecordRoute());
    }else if(index == 2){

    }else if(index == 3){
      context.router.push(const MyMedicineRoute());

    }else if(index == 5){
      context.router.push(const DailyAndUpcommingRoute());

    }
  }

}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;
   HomeItemsModel({required this.title, required this.image});
}