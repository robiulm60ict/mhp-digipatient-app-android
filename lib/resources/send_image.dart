import 'package:digi_patient/resources/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class SendImage {
  Future<bool> addImage(Map<String, String> body, String filepath) async {
    // String addimageUrl = '<domain-name>/api/imageadd';

    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(AppUrls.registration))
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    var response = await request.send();
    debugPrint("Response Code: ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}