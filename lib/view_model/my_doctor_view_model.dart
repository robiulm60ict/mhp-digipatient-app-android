import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:flutter/cupertino.dart';

class MyDoctorViewModel with ChangeNotifier{

  List<CategoryItemsModel> categoryItemsList = [
    CategoryItemsModel(title: "CARDIOLOGY", image: Assets.imagesHeart),
    CategoryItemsModel(title: "NEUROLOGY", image: Assets.imagesHeart),
    CategoryItemsModel(title: "DENTISTRY", image: Assets.imagesHeart),
    CategoryItemsModel(title: "ORTHOPEDICS", image: Assets.imagesHeart),
    CategoryItemsModel(title: "OPHTHALMOLOGY", image: Assets.imagesHeart),
    CategoryItemsModel(title: "PULMONOLOGIST", image: Assets.imagesHeart),
    CategoryItemsModel(title: "GASTROENTEROLOGY", image: Assets.imagesHeart),
    CategoryItemsModel(title: "UROLOGY", image: Assets.imagesHeart),
  ];
  categoryRouteTo(BuildContext context, int index){
    context.router.push(MyDoctorCategoryWiseRoute(categoryName: categoryItemsList[index].title));

  }
}

class CategoryItemsModel{
  String title;
  String image;
  CategoryItemsModel({required this.title, required this.image});
}