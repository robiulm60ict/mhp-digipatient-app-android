import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../upcamming/upcamming_view.dart';
import 'tutrials.dart';

class TutrialsCategory extends StatelessWidget {
  const TutrialsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        //automaticallyImplyLeading: false,

        centerTitle: true,
        title: Text(
          "Tutorial",
          style: Style.alltext_default_white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Card(
                  child: Column(
                    children: [
                      Card(
                        elevation: 8,
                        color: Colors.white,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(

                          // side: new BorderSide(
                          //     color: AppColors.primaryColor, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          color: AppColors.page_background_color,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const TutrialsView()));

                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.0),
                                  decoration: BoxDecoration(
                                    //  color: Colors.green.shade50,
                                    // border: Border.all(
                                    //     color: Colors.redAccent),
                                      shape: BoxShape.circle),
                                  height: 65.h,
                                  width:65.h,
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Image.asset(
                                     "assets/icons/faq.png",
                                      //fit: BoxFit.fill,
                                      //   color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Style.distan_size2,
                      Text(
                        "FAQ",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: Style.alltext_default_balck_dashbord,
                      ),
                      Style.distan_size10,

                    ],
                  )
                )),
                Expanded(
                    child: Card(
                        child: Column(
                          children: [
                            Card(
                              elevation: 8,
                              color: Colors.white,
                              shadowColor: Colors.black,
                              shape: RoundedRectangleBorder(

                                // side: new BorderSide(
                                //     color: AppColors.primaryColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                color: AppColors.page_background_color,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Upcamming()));
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(1.0),
                                        decoration: BoxDecoration(
                                          //  color: Colors.green.shade50,
                                          // border: Border.all(
                                          //     color: Colors.redAccent),
                                            shape: BoxShape.circle),
                                        height: 65.h,
                                        width:65.h,
                                        child: Padding(
                                          padding: EdgeInsets.all(6.0),
                                          child: Image.asset(
                                            "assets/icons/multimedia.png",
                                            //fit: BoxFit.fill,
                                            //   color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Style.distan_size2,
                            Text(
                              "Video",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: Style.alltext_default_balck_dashbord,
                            ),
                            Style.distan_size10,
                          ],
                        )
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
