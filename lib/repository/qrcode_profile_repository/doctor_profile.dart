
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../data/network/network_api_service.dart';
import '../../model/profile_qrcode/doctor_profile_model.dart';
import '../../resources/app_url.dart';

class ProfileRepo{
  BaseApiService apiService = NetworkApiService();



  Future<DoctorProfiles> getProfile(id)async{

    print("object");
    try{
      dynamic response = await apiService.getGetApiResponse("${AppUrls.drprofile}$id");
      print(response);
    return DoctorProfiles.fromJson(response);
    }catch (e){
      rethrow;
    }
  }



}