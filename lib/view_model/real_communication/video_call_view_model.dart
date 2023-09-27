import 'package:agora_uikit/agora_uikit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/data/firebase/firebase_api.dart';
import 'package:digi_patient/repository/real_communication_repo/video_call.dart';
import 'package:digi_patient/view/real_communication/data.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/routes.gr.dart';
import '../../utils/message.dart';

class VideoCallViewModel with ChangeNotifier {

  FirebaseApi firebaseApi = FirebaseApi();

  bool isVideoCallTokenLoading = true;
  setVideoCallLoading(bool val){
    isVideoCallTokenLoading = val;
    notifyListeners();
  }

  VideoCallRepo videoCallRepo = VideoCallRepo();

  String videoCallToken = "";

  getVideoCallToken(BuildContext context,
      {required String appId,
      required String channelName,
      required String userId,
      required String fcmToken,
      }) async {
    Map<String, dynamic> body = {
      "app_id": appId,
      "user_id": userId,
    };
    videoCallRepo
        .getVideoToken(body)
        .then((value) {

      videoCallToken = value.token!;
      debugPrint("\n\n\n\n\n\n\n\n\n\nVideo Call Token: \n ${value.token} channel Name: ${value.channelName}\n\n\n\n\n\n\n\n\n\n");
      setVideoCallLoading(false);
      Map<String, String> body = {
        'token' : "${value.token}",
        'channelName' : "${value.channelName}"
      };
      // firebaseApi.sendApiNotification(channelName: "${value.channelName}", fcmToken: fcmToken, videoCallToken: "${value.token}");
      firebaseApi.sendApiNotification(channelName: testChannelName, fcmToken: fcmToken, videoCallToken: testToken);
      // firebaseApi.sendNotification(fcmToken: fcmToken, data: data);
      // context.router.push( VideoCallingRoute(token: value.token!, appId: appId, channelName: channelName));
    // context.router.push(VideoCallingRTCRoute(token: value.token!));
    // context.router.push(VideoCallingRoute(token: value.token!, channelName: value.channelName!, appId: appId));
    context.router.push(VideoCallingRoute(token: testToken, channelName: testChannelName, appId: appId, client: AgoraClient(
      agoraConnectionData: AgoraConnectionData(appId: appId, channelName: testChannelName, tempToken: testToken)
    )));
    // context.router.push(VideoCallingRTCRoute(token: value.token!, channelName: value.channelName!, appId: appId));
    // context.router.push(VideoCallingRTCRoute(token: testToken, channelName: testChannelName, appId: appId));
        } )
        .onError((error, stackTrace) {
          setVideoCallLoading(true);
          debugPrint(error.toString());
      Messages.snackBar(context, error.toString());
    });
  }
}
