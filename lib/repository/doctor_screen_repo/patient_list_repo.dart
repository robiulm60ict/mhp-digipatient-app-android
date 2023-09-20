import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/doctor_screen_model/patient_list_model.dart';

import '../../data/network/base_api_service.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';


class PatientListRepo{

  BaseApiService apiService = NetworkApiService();

  Future<PatientListModel> getAllPatients() async{

    try{

      dynamic response = await apiService.getGetApiResponse(AppUrls.allPatients,);

      return PatientListModel.fromJson(response);

    }catch(e){

      rethrow;

    }
  }
}