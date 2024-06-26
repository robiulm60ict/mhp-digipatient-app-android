import 'dart:io';

import 'package:digi_patient/data/network/base_api_service.dart';
import 'package:digi_patient/data/network/network_api_service.dart';
import 'package:digi_patient/model/registration/registration_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../model/auth_model/RegistrationModel.dart';
import '../utils/user.dart';

class SendImage {
  Future<dynamic> addImage(Map<String, String> body, String imageBytes) async {
    // String addimageUrl = '<domain-name>/api/imageadd';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    Map<String, String> headers = {
      // 'databaseName': 'mhpdemocom',
      'token': "$token",
      // 'databaseName': 'mhpdemocom',
      'databaseName': '${AppUrls.databasename}',
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(AppUrls.registration))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', imageBytes));
    var response = await request.send();
    debugPrint("\n\n\n\n\n\n\n\n${response.reasonPhrase}");
    var res = await convertStreamedResponseToHttpResponse(response);
    var finalResponse = NetworkApiService().returnResponse(res);
    debugPrint("------------------------------------");
    return finalResponse;
    // return RegistrationModel.fromJson(finalResponse);
    // debugPrint(
    //     "--- \n\n\n\n\n\n\nResponse Code: ${response.statusCode} and response ${finalResponse.toString()}");
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<dynamic> update(Map<String, String> body, String imageBytes) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    int? id = prefs.getInt(UserP.id);
    Map<String, String> headers = {
      'token': "$token",
      // 'databaseName': 'mhpdemocom',
      'databaseName': '${AppUrls.databasename}',
      // 'databaseName': 'mhpdemocom',
      // 'databaseName': 'mhpdemocom_ZXJVT',
      'Content-Type': 'multipart/form-data',
    };
    var request =
        http.MultipartRequest('POST', Uri.parse("${AppUrls.userUrlUpdate}$id"))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.add(await http.MultipartFile.fromPath('image', imageBytes));
    var response = await request.send();
    debugPrint("\n\n\n\n\n\n\n\n${response.reasonPhrase}");
    var res = await convertStreamedResponseToHttpResponse(response);
    var finalResponse = NetworkApiService().returnResponse(res);
    debugPrint("------------------------------------");
    return finalResponse;
    // return RegistrationModel.fromJson(finalResponse);
    // debugPrint(
    //     "--- \n\n\n\n\n\n\nResponse Code: ${response.statusCode} and response ${finalResponse.toString()}");
    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   return true;
    // } else {
    //   return false;
    // }
  }
}

Future<http.Response> convertStreamedResponseToHttpResponse(
    http.StreamedResponse streamedResponse) async {
  final responseBytes = await streamedResponse.stream.toBytes();
  final responseString = utf8.decode(responseBytes);

  final headers = Map<String, String>.from(streamedResponse.headers);
  final statusCode = streamedResponse.statusCode;

  return http.Response(responseString, statusCode, headers: headers);
}

class UserRegistration {
  sendImageAndData(
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
    // Read the image file
    // File imageFile = File('path_to_your_image.jpg');
    List<int> imageBytes = imageFile.readAsBytesSync();

    // Encode the image using base64
    String base64Image = base64Encode(imageBytes);

    // Prepare the data to be sent
    Map<String, String> data = {
      'phone_number': phoneNumber,
      'token': token,
      'verification_code': verificationCode,
      'patient_first_name': name,
      'patient_birth_sex_id': genderId,
      'ptn_blood_group_id': bloodGroupId,
      'patient_dob': dateOfBirth,
      'image': base64Image,
      'password': password,
      'pa tient_email': email,
    };

    // Convert the data to JSON
    String jsonData = jsonEncode(data);

    // Set the headers
    Map<String, String> headers = {
      // 'databaseName': 'mhpgmailcom',

      'databaseName': 'mhpdemocom_ZXJVT',
      'Content-Type': 'application/json',
    };

    // Make the POST request
    http.Response response = await http.post(
      Uri.parse(AppUrls.registration),
      headers: headers,
      body: jsonData,
    );

    return NetworkApiService().returnResponse(response);
    // // Check the response
    // if (response.statusCode == 200) {
    //   print('Image and data sent successfully');
    // } else {
    //   print(
    //       'Error sending image and data. Status code: ${response.statusCode}');
    // }
    // final json = NetworkApiService().returnResponse(response);
    //
    // try{
    //   return RegistrationModel.fromJson(json);
    // }catch (e){
    //   Messages.snackBar(context, e.toString());
    // }
  }
}
