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
      setVideoCallLoading(false);
      context.router.push( VideoCallingRoute(token: value.token!, appId: appId, channelName: channelName));
    } )
        .onError((error, stackTrace) {
          setVideoCallLoading(true);
      Messages.snackBar(context, error.toString());
    });
  }
}
