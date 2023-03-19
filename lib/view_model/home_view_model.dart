
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/cupertino.dart';

import '../routes/routes.gr.dart';

class HomeViewModel with ChangeNotifier{

  List<HomeItemsModel> homeItemsList = [
    HomeItemsModel(title: "My Doctor", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "My Record", image:Assets.imagesMyDoctor),
    HomeItemsModel(title: "My Lab", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "My Medicine", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "My Family", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "Appointments", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "Resources", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "Payments", image: Assets.imagesMyDoctor),
    HomeItemsModel(title: "Services", image: Assets.imagesMyDoctor),
  ];


  homeItemsRouteTo(BuildContext context, int index){
    if(index == 0){
      context.router.push(const MyDoctorRoute());
    }else if(index == 1){
      context.router.push(const MyRecordRoute());
    }else if(index == 2){

    }
  }

}

//TODO: Replace this model with real model
class HomeItemsModel {
  String title;
  String image;
   HomeItemsModel({required this.title, required this.image});
}