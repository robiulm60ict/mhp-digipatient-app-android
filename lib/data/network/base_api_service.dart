
import 'package:flutter/cupertino.dart';

abstract class BaseApiService{

  Future<dynamic> getGetApiResponsecontext(String url,BuildContext context);
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getGetApiResponseNoHader(String url);
  Future<dynamic> getGetApiResponseHeder(String url);

  Future<dynamic> getPostApiResponseUrl(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic body);
  Future<dynamic> getPostApiResponsehader(String url, dynamic body);
}