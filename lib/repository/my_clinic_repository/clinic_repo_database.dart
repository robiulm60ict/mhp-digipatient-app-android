import 'dart:convert';

import 'package:digi_patient/data/network/base_api_service_clinic.dart';
import 'package:digi_patient/data/network/network_api_service_clinic.dart';
import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../utils/user.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

class ClinicRepository {
  BaseApiServiceClinic apiService = NetworkApiServiceClinic();



  Future<MyDoctorList> getmybrnceDoctors(contex,DatabaseName) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? id = prefs.getInt(UserP.id);
      dynamic response =
      await apiService.getGetApiResponsecontext("${AppUrls.myDoctorslist}$id",contex,DatabaseName);
      print(response);
      return MyDoctorList.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<DoctorChamberTimeModel>> getDocChamberTime(docId, date,DatabaseName) async {
    try {
      dynamic response = await apiService
          .getGetApiResponse("${AppUrls.docChamberTime}$docId/$date",DatabaseName);
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
