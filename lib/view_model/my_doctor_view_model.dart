import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/cupertino.dart';

class MyDoctorViewModel with ChangeNotifier{

  List<CategoryItemsModel> categoryItemsList = [
    CategoryItemsModel(title: "CARDIOLOGY", image: Assets.heart),
    CategoryItemsModel(title: "NEUROLOGY", image: Assets.heart),
    CategoryItemsModel(title: "DENTISTRY", image: Assets.heart),
    CategoryItemsModel(title: "ORTHOPEDICS", image: Assets.heart),
    CategoryItemsModel(title: "OPHTHALMOLOGY", image: Assets.heart),
    CategoryItemsModel(title: "PULMONOLOGIST", image: Assets.heart),
    CategoryItemsModel(title: "GASTROENTEROLOGY", image: Assets.heart),
    CategoryItemsModel(title: "UROLOGY", image: Assets.heart),
  ];
  categoryRouteTo(BuildContext context, int index){
    if(index == 0){
      // context.router.push(const MyDoctorRoute());
    }else if(index == 1){

    }
  }
}

class CategoryItemsModel{
  String title;
  String image;
  CategoryItemsModel({required this.title, required this.image});
}