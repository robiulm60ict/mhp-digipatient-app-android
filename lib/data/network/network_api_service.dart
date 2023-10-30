import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/user.dart';
import '/data/app_exception.dart';
import '/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
class NetworkApiService extends BaseApiService{

  @override
  Future getGetApiResponse(String url) async{
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";

    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url)
      //   ,headers:{
      //   'Authorization': 'Bearer 246|0L1Zj7bQxjn9pf2siy3O5vTGP6kqfJyaCsfUfL6P',
      //   'Accept': 'application/json',
      // },
      ).timeout(const Duration(seconds: 10));
      print(response);
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic body) async{
    dynamic responseJson;
    try{
      final response = await http.post(
          body: body,
          Uri.parse(url)).timeout(const Duration(seconds: 10),
      );
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){

    print(response.statusCode);
    switch (response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
    throw UnauthorisedException(response.body.toString());
      case 500:
    throw InternalServerException("Internal Server Error ");
      default:
        throw FetchDataException("Error occurred During Communication with status code ${response.statusCode}");
    }
  }

}