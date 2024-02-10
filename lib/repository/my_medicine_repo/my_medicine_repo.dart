import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/network/base_api_service.dart';
import '../../model/my_medicine_model/current_rx_model.dart';
import '../../model/my_medicine_model/my_report_model.dart';
import '../../model/my_medicine_model/past_rx_model.dart';
import '../../model/my_medicine_model/prescription_image_list.dart';
import '../../resources/send_image.dart';
import '../../utils/user.dart';
import '/data/network/network_api_service.dart';
import '/resources/app_url.dart';
import 'package:http/http.dart' as http;


class MyMedicineRepo{

  BaseApiService apiService = NetworkApiService();

  Future<List<MyReportImageModel>> getmyreport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.getmyreportimage}$id"
      );
      print("data..................${response.toString()}");
      List<MyReportImageModel> datalist = [];
      for (var i in response['data']) {
        datalist.add(MyReportImageModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  Future<List<PreccriptionListModel>> getprescriptionImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    try {
      dynamic response = await apiService.getGetApiResponse(
        "${AppUrls.uploadRXimage}$id",
      );
      print("data..................${response.toString()}");
      List<PreccriptionListModel> datalist = [];
      for (var i in response['0']) {
        datalist.add(PreccriptionListModel.fromJson(i));
      }

      return datalist;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<List<CurrentRxModel>> getCurrentRX() async{

    final prefs =  await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);

    //TODO: Remove this print statement
    debugPrint("\n\n\n\n\n\n\n\n\n --------------------- User Id is = $id");

    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.currentRX}$id",);

      List<CurrentRxModel> datalist = [];
      for (var i in response['drugs']) {
        datalist.add(CurrentRxModel.fromJson(i));
      }
      return datalist;

    }catch(e){

      rethrow;

    }
  }

  Future<List<PastRxModel>> getPastRX() async{

    final prefs =  await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);


    try{

      dynamic response = await apiService.getGetApiResponse("${AppUrls.pastRX}$id",);

      List<PastRxModel> datalist = [];
      for (var i in response['drugs']) {
        datalist.add(PastRxModel.fromJson(i));
      }
      return datalist;

    }catch(e){

      rethrow;

    }
  }
  Future uploadRx(Map<String, String> body, List<XFile> imageBytes) async {
    SendImage sendImage = SendImage();

    try {
      dynamic response = await sendImage.addImage(body, imageBytes);
      print("aaaaaaaaaaaaaa${response}");

      return response;

    } catch (e) {
      rethrow;
    }
  }


}
class SendImage {
  Future<dynamic> addImage(Map<String, String> body, List<XFile>  imageBytes) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    Map<String, String> headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'multipart/form-data',
      'databaseName': 'mhpdemocom',
    };
    var request = http.MultipartRequest('POST', Uri.parse(AppUrls.uploadMyReport))
      ..fields.addAll(body)
      ..headers.addAll(headers);
    // ..files.add(await http.MultipartFile.fromPath('images', imageBytes));

    for (var image in imageBytes!) {
      final File file = File(image.path);
      request.files.add(
        await http.MultipartFile.fromPath(
          "images[]",
          file.path,
        ),
      );
    }
    print(imageBytes);
    var response = await request.send();
    debugPrint("\n\n\n\n\n\n\n\n response${response}");
    debugPrint(" statusCode${response.statusCode}");
    debugPrint(" statusCode${response.headers}");
    var res = await convertStreamedResponseToHttpResponse(response);
    var finalResponse = NetworkApiService().returnResponse(res);
    debugPrint("------------------------------------");
    return finalResponse;
  }
}
