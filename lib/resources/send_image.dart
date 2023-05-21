import 'package:digi_patient/data/network/network_api_service.dart';
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
    var res = await convertStreamedResponseToHttpResponse(response);
    var finalResponse = NetworkApiService().returnResponse(res);
    debugPrint("--- \n\n\n\n\n\n\nResponse Code: ${response.statusCode} and response ${finalResponse.toString()}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

Future<http.Response> convertStreamedResponseToHttpResponse(http.StreamedResponse streamedResponse) async {
  final responseBytes = await streamedResponse.stream.toBytes();
  final responseString = utf8.decode(responseBytes);

  final headers = Map<String, String>.from(streamedResponse.headers);
  final statusCode = streamedResponse.statusCode;

  return http.Response(responseString, statusCode, headers: headers);
}