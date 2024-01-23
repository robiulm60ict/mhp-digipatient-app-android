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
  SocialWebviewView({super.key,required this.url});

  var url;

  @override
  State<SocialWebviewView> createState() => _SocialWebviewViewState();
}

class _SocialWebviewViewState extends State<SocialWebviewView> {
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
        child: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebResourceError: (WebResourceError error) {
            print("Error: ${error.description}");
          },
        ),
      ),
    );
  }
}
