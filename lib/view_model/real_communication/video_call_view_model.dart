import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/repository/real_communication_repo/video_call.dart';
import 'package:flutter/cupertino.dart';

import '../../routes/routes.gr.dart';
import '../../utils/message.dart';

class VideoCallViewModel with ChangeNotifier {

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
      required String userId}) async {
    Map<String, dynamic> body = {
      "app_id": appId,
      "user_id": userId,
    };
    videoCallRepo
        .getVideoToken(body)
        .then((value) {

      videoCallToken = value.token!;
      debugPrint("\n\n\n\n\n\n\n\n\n\nVideo Call Token: \n ${value.token}\n\n\n\n\n\n\n\n\n\n");
      setVideoCallLoading(false);
      // context.router.push( VideoCallingRoute(token: value.token!, appId: appId, channelName: channelName));
    // context.router.push(VideoCallingRTCRoute(token: value.token!));
    context.router.push(VideoCallingRoute(token: value.token!, channelName: channelName, appId: appId));
        } )
        .onError((error, stackTrace) {
          setVideoCallLoading(true);
          debugPrint(error.toString());
      Messages.snackBar(context, error.toString());
    });
  }
}
