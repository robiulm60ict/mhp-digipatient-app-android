
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import 'my_report_upload_view.dart';
import 'uploaded_myreport.dart';

class MyReportView extends StatelessWidget {
  const MyReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        title: Text("My Report",  style: Style.alltext_appbar),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [

            Card(
              child: Padding(
                padding: EdgeInsets.all(4.0.r),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UploadReportView()));

                  },
                  leading: Image.asset(
                    Assets.myMedicineRx,
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "Upload Report",
                    style: Style.alltext_default_balck,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(4.0.r),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UploadMyReport()));

                    // context.router.push(RXDetailRoute( title: "Past Rx", isCurrentRxView: false));
                  },
                  leading: Image.asset(
                    Assets.myMedicineRx,
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "My Report",
                    style: Style.alltext_default_balck,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
