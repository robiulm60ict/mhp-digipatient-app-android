import 'dart:convert';
import 'dart:io';

import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/model/auth_model/login_model.dart';
import 'package:digi_patient/resources/send_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../data/app_exception.dart';
import '../model/auth_model/RegistrationModel.dart';
import '../model/auth_model/birth_sex_model.dart';
import '../model/registration/otp_check_model.dart';
import '../model/registration/registration_model.dart';
import '../model/registration/send_verification_code_model.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';

import '../data/network/base_api_service.dart';

class AuthRepository {
  BaseApiService apiService = NetworkApiService();

  Future loginApi(dynamic body) async {
    try {
      dynamic response =
          await apiService.getPostApiResponse(AppUrls.login, body);
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future sendOTP(
      {required Map<String, dynamic> body}) async {
    try {
      dynamic response =
          await apiService.getPostApiResponse(AppUrls.sendVerification, body);
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future sendOTPForget(
      {required Map<String, dynamic> body}) async {
    try {
      dynamic response =
      await apiService.getPostApiResponse(AppUrls.sendVerificationForget, body);
      print(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  Future<OtpCheckModel> checkOTP({required Map<String, dynamic> body}) async {
    try {
      dynamic response =
          await apiService.getPostApiResponse(AppUrls.checkOtp, body);
      return OtpCheckModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future newPassword({required Map<String, dynamic> body}) async {
    try {
      dynamic response =
      await apiService.getPostApiResponse(AppUrls.newPassword, body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  NetworkApiService api = NetworkApiService();
  Future<RegistrationModel> signUpOriginal(BuildContext context, Map<String,dynamic> body)async{

    dynamic responseJson;
    try{
      final response = await http.post(
          body: jsonEncode(body),
          headers: {
            'databaseName': 'mhpgmailcom',
            'Content-Type': 'application/json',
            'Accept': 'application/json',

          },
          Uri.parse(AppUrls.registration)).timeout(const Duration(seconds: 10),
      );
      responseJson = api.returnResponse(response);
      return RegistrationModel.fromJson(responseJson);

    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }catch (e){
      rethrow;
    }
  }

 signUpApi(
      {required Map<String, String> body, required imageBytes}) async {
    SendImage sendImage = SendImage();
    try {
      dynamic response =
      await sendImage.addImage(body, imageBytes);
        //   await apiService.getPostApiResponse(AppUrls.registration, body);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<RegistrationModel> registration(
      {required File imageFile,
      required String phoneNumber,
      required String token,
      required String verificationCode,
      required String name,
      required String genderId,
      required String bloodGroupId,
      required String dateOfBirth,
      required String password,
      required String email}) async {
    UserRegistration registration = UserRegistration();
    try {
      var json = await registration.sendImageAndData(
          imageFile: imageFile,
          phoneNumber: phoneNumber,
          token: token,
          verificationCode: verificationCode,
          name: name,
          genderId: genderId,
          bloodGroupId: bloodGroupId,
          dateOfBirth: dateOfBirth,
          password: password,
          email: email);
      return RegistrationModel.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  Future<BloodGroupModel> getBloodGroup() async {
    try {
      dynamic response = await apiService.getGetApiResponse(AppUrls.bloodGroup);
      print(response);
      return BloodGroupModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<BirthSexModel> getBirthSex() async {
    try {
      dynamic response = await apiService.getGetApiResponse(AppUrls.birthSex);
      print(response);

      return BirthSexModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // registration(Map<String, String> body, String filepath)async{
  //   try{
  //     Map<String, String> headers = {
  //       'Content-Type': 'multipart/form-data',
  //     };
  //     var request = http.MultipartRequest('POST', Uri.parse(AppUrls.registration))
  //       ..fields.addAll(body)
  //       ..headers.addAll(headers)
  //       ..files.add(await http.MultipartFile.fromPath('image', filepath));
  //     var response = await request.send();
  //     // NetworkApiService().returnResponse(response);
  //     debugPrint("Response Code: ${response.statusCode}");
  //     return RegistrationModel.fromJson(response);
  //   }catch (e){
  //     rethrow;
  //   }
  // }
}
