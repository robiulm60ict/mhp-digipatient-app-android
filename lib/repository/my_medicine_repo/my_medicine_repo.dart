import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/my_medicine_model/past_rx_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/my_medicine_model/current_rx_model.dart';
import '../../utils/user.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';


class MyMedicineRepo{

  BaseApiService apiService = NetworkApiService();




  Future<CurrentRxModel> getCurrentRX() async{

    final prefs =  await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);

    //TODO: Remove this print statement
    debugPrint("\n\n\n\n\n\n\n\n\n --------------------- User Id is = $id");

    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.currentRX}$id",);

      return CurrentRxModel.fromJson(response);

    }catch(e){

      rethrow;

    }
  }

  Future<PastRxModel> getPastRX() async{

    final prefs =  await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);


    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.pastRX}$id",);

      return PastRxModel.fromJson(response);

    }catch(e){

      rethrow;

    }
  }
}