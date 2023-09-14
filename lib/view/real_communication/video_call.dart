import 'package:agora_uikit/agora_uikit.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/view/real_communication/data.dart';
import 'package:flutter/material.dart';

class VideoCallingView extends StatefulWidget {
  const VideoCallingView({super.key, required this.token, required this.channelName, required this.appId});
  final String token;
  final String channelName;
  final String appId;

  @override
  State<VideoCallingView> createState() => _VideoCallingViewState();
}

class _VideoCallingViewState extends State<VideoCallingView> {

  late final AgoraClient client;
  @override
  void initState() {
    super.initState();

    initAgora();
  }
  void initAgora() async {
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: widget.appId,
          channelName: widget.channelName,
          tempToken: widget.token

      ),
    );
    await client.initialize();
    setState(() {

    });
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
              AgoraVideoViewer(client: client, layoutType: Layout.floating),
              AgoraVideoButtons(client: client,),
            ],
          ),
        ),
      ),
    );
  }
}
