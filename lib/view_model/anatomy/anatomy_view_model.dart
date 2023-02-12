// import 'package:digi_patient/data/network/base_api_service.dart';
// import 'package:flutter/cupertino.dart';
//
// import '../../data/network/network_api_service.dart';
// import '../../resources/app_url.dart';
// import '../../utils/message.dart';
//
//
// class AnatomyViewModel with ChangeNotifier{
//   final BaseApiService _apiService = NetworkApiService();
//   List<AllSubBodyParts> allSubBodyPartsList = [];
//   bool loading = false;
//
//   setLoading(bool load){
//     loading = load;
//     notifyListeners();
//   }
//
//   getAllSubBodyParts(BuildContext context) async{
//     var response = await _apiService.getGetApiResponse(AppUrls.allSubBodyParts).onError((error, stackTrace) => Messages.flushBarMessage(context, error.toString()));
//     if(response != null){
//       var data = AllSubBodyPart.fromJson(response);
//       allSubBodyPartsList = [];
//       debugPrint(response.toString());
//       allSubBodyPartsList = data.allSubBodyParts!;
//     }else{
//       allSubBodyPartsList = [];
//     }
//
//     notifyListeners();
//   }
// }