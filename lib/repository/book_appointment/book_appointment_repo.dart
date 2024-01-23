import 'package:digi_patient/data/network/base_api_service.dart';
import 'package:digi_patient/data/network/network_api_service.dart';
import 'package:digi_patient/model/book_appointment_model/book_appointment_model.dart';
import 'package:digi_patient/resources/app_url.dart';

class BookAppointmentRepo{
  BaseApiService apiService = NetworkApiService();

   bookAppointment({required  body}) async{

    try{
      dynamic response = await apiService.getPostApiResponsehader(AppUrls.bookAppointment, body);
      print("response$response");

      return response;

    }catch (e){
      rethrow;
    }
  }
}