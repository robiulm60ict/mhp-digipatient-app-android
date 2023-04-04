
import 'package:digi_patient/model/department_model/department_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';

import '../../data/network/base_api_service.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';


class DepartmentRepository{

  BaseApiService apiService = NetworkApiService();

  Future<DepartmentModel> getAllDepartment() async{

    try{

      dynamic response = await apiService.getGetApiResponse(AppUrls.department,);

      return DepartmentModel.fromJson(response);

    }catch(e){

      rethrow;

    }
  }
}