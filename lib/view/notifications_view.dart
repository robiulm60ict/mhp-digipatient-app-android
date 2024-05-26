import 'package:digi_patient/model/notification/notification.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../resources/styles.dart';
import '../view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import 'bottom_navigation_buttons/home_view.dart';

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
      context.read<DailyAndUpcommingViewModel>().putNofification(context);
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

    return WillPopScope(
      onWillPop: () async {
        // Show exit confirmation dialog
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return MyExitConfirmationDialog();
          },
        );

        return exit ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          //automaticallyImplyLeading: false,

          centerTitle: true,
          title: Text(
            "Notification",
            style: Style.alltext_default_white,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(4.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                appointments.isNotificationAppointmentLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          NotoData app = appointments.notificationList[index];

                          return appointments.notificationList.isNotEmpty
                              ? Card(
                            elevation: 4,
                            shadowColor: AppColors.primary_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(app.title.toString()),
                                      Text(app.description.toString())
                                    ],
                                  ),
                                ),
                              )
                              : Container();
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: appointments.notificationList.length),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
