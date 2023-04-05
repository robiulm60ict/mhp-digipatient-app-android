
import 'package:digi_patient/model/auth_model/login_model.dart';

import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

import '../data/network/base_api_service.dart';

class AuthRepository{
  BaseApiService apiService = NetworkApiService();

  Future<LoginModel> loginApi(dynamic body) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.login, body);
      return LoginModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic body) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.singUpEndPoint, body);
      return response;
    }catch(e){
      rethrow;
    }
  }
}