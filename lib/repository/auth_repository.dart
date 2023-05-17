
import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/model/auth_model/login_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';

import '../model/auth_model/birth_sex_model.dart';
import '../model/registration/otp_check_model.dart';
import '../model/registration/registration_model.dart';
import '../model/registration/send_verification_code_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

import '../data/network/base_api_service.dart';

class AuthRepository{
  BaseApiService apiService = NetworkApiService();

  Future<LoginModel> loginApi(dynamic body) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.login, body);
      return LoginModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<SendVerificationModel> sendOTP({required Map<String, dynamic> body}) async{
    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.sendVerification, body);
      return SendVerificationModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<OtpCheckModel> checkOTP({required Map<String, dynamic> body}) async{
    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.checkOtp, body);
      return OtpCheckModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  
  
  
  Future<RegistrationModel> signUpApi({required Map<String, dynamic> body}) async{

    try{
      dynamic response = await apiService.getPostApiResponse(AppUrls.registration, body);
      return RegistrationModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<BloodGroupModel> getBloodGroup() async{
    try{
      dynamic response = await apiService.getGetApiResponse(AppUrls.bloodGroup);
      return BloodGroupModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<BirthSexModel> getBirthSex()async{
    try{
      dynamic response = await apiService.getGetApiResponse(AppUrls.birthSex);
      return BirthSexModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}