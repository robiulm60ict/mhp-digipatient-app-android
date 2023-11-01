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

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<MyDoctorList> getmyAllDoctors() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.myDoctorslist}$id");
      print(response);

      return MyDoctorList.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DoctorsModels> getAllDoctors() async {
    try {
      dynamic response = await apiService.getGetApiResponse(AppUrls.allDoctors);

      print(response);

      return doctorsModelsFromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DoctorFeeModel> getDocFee(dynamic docId) async {
    try {
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.docFee}$docId");
      return DoctorFeeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DoctorChamberTimeModel> getDocChamberTime(dynamic docId) async {
    print(docId);
    try {
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.docChamberTime}$docId");
      print(response);
      return DoctorChamberTimeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
