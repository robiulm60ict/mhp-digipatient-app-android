import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/appointment_model/todays_appointment_model.dart';
import '../model/appointment_model/upcomming_appointments_model.dart';
import '../resources/app_url.dart';
import '../resources/constants.dart';
import '../utils/popup_dialogue.dart';
import '../view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import '../widgets/notification_list_tile.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DailyAndUpcommingViewModel>().getTodayAppointments(context);
      context
          .read<DailyAndUpcommingViewModel>()
          .getUpcommingAppointments(context);
    });
  }

  String getTime(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return DateFormat.jm().format(dateObject);
    } else {
      return "null";
    }
  }

  String getDate(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return "${dateObject.year}-${dateObject.month}-${dateObject.day}";
    } else {
      return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<DailyAndUpcommingViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
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
              height: 10.h,
            ),
            // appointments.isTodayAppointmentLoading
            //     ? const Center(child: CircularProgressIndicator())
            //     : Expanded(
            //         child: ListView.separated(
            //             itemBuilder: (context, index) {
            //               TodaysPatientAppointment app =
            //                   appointments.todayAppointmentList[index];
            //
            //               return NotificationListTile(
            //                 doctorName: "${app.drGivenName}",
            //                 appointmentTime:
            //                     "{getTime(app.startTime)}- {getTime(app.endTime)}",
            //                 onTap: () {
            //                   notificationPopup(context,
            //                       doctorName: "${app.drGivenName}",
            //                       docImage:
            //                           "${AppUrls.docImage}${app.drImages}");
            //                 },
            //                 docImage: "${AppUrls.docImage}${app.drImages}",
            //                 beforeText: 'Today, You have an appointment with ',
            //               );
            //             },
            //             separatorBuilder: (context, index) => SizedBox(
            //                   height: 10.h,
            //                 ),
            //             itemCount: appointments.todayAppointmentList.length),
            //       ),
            // SizedBox(
            //   height: kPadding.h,
            // ),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     "Up Coming",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w700,
            //       fontSize: 17.sp,
            //       color: const Color(0xFF646464),
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 10.h,
            // ),
            // appointments.isUpcommingAppointmentLoading
            //     ? const Center(child: CircularProgressIndicator())
            //     : Expanded(
            //         child: ListView.separated(
            //           itemBuilder: (context, index) {
            //             UpcomingPatientAppointment app =
            //                 appointments.upcommingAppointmentList[index];
            //
            //             return NotificationListTile(
            //               doctorName: "${app.drGivenName}",
            //               appointmentTime:
            //                   "${getTime(app.startTime)}- ${getTime(app.endTime)}",
            //               onTap: () {
            //                 notificationPopup(context,
            //                     doctorName: "${app.drGivenName}",
            //                     docImage: "${AppUrls.docImage}${app.drImages}");
            //               },
            //               docImage: "${AppUrls.docImage}${app.drImages}",
            //               beforeText: 'You have an appointment with ',
            //             );
            //           },
            //           separatorBuilder: (context, index) => SizedBox(
            //             height: 10.h,
            //           ),
            //           itemCount: appointments.upcommingAppointmentList.length,
            //         ),
            //       ),
            // SizedBox(
            //   height: kPadding.h,
            // ),
          ],
        ),
      ),
    );
  }
}
