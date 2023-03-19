
import 'package:agora_uikit/agora_uikit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../../resources/colors.dart';


// final AgoraClient client = AgoraClient(
//   agoraConnectionData: AgoraConnectionData(
//     appId: "3acad1aef78b4872a958024772b9aa07",
//     channelName: "habib testing",
//     tempToken: "007eJxTYAiwKf8y05Z9WUn01uqITxOvek5fc3I905mSW99nuLFKdWxSYDBOTE5MMUxMTTO3SDKxMDdKtDS1MDAyMTc3SrJMTDQwZ91YmtwQyMgwZXsXAyMUgvi8DBmJSZlJCiWpxSWZeekMDADJhyOk",
//
//   ),
//   agoraEventHandlers: AgoraRtcEventHandlers(
//     userJoined: (uid, elapsed) => debugPrint("\n\n\n\n\nLocal user joined uid: $uid elapsed $elapsed\n\n\n\n\n"),
//     connectionLost: () => debugPrint("\n\n\n\n\nconnection lost ===\n\n\n\n\n"),
//     remoteVideoStateChanged: (uid, state, reason, elapsed) {
//       debugPrint("\n\n\n\n\nVideo State Change uid: $uid state: $state reason: $reason elapsed: $elapsed\n\n\n\n\n");
//       debugPrint("\n\n\n\n\nreason name: ${reason.name}\n\n\n\n\n");
//     },
//     rejoinChannelSuccess: (p0, p1, p2) {
//       debugPrint("\n\n\n\n\nUser rejoin success ========\n\n\n\n\n");
//     },
//     joinChannelSuccess: (channel, uid, elapsed) {
//       debugPrint("\n\n\n\n\nUser join success ========\n\n\n\n\n");
//     },
//     leaveChannel: (stats) {
//       debugPrint("\n\n\n\n\nLeave Channel Stats $stats ========\nvideo duration: ${stats.duration} \n\n\n\n\n");
//       // leaveChannel = true;
//     },
//     userOffline: (uid, reason) {
//       debugPrint("\n\n\n\n\nUser offline uid: $uid reason: ${reason.name} ========\n\n\n\n\n");
//     },
//     firstLocalVideoFrame: (p0, p1, p2) {
//       debugPrint("\n\n\n\n\nMessage from Video Frame ========\n\n\n\n\n");
//     },
//   ),
// );

class VideoCallView extends StatefulWidget {
  const VideoCallView({Key? key, this.userName}) : super(key: key);
  final String? userName;

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  // Instantiate the client
  bool leaveChannel = false;
  late AgoraClient client;
  // AgoraRtcEventHandlers eventHandlers = AgoraRtcEventHandlers();


// Initialize the Agora Engine
  bool willPop = false;
  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    initAgora(context);
  }

  void initAgora(context) async {
     client = getClient(context, userName: widget.userName);
    await client.initialize();
    // debugPrint("\n\n\n\n\n${client.sessionController.value.visible}=======\n\n\n\n\n");

  }

  // void leaveChannel(bool val){
  //   if(val){
  //     context.router.pop();
  //   }
  //
  // }
// Build your layout
  AgoraClient getClient(BuildContext context,{String? userName}){
    return AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "3acad1aef78b4872a958024772b9aa07",
        channelName: "habib testing",
        tempToken: "007eJxTYGC9vfnfnx8hwv23uN5J/l4+169TIch09hTB2H+1bzb9f3BEgcE4MTkxxTAxNc3cIsnEwtwo0dLUwsDIxNzcKMkyMdHA3DegIrkhkJFhQqY0MyMDBIL4vAwZiUmZSQolqcUlmXnpDAwAZNwk1Q==",
        username: userName,
      ),
      agoraEventHandlers: AgoraRtcEventHandlers(

        userJoined: (uid, elapsed) => debugPrint("\n\n\n\n\nLocal user joined uid: $uid elapsed $elapsed\n\n\n\n\n"),
        connectionLost: () => debugPrint("\n\n\n\n\nconnection lost ===\n\n\n\n\n"),
        remoteVideoStateChanged: (uid, state, reason, elapsed) {
          debugPrint("\n\n\n\n\nVideo State Change uid: $uid state: $state reason: $reason elapsed: $elapsed\n\n\n\n\n");
          debugPrint("\n\n\n\n\nreason name: ${reason.name}\n\n\n\n\n");
        },
        rejoinChannelSuccess: (p0, p1, p2) {
          debugPrint("\n\n\n\n\nUser rejoin success ========\n\n\n\n\n");
        },
        joinChannelSuccess: (channel, uid, elapsed) {
          debugPrint("\n\n\n\n\nUser join success ========\n\n\n\n\n");
          // Messages.flushBarMessage(context, "Someone joined uid: $uid", backgroundColor: AppColors.primaryColor, durationSecond: 2, flushBarPosition: FlushbarPosition.BOTTOM);
        },
        leaveChannel: (stats) {
          debugPrint("\n\n\n\n\nLeave Channel Stats $stats ========\nvideo duration: ${stats.duration} \n\n\n\n\n");
          leaveChannel = true;
          setState(() {

          });
          context.router.pop();
        },
        userOffline: (uid, reason) {
          debugPrint("\n\n\n\n\nUser offline uid: $uid reason: ${reason.name} ========\n\n\n\n\n");
        },
        firstLocalVideoFrame: (p0, p1, p2) {
          debugPrint("\n\n\n\n\nMessage from Video Frame ========\n\n\n\n\n");
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{

        // if(!leaveChannel){
        //   Messages.flushBarWithOption(context, "If you leave call will be disconnected", onTap: (){
        //     leaveChannel = true;
        //     setState(() {
        //
        //     });
        //     context.router.pop();
        //   });
        //   return leaveChannel;
        // }else{
          return leaveChannel;
        // }

        // showDialog(context: context, builder: (context) => AlertDialog(
        //   actions: [
        //     ElevatedButton(onPressed: (){
        //
        //     }, child: Text("Exit"),),
        //     ElevatedButton(onPressed: (){}, child: Text("Stay"),),
        //   ],
        // ),)
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text("Video call", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),),
        ),
        body: AgoraVideoViewer(
          // videoRenderMode: VideoRenderMode.FILL,
            client: client,
            layoutType: Layout.floating,
            enableHostControls: true,
            disabledVideoWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.asset(Assets.imagesAvatar, fit: BoxFit.fill, height: 100.h, width: 100.w,),
                Text("Thank you for using us.\nMacro Health Plus,\nTurn on video", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, ),),
                // ElevatedButton(onPressed: (){}, child: Text("Go Back")),
                // CircleAvatar(
                //   radius: 30.r,
                //   backgroundImage: const AssetImage(Assets.imagesHabib2),
                // )
              ],
            ),
            // showAVState: true,
            showNumberOfUsers: true),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: AgoraVideoButtons(
            // autoHideButtons: true,
            client: client,
            // enabledButtons: const [
            //   BuiltInButtons.toggleMic,
            //   BuiltInButtons.callEnd,
            //   BuiltInButtons.switchCamera,
            //
            // ],
            onDisconnect: () {
              debugPrint("\n\n\n\nDisconnected! ==========\n\n\n\n");

              // return null;
            // willPop = true;

            // debugPrint(
            //     "Habib Testing ${
            //   client.sessionController.value.connectionData?.username
            // }");
            // Message(text: client.sessionController.value.connectionData?.username.toString() ?? "null");
            // context.router.pop();
          },
          ),
          // body: SafeArea(
          //   child: Stack(
          //     alignment: Alignment.bottomCenter,
          //     children: [
          //       Expanded(
          //         child: AgoraVideoViewer(
          //             client: client,
          //             // layoutType: Layout.floating,
          //             disabledVideoWidget: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.center,
          //               children: [
          //                 Image.asset(Assets.imagesLogo, height: 200.h, width: 200.w,),
          //                 Text("Thank you for using us.\nMacro Health Plus\nTurn on video", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700, ),),
          //                 // ElevatedButton(onPressed: (){}, child: Text("Go Back")),
          //                 // CircleAvatar(
          //                 //   radius: 30.r,
          //                 //   backgroundImage: const AssetImage(Assets.imagesHabib2),
          //                 // )
          //               ],
          //             ),
          //             showAVState: true,
          //             showNumberOfUsers: true),
          //       ),
          //       AgoraVideoButtons(
          //         autoHideButtons: true,
          //         client: client,
          //         onDisconnect: () {
          //           print("\n\n\n\nDisconnected! ==========\n\n\n\n");
          //         // willPop = true;
          //
          //         // debugPrint(
          //         //     "Habib Testing ${
          //         //   client.sessionController.value.connectionData?.username
          //         // }");
          //         // Message(text: client.sessionController.value.connectionData?.username.toString() ?? "null");
          //         // context.router.pop();
          //       },
          //       ),
          //
          //
          //     ],
          //   ),
          // ),
      ),
    );
  }
}
