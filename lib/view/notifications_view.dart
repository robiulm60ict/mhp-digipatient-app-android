import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constants.dart';
import '../utils/popup_dialogue.dart';
import '../widgets/notification_list_tile.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth.w,
        title: Text(
          "Notification",
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Today",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp,
                  color: const Color(0xFF646464),
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => NotificationListTile(
                        doctorName: 'Dr. Aminur Rahman',
                        appointmentTime: "10:00 PM - 11:00 PM",
                        onTap: () {
                          notificationPopup(context,
                              doctorName: "Dr. Aminur Rahman");
                        },
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 5),
            ),
            SizedBox(
              height: kPadding.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "This Week",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp,
                  color: const Color(0xFF646464),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => NotificationListTile(
                  doctorName: 'Dr. Aminur Rahman',
                  appointmentTime: "10:00 PM - 11:00 PM",
                  onTap: () {
                    notificationPopup(context, doctorName: "Dr. Aminur Rahman");
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: 11,
              ),
            ),
            SizedBox(
              height: kPadding.h,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "This Month",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 17.sp,
                  color: const Color(0xFF646464),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => NotificationListTile(
                  doctorName: 'Dr. Aminur Rahman',
                  appointmentTime: "10:00 PM - 11:00 PM",
                  onTap: () {
                    notificationPopup(context, doctorName: "Dr. Aminur Rahman");
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
