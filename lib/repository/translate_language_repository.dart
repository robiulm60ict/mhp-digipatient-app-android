
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

import '../data/network/base_api_service.dart';

class TranslateRepository{
  BaseApiService apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic body) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.googleTranslate, body);
      return response;
    }catch(e){
      rethrow;
    }
  }

}