
import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';

import '../../data/network/base_api_service.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';


class DoctorRepository{

  BaseApiService apiService = NetworkApiService();

  Future<DoctorsModels> getAllDoctors() async{

    try{

      dynamic response = await apiService.getGetApiResponse(AppUrls.allDoctors,);

      return DoctorsModels.fromJson(response);

    }catch(e){

      rethrow;

    }
  }

  Future<DoctorFeeModel> getDocFee(dynamic docId)async{

    try{
      dynamic response = await apiService.getGetApiResponse("${AppUrls.docFee}$docId");
      return DoctorFeeModel.fromJson(response);
    }catch (e){
      rethrow;
    }
  }

  Future<DoctorChamberTimeModel> getDocChamberTime(dynamic docId)async{
    try{
      dynamic response = await apiService.getGetApiResponse("${AppUrls.docChamberTime}$docId");
      return DoctorChamberTimeModel.fromJson(response);
    }catch (e){
      rethrow;
    }
  }
}