import 'package:agora_uikit/agora_uikit.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view/real_communication/data.dart';
import 'package:flutter/material.dart';

class VideoCallingView extends StatefulWidget {
  const VideoCallingView({super.key});

  @override
  State<VideoCallingView> createState() => _VideoCallingViewState();
}

class _VideoCallingViewState extends State<VideoCallingView> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: appId,
      channelName: channelName,
      tempToken: token

    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }
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
              AgoraVideoViewer(client: client, layoutType: Layout.floating),
              AgoraVideoButtons(client: client,),
            ],
          ),
        ),
      ),
    );
  }
}
