
abstract class BaseApiService{

  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getGetApiResponseHeder(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic body);
  Future<dynamic> getPostApiResponsehader(String url, dynamic body);
}