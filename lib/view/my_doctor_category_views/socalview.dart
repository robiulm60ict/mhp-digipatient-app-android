import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';

class SocialWebviewView extends StatefulWidget {
  final String url;

  SocialWebviewView({super.key, required this.url});

  @override
  State<SocialWebviewView> createState() => _SocialWebviewViewState();
}

class _SocialWebviewViewState extends State<SocialWebviewView> {
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
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text(
          "Social Media",
          style: Style.alltext_appbar,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}
