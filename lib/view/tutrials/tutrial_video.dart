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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    child: WebView(
                      initialUrl:"https://storage.googleapis.com/greatdoc-video-new/GreatDoc%201_1.mp4",
                      javascriptMode: JavascriptMode.unrestricted,
                    )),
                Style.distan_size10,

              ],
            ),
          ),
        ));
  }
}
