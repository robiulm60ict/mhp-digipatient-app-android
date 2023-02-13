
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/cupertino.dart';

import '../routes/routes.gr.dart';

class HomeViewModel with ChangeNotifier{

  List<HomeItemsModel> homeItemsList = [
    HomeItemsModel(title: "My Doctor", image: Assets.myDoctor),
    HomeItemsModel(title: "My Record", image: Assets.myDoctor),
    HomeItemsModel(title: "My Lab", image: Assets.myDoctor),
    HomeItemsModel(title: "My Medicine", image: Assets.myDoctor),
    HomeItemsModel(title: "My Family", image: Assets.myDoctor),
    HomeItemsModel(title: "Appointments", image: Assets.myDoctor),
    HomeItemsModel(title: "Resources", image: Assets.myDoctor),
    HomeItemsModel(title: "Payments", image: Assets.myDoctor),
    HomeItemsModel(title: "Services", image: Assets.myDoctor),
  ];


  homeItemsRouteTo(BuildContext context, int index){
    if(index == 0){
      context.router.push(const MyDoctorRoute());
    }else if(index == 1){

    }
  }

}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;
   HomeItemsModel({required this.title, required this.image});
}