import 'package:digi_patient/view/resources_view/medical_education_view/medical_education_view.dart';
import 'package:digi_patient/view/resources_view/patient_education_view/patient_education_category_view.dart';
import 'package:digi_patient/view/resources_view/resources_view/news_resources_view.dart';
import 'package:digi_patient/view/resources_view/webinars_view/webinar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../model/resources/medical_education_model.dart';
import '../../model/resources/news_resoures.dart';
import '../../model/resources/patient_education/patient_education_catagory.dart';
import '../../model/resources/patient_education/patient_education_resources.dart';
import '../../model/resources/patient_education/patient_education_subcatagory.dart';
import '../../model/resources/webviners_model.dart';
import '../../repository/resources_repo/resoures.dart';
import '../../view/resources_view/resources_view.dart';

class ResourcesViewModel with ChangeNotifier {
  final resouresRepo = ResouresRepo();

  List<MedicalEducationModel> medicalEducationList = [];
  List<WebBinerModel> webList = [];
  List<NewsModel> newsList = [];
  List<PatientEducationCatagory> patientCatagoryList = [];
  List<PatientEducationSubCatagory> patientsubCatagoryList = [];
  List<PatientEducationResources> patientresourcesList = [];

  bool isMedicalLoading = true;
  bool isNewsLoading = true;
  bool isWebLoading = true;

  bool isCatagoryLoading = true;
  bool issubCatagoryLoading = true;
  bool iseducationResouresLoading = true;

  getmedicalResouresData() async {
    isMedicalLoading = true;
    medicalEducationList.clear();
    notifyListeners();
    resouresRepo.getmedicalResoures().then((value) {
      medicalEducationList = value;

      isMedicalLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isMedicalLoading = true;
      notifyListeners();
    });
  }
  getwebResouresData() async {
    isWebLoading = true;
    webList.clear();
    notifyListeners();
    resouresRepo.getwebinarsResoures().then((value) {
      webList = value;

      isWebLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isWebLoading = true;
      notifyListeners();
    });
  }
  getnewsResouresData() async {
    isNewsLoading = true;
    newsList.clear();
    notifyListeners();
    resouresRepo.getnewsResoures().then((value) {
      newsList = value;

      isNewsLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isNewsLoading = true;
      notifyListeners();
    });
  }
  getcatagoryResouresData() async {
    isCatagoryLoading = true;
    patientCatagoryList.clear();
    notifyListeners();
    resouresRepo.getpatientEducationCatagoryResoures().then((value) {
      patientCatagoryList = value;

      isCatagoryLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      isCatagoryLoading = true;
      notifyListeners();
    });
  }
  getsubcatagoryResouresData(catagoryid) async {
    issubCatagoryLoading = true;
    patientsubCatagoryList.clear();
    notifyListeners();
    resouresRepo.getpatientEducationSubCatagoryResoures(catagoryid).then((value) {
      patientsubCatagoryList = value;

      issubCatagoryLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      issubCatagoryLoading = true;
      notifyListeners();
    });
  }
  getpatienteducationResouresData(subcatagoryId) async {
    iseducationResouresLoading = true;
    patientresourcesList.clear();
    notifyListeners();
    resouresRepo.getpatientEducationSResoures(subcatagoryId).then((value) {
      patientresourcesList = value;

      iseducationResouresLoading = false;
      notifyListeners();
    }).onError((error, stackTrace) {
      iseducationResouresLoading = true;
      notifyListeners();
    });
  }

  homeItemsRouteTo(BuildContext context, int index) {
    // if (index == 0) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>MedicalEducationView()));
    //
    //   //   Navigator.pushNamed(context, RoutesName.medicalEducationView);
    // }
    //
    // else

      if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientEducationView()));

      //   Navigator.pushNamed(context, RoutesName.patientEducationView);
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebinarView()));

      // Navigator.pushNamed(context, RoutesName.webinarView);
    } else if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>EducationResourceView()));

      //   Navigator.pushNamed(context, RoutesName.educationResourceView);
    }
  }

  List<ResourcesImageItemsModel> resourseImageItemsList = [
    // ResourcesImageItemsModel(
    //     title: "Medical Education", image: Assets.homeMyRec),
    ResourcesImageItemsModel(
        title: "Patient Education ", image: Assets.res),
    ResourcesImageItemsModel(
        title: "Webinars ", image: Assets.res),
    ResourcesImageItemsModel(
        title: "News", image: Assets.res),
  ];
}

//TODO: Replace this model with real model
class ResourcesItemsModel {
  String title;

  ResourcesItemsModel({required this.title});
}

class ResourcesImageItemsModel {
  String title;
  String image;

  ResourcesImageItemsModel({required this.title, required this.image});
}
