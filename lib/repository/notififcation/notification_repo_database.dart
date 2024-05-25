import 'dart:convert';

import 'package:digi_patient/data/network/base_api_service_clinic.dart';
import 'package:digi_patient/data/network/network_api_service_clinic.dart';
import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/appointment_model/todays_appointment_model.dart';
import '../../model/appointment_model/upcomming_appointments_model.dart';
import '../../model/clinic/lab_request_data.dart';
import '../../model/clinic/mydoctorlistbrance.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../model/mypayment/mypaument_model.dart';
import '../../model/social/social_model.dart';
import '../../utils/user.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

class notificationRepository {
  BaseApiServiceClinic apiService = NetworkApiServiceClinic();

  Future<MyDoctorBrance> getmybrnceDoctors(contex,
      ) async {
    try {
      dynamic response = await apiService.getGetApiResponse(
          "${AppUrls.myDoctorslistclinic}",AppUrls.databasename);
      print(response);
      return MyDoctorBrance.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }



  bookAppointment(String DbName, {required body}) async {
    print(DbName);
    try {
      dynamic response = await apiService.getPostApiResponsehader(
          AppUrls.bookAppointment, body, DbName.toString());
      print("response$response");

      return response;
    } catch (e) {
      rethrow;
    }
  }

}