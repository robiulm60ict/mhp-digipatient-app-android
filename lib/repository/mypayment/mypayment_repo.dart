import 'package:digi_patient/model/doctor_model/doctor_fee_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/my_record_model/add_medical_history_model.dart';
import 'package:digi_patient/model/my_record_model/diagnosis_procedure_model.dart';
import 'package:digi_patient/model/my_record_model/medical_history_from_great_doc_model.dart';
import 'package:digi_patient/model/my_record_model/procedure_mHFGD_model.dart';
import 'package:digi_patient/model/my_record_model/reason_for_visit_model.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/my_record_model/save_vital_model.dart';
import '../../model/mypayment/mypaument_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

class MyPaymentRepo {
  BaseApiService apiService = NetworkApiService();

  Future<List<MyPaymentModel>>
      getmypayment(contex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString(UserP.hnnumber);
    try {
      dynamic response = await apiService.getGetApiResponsecontext(
        "${AppUrls.mypayment}$id",contex
      );

      print(response);
      List<MyPaymentModel> alldata=[];
      for(var i in response){
        alldata.add(MyPaymentModel.fromJson(i));
      }
      return alldata;
    } catch (e) {
      rethrow;
    }
  }


}
