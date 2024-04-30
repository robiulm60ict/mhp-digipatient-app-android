import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';

import '../../model/social/social_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

class SocialRepo {
  BaseApiService apiService = NetworkApiService();




  Future<List<SocialListModel>> getsocialmediea(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      dynamic response =
          await apiService.getGetApiResponse("${AppUrls.socialacount}$id/null");

      //
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
  Future getdoctorpacatientcount(doctorid) async {

    try {
      dynamic response =
      await apiService.getGetApiResponse("${AppUrls.doctorcountpatient}$doctorid/null");


      print("eeeeeeeeeee$response");
      return response;
    } catch (e) {
      print("eeeeeeeeeeeddd$e");

      rethrow;
    }
  }
}
