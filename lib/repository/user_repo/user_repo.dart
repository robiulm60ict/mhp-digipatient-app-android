import 'package:digi_patient/model/user_detail_model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../model/userprofile/userprofile_model.dart';
import '../../resources/app_url.dart';
import '../../utils/user.dart';

class UserRepo {
  BaseApiService apiService = NetworkApiService();

  Future<UserProfileModel> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);

    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.userProfileUrl}$id",
      );

      return UserProfileModel.fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<UserModel> editUserData() async {
    final prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    print(id);

    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.userUrl}$id",
      );

      return UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
