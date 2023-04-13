import 'package:digi_patient/model/anatomy/anatomy_symptoms.dart';

import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../resources/app_url.dart';

class AnatomyRepo{

  BaseApiService apiService = NetworkApiService();

  Future<AnatomySymptoms> getAnatomySymptoms() async{

    try{
      dynamic response = await apiService.getGetApiResponse(AppUrls.anatomySymptoms,);
      return AnatomySymptoms.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}