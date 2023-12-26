import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/my_medicine_model/past_rx_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/my_medicine_model/current_rx_model.dart';
import '../../model/my_medicine_model/my_report_model.dart';
import '../../model/my_medicine_model/prescription_image_list.dart';
import '../../utils/user.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';


class MyMedicineRepo{

  BaseApiService apiService = NetworkApiService();

  Future<List<MyReportImageModel>> getmyreport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.getmyreportimage}$id"
      );
   //   print("data..................${response.toString()}");
      List<MyReportImageModel> datalist = [];
      for (var i in response['data']) {
        datalist.add(MyReportImageModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future<List<PreccriptionListModel>> getprescriptionImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.uploadRXimage}$id",
      );
      print("data..................${response.toString()}");
      List<PreccriptionListModel> datalist = [];
      for (var i in response['0']) {
        datalist.add(PreccriptionListModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<CurrentRxModel>> getCurrentRX() async{

    final prefs =  await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);

    //TODO: Remove this print statement
    debugPrint("\n\n\n\n\n\n\n\n\n --------------------- User Id is = $id");

    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.currentRX}$id",);

      List<CurrentRxModel> datalist = [];
      for (var i in response['drugs']) {
        datalist.add(CurrentRxModel.fromJson(i));
      }
      return datalist;

    }catch(e){

      rethrow;

    }
  }

  Future<List<PastRxModel>> getPastRX() async{

    final prefs =  await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);


    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.pastRX}$id",);

      List<PastRxModel> datalist = [];
      for (var i in response['drugs']) {
        datalist.add(PastRxModel.fromJson(i));
      }
      return datalist;

    }catch(e){

      rethrow;

    }
  }


}