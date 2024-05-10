import 'dart:convert';

import 'package:digi_patient/data/network/base_api_service.dart';
import 'package:digi_patient/data/network/network_api_service.dart';
import 'package:digi_patient/model/appointment_model/upcomming_appointments_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/appointment_model/todays_appointment_model.dart';
import '../../model/clinic/orgamozationlist_model.dart';
import '../../model/clinic/patientid_brance.dart';

class MyClinicRepo {
  BaseApiService apiService = NetworkApiService();

  Future postclinicRequest(body) async {
    try {
      dynamic response = await apiService.getPostApiResponse(
          AppUrls.serach_organization, body);

      print("eeeeeeeeeee$response");
      print("eeeeeeeeeee$body");

      return response['message'];
    } catch (e) {
      print("${e.toString()}");
      rethrow;
    }
  }  Future deactiveclinice(id,states) async {
    try {
      dynamic response = await apiService.getGetApiResponse(
         "${ AppUrls.deactive_organization}$id/$states", );

      print("eeeeeeeeeee$response");

      return response['message'];
    } catch (e) {
      print("${e.toString()}");
      rethrow;
    }
  }

  Future copypateitnpostclinicRequest(body) async {
    try {
      dynamic response = await apiService.getPostApiResponse(
          AppUrls.copy_patient_to_database, body);

      print("eeeeeeeeeee${response}");
      print("eeeeeeeeeee$body");

      return response['message'];
    } catch (e) {
      print("${e.toString()}");
      rethrow;
    }
  }

  Future<PatientBranceIdModel> pateitnIdGETpostclinicRequest(body) async {
    try {
      dynamic response = await apiService.getPostApiResponse(
          AppUrls.get_patient_details_from_organization, body);

      // Convert the map to a JSON string
      String jsonString = json.encode(response);

      print("Response: $jsonString");
      print("Body: $body");

      // Parse the JSON string
      return patientBranceIdModelFromJson(jsonString);
    } catch (e) {
      print("Error: ${e.toString()}");
      rethrow;
    }
  }


  Future<List<OrganizationListModle>> getoriganization(contex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.organization}$id", contex);

      print(response);
      List<OrganizationListModle> alldata = [];
      for (var i in response['data']) {
        alldata.add(OrganizationListModle.fromJson(i));
      }
      return alldata;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future<List<OrganizationListModle>> getoriganizationdeactive(contex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.deactiveorganization}$id", contex);

      print(response);
      List<OrganizationListModle> alldata = [];
      for (var i in response['data']) {
        alldata.add(OrganizationListModle.fromJson(i));
      }
      return alldata;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future active(contex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.deactiveorganization}$id", contex);

      print(response);
      List<OrganizationListModle> alldata = [];
      for (var i in response['data']) {
        alldata.add(OrganizationListModle.fromJson(i));
      }
      return alldata;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
