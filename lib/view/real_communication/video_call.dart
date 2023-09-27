import 'package:agora_rtm/agora_rtm.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/data/firebase/notification_fcm.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view/real_communication/data.dart';
import 'package:flutter/material.dart';
import '/resources/app_url.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';

class VideoCallingView extends StatefulWidget {
  const VideoCallingView({super.key, required this.token, required this.channelName, required this.appId, required this.client});
  final String token;
  final String channelName;
  final String appId;
  final AgoraClient client;


  @override
  State<VideoCallingView> createState() => _VideoCallingViewState();
}

class _VideoCallingViewState extends State<VideoCallingView> {

  // late final AgoraClient client;
  // final notificationService = NotificationService();


  @override
  void initState() {
    super.initState();
    initAgora();
    // notificationService.firebaseNotification(context);
    // notificationService.sendNotification(body: widget.token, senderId: "senderId");

  }
  void initAgora() async {
    // client = AgoraClient(
    //   agoraConnectionData: AgoraConnectionData(
    //       appId: widget.appId,
    //       channelName: widget.channelName,
    //       tempToken: widget.token,
    //       // tokenUrl: AppUrls.videoCall,
    //   ),
    // );
    await widget.client.initialize();

  }
  // var provider = context.read();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          // leading: const CustomBackButton(),
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: const Text("Video Call"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(client: widget.client, layoutType: Layout.floating, showNumberOfUsers: true,),
              AgoraVideoButtons(client: widget.client, ),
            ],
          ),
        ),
      ),
    );
  }
}


class PatientVideoCallView extends StatefulWidget {
  const PatientVideoCallView({super.key, required this.channelName, required this.token});
  final String channelName;
  final String token;

  @override
  State<PatientVideoCallView> createState() => _PatientVideoCallViewState();
}

class _PatientVideoCallViewState extends State<PatientVideoCallView> {
  late final AgoraClient client;
  // final notificationService = NotificationService();
  @override
  void initState() {
    super.initState();
    initAgora();
    // notificationService.firebaseNotification(context);
  }
  void initAgora() async {
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: appId,
        channelName: widget.channelName,
        tempToken: widget.token,
        tokenUrl: AppUrls.videoCall,
      ),
    );
    await client.initialize();
    setState(() {

    });
  }
  // var provider = context.read();

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments;
    // return WillPopScope(
    //   onWillPop: () async => false,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       // leading: const CustomBackButton(),
    //       automaticallyImplyLeading: false,
    //       backgroundColor: AppColors.primaryColor,
    //       title: const Text("Video Call"),
    //       centerTitle: true,
    //     ),
    //     body: SafeArea(
    //       child: Stack(
    //         children: [
    //           AgoraVideoViewer(client: client, layoutType: Layout.floating),
    //           AgoraVideoButtons(client: client, ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Text("${message?.notification.title}")
        ],
      ),
    );
  }
}


class VideoCallingRTCView extends StatefulWidget {
  const VideoCallingRTCView({Key? key, required this.token, required this.channelName, required this.appId}) : super(key: key);
  final String token;
  // final String token;
  final String channelName;
  final String appId;
  @override
  State<VideoCallingRTCView> createState() => _VideoCallingRTCViewState();
}

class _VideoCallingRTCViewState extends State<VideoCallingRTCView> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  // String? token ;

  @override
  void initState() {
    super.initState();
    initAgora();
  }


  Future<void> initAgora() async {
    // token = widget.token;
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize( RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint('[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannel(
      token: widget.token,
      channelId: widget.channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _engine.release();
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Video Call'),
        ),
        body: Stack(
          children: [
            Center(
              child: _remoteVideo(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 100,
                height: 150,
                child: Center(
                  child: _localUserJoined
                      ? AgoraVideoView(
                    controller: VideoViewController(
                      rtcEngine: _engine,
                      canvas: const VideoCanvas(uid: 0),
                    ),
                  )
                      : const CircularProgressIndicator(),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: widget.channelName),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}

// class CallPageView extends StatefulWidget {
//   const CallPageView({super.key, required this.channelName, required this.role, required this.token});
//   final String channelName;
//   final ClientRoleType role;
//   final String token;
//
//   @override
//   State<CallPageView> createState() => _CallPageViewState();
// }
//
// class _CallPageViewState extends State<CallPageView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Video Call"),
//       ),
//       body: ,
//     ));
//   }
// }
