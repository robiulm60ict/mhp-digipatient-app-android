import 'package:digi_patient/model/user_detail_model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../model/userprofile/userprofile_model.dart';
import '../../resources/app_url.dart';
import '../../resources/send_image.dart';
import '../../utils/user.dart';

class UserRepo {
  BaseApiService apiService = NetworkApiService();

  Future<UserProfileModel> getUserData(contex) async {
    final prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);

    try {
      dynamic response = await apiService.getGetApiResponsecontext(
        "${AppUrls.userProfileUrl}$id",contex,
      );
      print(response);
      return UserProfileModel.fromJson(response);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  signUpApiUpdate(
      {required Map<String, String> body, required imageBytes}) async {
    SendImage sendImage = SendImage();
    try {
      dynamic response = await sendImage.update(body, imageBytes);
      //   await apiService.getPostApiResponse(AppUrls.registration, body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future editUserData(body) async {
    final prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    print(id);
    try {
      dynamic response = await apiService.getPostApiResponse(
          "${AppUrls.userUrlUpdate}$id", body);

      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
