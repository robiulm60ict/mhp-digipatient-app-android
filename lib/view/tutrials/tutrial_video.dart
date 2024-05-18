import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class TutrialVideoPlay extends StatefulWidget {
  TutrialVideoPlay({super.key});

  var datainfo;

  @override
  State<TutrialVideoPlay> createState() => _MedicalVideoPlayState();
}

class _MedicalVideoPlayState extends State<TutrialVideoPlay> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {
            print("Error: ${error.description}");
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://www.youtube.com/watch?v=--Il5ZhkJN0&t=15s"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true, leading: const CustomBackButton(),
          leadingWidth: leadingWidth,
          title: Text(
            "Guidelines Video ",
            style: Style.alltext_ExtraLarge_white,
          ),
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                    color: Colors.green,
                    height: 400,
                    width: double.infinity,
                    child:  WebViewWidget(controller: _controller),
                    // WebView(
                    //   initialUrl:"https://storage.googleapis.com/greatdoc-video-new/GreatDoc%201_1.mp4",
                    //   javascriptMode: JavascriptMode.unrestricted,
                    // )
                ),
                Style.distan_size10,

              ],
            ),
          ),
        ));
  }
}
