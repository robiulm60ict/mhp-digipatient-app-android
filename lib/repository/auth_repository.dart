
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

import '../data/network/base_api_service.dart';

class AuthRepository{
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic body) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.loginApiEndPoint, body);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic body) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.singUpEndPoint, body);
      return response;
    }catch(e){
      throw e;
    }
  }
}