import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../resources/colors.dart';
import '../../../resources/styles.dart';

class MedicalVideoPlay extends StatefulWidget {
  MedicalVideoPlay({super.key, required this.datainfo});

  var datainfo;

  @override
  State<MedicalVideoPlay> createState() => _MedicalVideoPlayState();
}

class _MedicalVideoPlayState extends State<MedicalVideoPlay> {
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
          centerTitle: true,
          title: Text(
            "Details ",
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
                    height: 300,
                    width: double.infinity,
                    child: WebView(
                      initialUrl: widget.datainfo.videoUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                    )),
                Style.distan_size10,
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8),

                  child: Text("Title : ${widget.datainfo.title}",style: Style.alltext_default_balck,),
                ),
                Style.distan_size5,
                Padding(
                  padding: EdgeInsets.only(left: 8,right: 8),

                  child: Text("Description : ${widget.datainfo.description}",style: Style.alltext_default_balck,),
                ),
              ],
            ),
          ),
        ));
  }
}
