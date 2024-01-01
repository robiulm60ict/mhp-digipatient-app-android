import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/doctor_model/doctor_chember_time_model.dart';
import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/repository/department_repo/department_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/department_model/department_model.dart';
import '../../model/doctor_model/doctors_model.dart';
import '../../model/social/social_model.dart';
import '../../repository/doctor_repository/doctor_repository.dart';
import '../../repository/social_repo/social_repo.dart';
import '../../utils/message.dart';

class MyDoctorViewModel with ChangeNotifier {
  List<DoctorsModels> allDoctorList = [];

  DoctorRepository docRepo = DoctorRepository();
  final social = SocialRepo();

  bool isDoctorLoading = true;
  bool issocialLoading = true;
  List<SocialListModel> sociallist = [];

  getSocialMediea(id) async {
    issocialLoading = true;
    sociallist.clear();
    social.getsocialmediea(id).then((value) {
      sociallist = value;
      // registerList.addAll(value.data as Iterable<Datum>);

      //  registerListfull.add(value as PaymentinboxRequestModel);

      issocialLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      issocialLoading = true;
      notifyListeners();
    });
  }
  var data ;
  getdoctorcountpatient(id) async {
    //issocialLoading = true;
    social.getdoctorpacatientcount(id).then((value) {
      data = value['data'];


       print("ddddddddddddddd${value['data']}");
      // print(value['data']);


     // issocialLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      issocialLoading = true;
      notifyListeners();
    });
  }
  getAllDoctors(BuildContext context) async {
    allDoctorList.clear();

    isDoctorLoading = true;
    notifyListeners();
    await DoctorRepository().getAllDoctors().then((value) {

      allDoctorList.add(value);


      isDoctorLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDoctorLoading = true;

      debugPrint(error.toString());

      Messages.snackBar(
        context,
        error.toString(),
      );
      notifyListeners();
    });


  }

  List<DoctorChamberTimeModel> doctorTimeSlotList = [];

  bool isDocChamberTimeLoading = true;

  getDocChamberTime(BuildContext context, {required docId}) async {
    doctorTimeSlotList.clear();
    DoctorRepository().getDocChamberTime(docId).then((value) {
      doctorTimeSlotList.addAll(value! as Iterable<DoctorChamberTimeModel>);
      isDocChamberTimeLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isDocChamberTimeLoading = false;
      notifyListeners();
      Messages.snackBar(context, error.toString());
    });
  }

  String getTime(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");

    if (dateObject != null) {
      return DateFormat.jm().format(dateObject);
    } else {
      return "null";
    }
  }

  // List<DoctorFeeModel> docFeeList = [];
  //
  // getDoctorFee(dynamic id) async {
  //   docFeeList.clear();
  //   debugPrint(" id is = $id");
  //   await DoctorRepository().getDocFee(id).then((value) {
  //     docFeeList.add(value);
  //   }).onError((error, stackTrace) {
  //     debugPrint(error.toString());
  //   });
 // }

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

  List<Doctor>? getDoctorsByType({required num departmentId}) {
    return allDoctorList.first.doctors
        ?.where((element) => element.department?.id == departmentId)
        .toList();
  }

  /// Department Model

  List<DepartmentModel> departmentList = [];

  bool isDepartmentLoading = true;

  // getDepartments(BuildContext context) async {
  //   departmentList.clear();
  //
  //   await DepartmentRepository().getAllDepartment().then((value) {
  //     departmentList.add(value);
  //
  //     isDepartmentLoading = false;
  //   }).onError((error, stackTrace) {
  //     isDepartmentLoading = true;
  //
  //     Messages.snackBar(context, error.toString());
  //   });
  //
  //   notifyListeners();
  // }
}

class CategoryItemsModel {
  String title;
  String image;

  CategoryItemsModel({required this.title, required this.image});
}
