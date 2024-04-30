import 'package:digi_patient/data/network/base_api_service.dart';
import 'package:digi_patient/data/network/network_api_service.dart';
import 'package:digi_patient/model/appointment_model/upcomming_appointments_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:pdf/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/appointment_model/todays_appointment_model.dart';

class AppointmentRepo{
  BaseApiService apiService = NetworkApiService();

  Future getAppoinmentsqueue(docid,appoinmentid)async{

    try{
      dynamic response = await apiService.getGetApiResponse("${AppUrls.Appoinmentsqueue}/$docid/$appoinmentid");
     // print(response);
    return response;
    }catch (e){
      print(e);
      rethrow;
    }
  }  Future<TodaysAppointmentModel> getTodayAppointment(contex)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try{
      dynamic response = await apiService.getGetApiResponsecontext("${AppUrls.todayAppointments}$id/null",contex);
     // print(response);
    return TodaysAppointmentModel.fromJson(response);
    }catch (e){
      print(e);
      rethrow;
    }
  }

  Future<UpcommingAppointmentsModel> getUpcommingAppointment(context)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try{
      dynamic response = await apiService.getGetApiResponsecontext("${AppUrls.upcommingAppointments}$id/null",context);
      print("fffffffffffffffffffff${response}");
      return UpcommingAppointmentsModel.fromJson(response);
    }catch (e){
      print(e);
      rethrow;
    }
  }

}