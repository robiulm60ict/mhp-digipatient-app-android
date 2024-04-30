import 'dart:convert';

import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../utils/user.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

class DoctorRepository {
  BaseApiService apiService = NetworkApiService();

  Future postdoctorRequest(body) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response = await apiService.getPostApiResponse(
          "${AppUrls.doctorrequest}${id.toString()}", body);

      //   print("$response");

      return response;
    } catch (e) {
      print("${e.toString()}");
      rethrow;
    }
  }

  Future<MyDoctorList> getmyAllActiveDoctors(contex,derpermentId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response =
          await apiService.getGetApiResponsecontext("${AppUrls.myDoctorslist}$id/$derpermentId",contex);
      print(response);
      return MyDoctorList.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }  Future<MyDoctorList> getmyAllDeactiveDoctors(contex) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response =
          await apiService.getGetApiResponsecontext("${AppUrls.myDoctorsDeactivelist}$id",contex);
      print("rrrrrrrrrrrrrrrrrrr${response}");
      return MyDoctorList.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future activedoctor(doctorid) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.activedoctor}$id/$doctorid");
      print(response);
      return MyDoctorList.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }  Future deactivedoctor(doctorid) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.deactivedoctor}$id/$doctorid");
      print(response);
      return MyDoctorList.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Future<DoctorsModels> getAllDoctors() async {
  //   try {
  //     dynamic response = await apiService.getGetApiResponse(AppUrls.allDoctors);
  //
  //
  //     return doctorsModelsFromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<DoctorFeeModel> getDocFee(dynamic docId) async {
    try {
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.docFee}$docId");
      return DoctorFeeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DoctorChamberTimeModel>> getDocChamberTime(docId, date) async {
    try {
      dynamic response = await apiService
          .getGetApiResponse("${AppUrls.docChamberTime}$docId/null/$date");
      print("response${response}");
      print("docId${docId}");
      print("date${date}");
      List<DoctorChamberTimeModel> alldata = [];
      for (var i in response['data']) {
        alldata.add(DoctorChamberTimeModel.fromJson(i));
      }
      return alldata;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
