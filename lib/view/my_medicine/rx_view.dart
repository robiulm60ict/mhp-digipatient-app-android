import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import 'pastrx_detail_view.dart';
import 'prescription_greddoc.dart';
import 'rx_detail_view.dart';
import 'uploaded_rx.dart';

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
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
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
                    "assets/icons/rx3.png",
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "Current Rx from GreatDoc",
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
                                PastRXDetailView(title: "Past RX ")));

                    // context.router.push(RXDetailRoute( title: "Past Rx", isCurrentRxView: false));
                  },
                  leading: Image.asset(
                    "assets/icons/rx2.png",
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "Past Rx from GreatDoc",
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
                            builder: (context) => UploadPrescription()));

                    // context.router.push(RXDetailRoute( title: "Past Rx", isCurrentRxView: false));
                  },
                  leading: Image.asset(
                    "assets/icons/rx1.png",
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "View Rx",
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
                            builder: (context) => PrescriptionGreatDoc()));

                    // context.router.push(RXDetailRoute( title: "Past Rx", isCurrentRxView: false));
                  },
                  leading: Image.asset(
                    "assets/icons/rxpdf.png",
                    color: Colors.green,
                    height: 38.h,
                    width: 36.w,
                  ),
                  title: Text(
                    "View Rx from GreatDoc",
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
