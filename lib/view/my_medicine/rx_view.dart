import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view/my_medicine/rx_detail_view.dart';
import 'package:digi_patient/view/my_medicine/uploaded_rx.dart';
import 'package:digi_patient/view_model/my_medicine_view_model/my_medicine_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/my_medicine_model/current_rx_model.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import 'pastrx_detail_view.dart';

class RXView extends StatefulWidget {
  const RXView({Key? key}) : super(key: key);

  @override
  State<RXView> createState() => _RXViewState();
}

class _RXViewState extends State<RXView> {
  // bool isCurrentRxLoading = false;
  // bool isPastRxLoading = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   isCurrentRxLoading = false;
  //   isPastRxLoading = false;
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text(
          "My Medicine",
          style: Style.alltext_appbar,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding.r),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(4.0.r),
                child: ListTile(
                  onTap: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RXDetailView(
                                title: "Current RX", isCurrentRxView: true)));
                    //context.router.push( RXDetailRoute(title: "Current RX", isCurrentRxView: true));
                  },
                  leading: Image.asset(
                    Assets.myMedicineRx,
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "Current RX",
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
                                PastRXDetailView(title: "Past RX")));

                    // context.router.push(RXDetailRoute( title: "Past Rx", isCurrentRxView: false));
                  },
                  leading: Image.asset(
                    Assets.myMedicineRx,
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "Past RX",
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
                                UploadPrescription()));

                    // context.router.push(RXDetailRoute( title: "Past Rx", isCurrentRxView: false));
                  },
                  leading: Image.asset(
                    Assets.myMedicineRx,
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "Uploaded RX",
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
