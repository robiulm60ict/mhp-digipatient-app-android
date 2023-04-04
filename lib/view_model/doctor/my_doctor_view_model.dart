import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/repository/department_repo/department_repo.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:flutter/cupertino.dart';

import '../../model/department_model/department_model.dart';
import '../../model/doctor_model/doctors_model.dart';
import '../../repository/doctor_repository/doctor_repository.dart';
import '../../utils/message.dart';

class MyDoctorViewModel with ChangeNotifier{



  List<DoctorsModels> allDoctorList = [];

  DoctorRepository docRepo = DoctorRepository();

  bool isDoctorLoading = true;

  getAllDoctors(BuildContext context)async{

    allDoctorList.clear();

    isDoctorLoading = true;

    await DoctorRepository().getAllDoctors().then((value) {


      allDoctorList.add(value);

      isDoctorLoading = false;

    }).onError((error, stackTrace) {

      isDoctorLoading = true;

      debugPrint(error.toString());

      Messages.snackBar(context, error.toString(),);

    });

    notifyListeners();

  }

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
  // categoryRouteTo(BuildContext context, int index){
  //   context.router.push(MyDoctorCategoryWiseRoute(categoryName: categoryItemsList[index].title));
  //
  // }

  List<Doctors>? getDoctorsByType({required int departmentId}){

    return allDoctorList.first.doctors?.where((element) => element.department?.id == departmentId).toList();
  }

  /// Department Model

  List<DepartmentModel> departmentList = [];

  bool isDepartmentLoading = true;

  getDepartments(BuildContext context) async{

    departmentList.clear();

    await DepartmentRepository().getAllDepartment().then((value) {

      departmentList.add(value);

      isDepartmentLoading = false;

    }).onError((error, stackTrace) {

      isDepartmentLoading = true;

      Messages.snackBar(context, error.toString());
    });

    notifyListeners();
  }
}

class CategoryItemsModel{
  String title;
  String image;
  CategoryItemsModel({required this.title, required this.image});
}