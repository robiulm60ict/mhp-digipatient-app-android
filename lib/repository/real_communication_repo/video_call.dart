//
//
// import 'package:digi_patient/model/real_communication/video_call_model.dart';
//
//
//
// import '/data/network/network_api_service.dart';
// import '/resources/app_url.dart';
//
// import '/data/network/base_api_service.dart';
//
// class VideoCallRepo {
//   BaseApiService apiService = NetworkApiService();
//
//   Future<VideoCallToken> getVideoToken(dynamic body) async {
//     try {
//       dynamic response =
//       await apiService.getPostApiResponse(AppUrls.videoCall, body);
//       return VideoCallToken.fromJson(response);
//     } catch (e) {
//       rethrow;
//     }
//   }
//
// }
