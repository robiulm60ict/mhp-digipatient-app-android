import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/appointment_model/upcomming_appointments_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/appointment_model/todays_appointment_model.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/appointment_notification_card.dart';
import '../../widgets/back_button.dart';

class DailyAndUpcommingView extends StatefulWidget {
  const DailyAndUpcommingView({Key? key}) : super(key: key);

  @override
  State<DailyAndUpcommingView> createState() => _DailyAndUpcommingViewState();
}

class _DailyAndUpcommingViewState extends State<DailyAndUpcommingView> {
  bool showTodayAppointments = true;

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
        backgroundColor: AppColors.primary_color,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text(
          "Appointments",
          style: Style.alltext_appbar,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: showTodayAppointments
                              ? AppColors.primaryColor
                              : Colors.white),
                      onPressed: () {
                        setState(() {
                          showTodayAppointments = true;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Text(
                          "Today's Appointments",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: showTodayAppointments
                                  ? Colors.white
                                  : AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: !showTodayAppointments
                              ? AppColors.primaryColor
                              : Colors.white),
                      onPressed: () {
                        setState(() {
                          showTodayAppointments = false;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Text(
                          "Upcoming Appointments",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: !showTodayAppointments
                                  ? Colors.white
                                  : AppColors.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: Visibility(
                visible: showTodayAppointments,
                replacement: appointments.isUpcommingAppointmentLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: appointments.upcommingAppointmentList.length,
                        itemBuilder: (context, index) {
                          UpcomingPatientAppointments app =
                              appointments.upcommingAppointmentList[index];
                          return AppointmentNotificationCard(
                            onTap: () {
                              debugPrint("--------------------${app.appType}");
                              context.router.push(DailyAndUpcommingDetailRoute(
                                  docImage:
                                      "${AppUrls.docImage}${app.drImages}",
                                  docName: "${app.drGivenName}",
                                  docHospital: "${app.drAbout}",
                                  docSpeciality: "${app.drProviderId}",
                                  appType:
                                      "${app.appType}".toLowerCase() == "online"
                                          ? true
                                          : false));
                            },
                            title:
                                "You have an appointments with ${app.drGivenName} at ${getDate(app.startTime)}",
                            subTitle:
                                "Starts: ${getTime(app.startTime)} Ends: ${getTime(app.endTime)}",
                            docImage: "${AppUrls.docImage}${app.drImages}",
                          );
                        }),
                child: appointments.isTodayAppointmentLoading
                    ? Center(
                        child: SizedBox(
                            height: 50.h,
                            child: const CircularProgressIndicator()))
                    : ListView.builder(
                        itemCount: appointments.todayAppointmentList.length,
                        itemBuilder: (context, index) {
                          TodaysPatientAppointment app =
                              appointments.todayAppointmentList[index];
                          return AppointmentNotificationCard(
                            onTap: () {
                              debugPrint("--------------------${app.appType}");
                              // context.router.push(DailyAndUpcommingDetailRoute(
                              //     docImage:
                              //         "${AppUrls.docImage}${app.drImages}",
                              //     docName: "${app.drGivenName}",
                              //     docHospital: "${app.drAbout}",
                              //     docSpeciality: "${app.drProviderId}",
                              //     appType:
                              //         "${app.appType}".toLowerCase() == "online"
                              //             ? true
                              //             : false));
                            },
                            title:
                                "${app.title} ${app.drGivenName} ${app.drLastName}",
                            subTitle:
                                "Starts: ${DateFormat("hh:mm a").format(DateTime.parse(app.startTime.toString()))} Ends: ${DateFormat("hh:mm a").format(DateTime.parse(app.endTime.toString()))}",
                            docImage: "${AppUrls.docImage}${app.drImages}",
                          );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
