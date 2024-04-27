
import 'package:flutter/cupertino.dart';

abstract class BaseApiServiceClinic{

  Future<dynamic> getGetApiResponsecontext(String url,BuildContext context,String DatabaseName);
  Future<dynamic> getGetApiResponseNotoken(String url ,String DatabaseName);
  Future<dynamic> getGetApiResponse(String url,String DatabaseName);
  Future<dynamic> getGetApiResponseNoHader(String url);
  Future<dynamic> getGetApiResponseHeder(String url,String DatabaseName);
  Future<dynamic> getGetApiResponseHederNoDatabase(String url);

  Future<dynamic> getPostApiResponseUrl(String url,String DatabaseName);
  Future<dynamic> getPostApiResponse(String url, dynamic body,String DatabaseName);
  Future<dynamic> getPostApiResponsehader(String url, dynamic body,String DatabaseName);
}