
import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/my_record_model/medical_history_from_great_doc_model.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';


class MyRecordRepo{

  BaseApiService apiService = NetworkApiService();

  Future<MedicalHistoryFromGreatDocModel> getMedicalHistoryFromGreatDoc() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt(UserP.id);
    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.medicalHistoryFromGreatDoc}$id",);

      return MedicalHistoryFromGreatDocModel.fromJson(response);

    }catch(e){

      rethrow;

    }
  }

}