// Package imports:
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// Project imports:
import 'common.dart';
import 'constants.dart';

ZegoUIKitPrebuiltCallController? callController;

/// local virtual login
Future<void> login({
  required String userID,
  required String userName,
}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheUserIDKey, userID);

  currentUser.id = userID;
  currentUser.name = userName;
}

/// local virtual logout
Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(cacheUserIDKey);
}

/// on user login
void onUserLogin() {
  callController ??= ZegoUIKitPrebuiltCallController();

  print("fffffffffffffffffffffffffffffffffffff${currentUser.id}");
  print("fffffffffffffffffffffffffffffffffffff${currentUser.name}");

  /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 1293432009 /*input your AppID*/,
    appSign:
        'ce9d090d86cd6d51344033934af611515fdb0fc5760cfd02df1f99c06b0b94cf' /*input your AppSign*/,
    userID: currentUser.id,
    userName: currentUser.name,

    notificationConfig: ZegoCallInvitationNotificationConfig(
      androidNotificationConfig: ZegoCallAndroidNotificationConfig(
        showFullScreen: true,

        channelID: "ZegoUIKit",
        channelName: "Call Notifications",
        sound: "notification",
        icon: "notification_icon",
      ),
      iOSNotificationConfig: ZegoCallIOSNotificationConfig(
        systemCallingIconName: 'CallKitIcon',
      ),
    ),
    plugins: [ZegoUIKitSignalingPlugin()],
    requireConfig: (ZegoCallInvitationData data) {
      final config = (data.invitees.length > 1)
          ? ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.groupVideoCall()
              : ZegoUIKitPrebuiltCallConfig.groupVoiceCall()
          : ZegoCallType.videoCall == data.type
              ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
              : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      // config.avatarBuilder = customAvatarBuilder;

      /// support minimizing, show minimizing button
      config.topMenuBar.isVisible = true;

      config.bottomMenuBar.buttons
          .insert(0, ZegoCallMenuBarButtonName.minimizingButton);
      config.bottomMenuBar.buttons
          .remove(ZegoCallMenuBarButtonName.hangUpButton);

      // config.onError = (ZegoUIKitError error) {
      //   debugPrint('onError:$error');
      // };

      return config;
    },
  );
}

/// on user logout
void onUserLogout() {
  callController = null;

  /// 5/5. de-initialization ZegoUIKitPrebuiltCallInvitationService when account is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}
