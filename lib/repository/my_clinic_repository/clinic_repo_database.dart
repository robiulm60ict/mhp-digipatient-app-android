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

class ClinicRepository {
  BaseApiServiceClinic apiService = NetworkApiServiceClinic();

  Future<MyDoctorBrance> getmybrnceDoctors(contex, DatabaseName,
      brancid) async {
    try {
      print(DatabaseName);
      dynamic response = await apiService.getGetApiResponse(
          "${AppUrls.myDoctorslistclinic}$brancid", DatabaseName);
      print(response);
      return MyDoctorBrance.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<DoctorChamberTimeModel>> getDocChamberTime(docId, date,
      DatabaseName, branceid) async {
    try {
      print(
          "ddddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffff$date");
      print(
          "ddddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffff$branceid");
      print(
          "ddddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffff$DatabaseName");
      print(
          "ddddddddddddddddddddddddddffffffffffffffffffffffffffffffffffffff$docId");
      dynamic response = await apiService.getGetApiResponse(
          "${AppUrls.docChamberTime}$docId/$branceid/$date", DatabaseName);
      print("response${response}");
      print("docId${docId}");
      print("docId$DatabaseName");
      print("docId$branceid");
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

  bookTest(String DbName, {required body}) async {
    print(DbName);
    try {
      dynamic response = await apiService.getPostApiResponsehader(
          AppUrls.lab_request, body, DbName.toString());
      print("response$response");

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future getdoctorpacatientcount(doctorid, dbName, branceid) async {
    try {
      dynamic response = await apiService.getGetApiResponse(
          "${AppUrls.doctorcountpatient}$doctorid/$branceid", dbName);

      print("eeeeeeeeeee$response");
      return response;
    } catch (e) {
      print("fffffffffffffffff$e");

      rethrow;
    }
  }

  Future<List<SocialListModel>> getsocialmediea(id, dbName, branceid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.socialacount}$id/$branceid",
        dbName,
      );


      print("response$response");
      print("id$id");
      print("dbName$dbName");
      print("branceid$branceid");

      List<SocialListModel> datalist = [];
      for (var i in response['data']) {
        datalist.add(SocialListModel.fromJson(i));
      }
      return datalist;
    } catch (e) {
      print("fffffffffffffffff$e");

      print(e.toString());
      rethrow;
    }
  }

  Future getAppoinmentsqueue(docid, appoinmentid, DbName, branceid) async {
    try {
      dynamic response = await apiService.getGetApiResponse(
          "${AppUrls.Appoinmentsqueue}/$docid/$appoinmentid", DbName);
      // print(response);
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<TodaysAppointmentModel> getTodayAppointment(contex, DbName,
      branceid,id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.todayAppointments}$id/$branceid", contex, DbName);
      print(response);
      return TodaysAppointmentModel.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<UpcommingAppointmentsModel> getUpcommingAppointment(context, DbName,
      branceid,id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.upcommingAppointments}$id/$branceid", context, DbName);
      print("fffffffffffffffffffff${response}");
      return UpcommingAppointmentsModel.fromJson(response);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Future<List<MyPaymentModel>>
  getmypayment(contex, DbName) async {
    print(DbName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(UserP.hnnumber);
    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.mypayment}$id", contex, DbName
      );

      print(response);
      List<MyPaymentModel> alldata = [];
      for (var i in response) {
        alldata.add(MyPaymentModel.fromJson(i));
      }
      return alldata;
    } catch (e) {
      rethrow;
    }
  } Future<List<MyLabRequestDataList>>
  getlabdata(contex,String branceid, DbName) async {
    print(DbName);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponsecontext(
          "${AppUrls.mylab}$id/$branceid", contex, DbName
      );

      print(response);
      List<MyLabRequestDataList> alldata = [];
      for (var i in response['data']) {
        alldata.add(MyLabRequestDataList.fromJson(i));
      }
      return alldata;
    } catch (e) {
      rethrow;
    }
  }
}