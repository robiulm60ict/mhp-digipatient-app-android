import 'dart:convert';
import 'dart:io';
import 'package:digi_patient/utils/route/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login_service.dart';
import '../../resources/app_url.dart';
import '../../resources/send_image.dart';
import '../../utils/user.dart';
import '/data/app_exception.dart';
import '/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'token': "$token",
          // 'databaseName': 'mhpdemocom',live
          'databaseName': '${AppUrls.databasename}',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${response.statusCode}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getGetApiResponsecontext(String url, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'token': "$token",
          // 'databaseName': 'mhpdemocom',live
          'databaseName': '${AppUrls.databasename}',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 400) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            // Return the dialog widget
            return AlertDialog(
              title: Text('Notification'),
              content: const Text('You are already logged in another device'),
              actions: [
                TextButton(
                  onPressed: () async {
                    // Close the dialog
                    final prefs = await SharedPreferences.getInstance();

                    await prefs.setBool(UserP.isLoggedIn, false);
                    int? id = prefs.getInt(UserP.userid);

                    logout();

                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RoutesName.login, (route) => false);
                  },
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      }
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${response.statusCode}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getGetApiResponseNotoken(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'databaseName': AppUrls.databasename,
          // 'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${response.statusCode}");
      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${response.body}");

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getGetApiResponseNoHader(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getGetApiResponseHeder(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'token': "$token",
          // 'databaseName': 'mhpdemocom',
          'databaseName': '${AppUrls.databasename}',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }  @override
  Future getputApiResponse(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          'token': "$token",
          'databaseName': 'mhpdemocom',
          //'databaseName': '${AppUrls.databasename}',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getGetApiResponseHederNoDatabase(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'token': token,
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic body) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.post(
        body: body,
        Uri.parse(url),
        headers: {
         'databaseName': AppUrls.databasename,
          'token': "$token",
          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponseUrl(String url) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'token': "$token",
          // 'databaseName': 'mhpdemocom',
          'databaseName': '${AppUrls.databasename}',

          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );

      print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrr$response");
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPostApiResponsehader(String url, dynamic body) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    dynamic responseJson;
    try {
      final response = await http.post(
        body: body,
        Uri.parse(url),
        headers: {
          'token': "$token",
          // 'databaseName': 'mhpdemocom',
          'databaseName': '${AppUrls.databasename}',

          'Accept': 'application/json',
        },
      ).timeout(
        const Duration(seconds: 10),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print(response.statusCode);
    print("dddddddddddddddddd${response.statusCode}");
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body.toString());
        print(responseJson);

        return responseJson;
      case 401:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 422:
        dynamic responseJson = jsonDecode(response.body.toString());

        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body.toString());

        return responseJson;
      // throw   BadRequestExceptionToken();
      case 404:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 413:
        throw LargeRequestException();
      case 500:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      default:
        throw FetchDataException(
            "Error occurred During Communication with status code ${response.statusCode}");
    }
  }
}
