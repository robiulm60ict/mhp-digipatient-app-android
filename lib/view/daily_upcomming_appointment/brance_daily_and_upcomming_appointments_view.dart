import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/appointment_model/todays_appointment_model.dart';
import '../../model/appointment_model/upcomming_appointments_model.dart';
import '../../model/clinic/orgamozationlist_model.dart';
import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/clinic/my_clinic_view_model/my_clinic_doctor_view_model.dart';
import '../../view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import '../../widgets/appointment_notification_card.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';
import 'patientqueioo.dart';

class BranceDailyAndUpcommingView extends StatefulWidget {
   BranceDailyAndUpcommingView({Key? key,this.DbName,this.branch}) : super(key: key);

  Branch? branch;
  String? DbName;
  @override
  State<BranceDailyAndUpcommingView> createState() => _DailyAndUpcommingViewState();
}

class _DailyAndUpcommingViewState extends State<BranceDailyAndUpcommingView> {
  bool showTodayAppointments = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

      context.read<MyClinicDoctorViewModel>().getTodayAppointments(context,widget.DbName.toString(),widget.branch!.id.toString());
      context
          .read<MyClinicDoctorViewModel>()
          .getUpcommingAppointments(context,widget.DbName.toString(),widget.branch!.id.toString());
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
    final appointments = Provider.of<MyClinicDoctorViewModel>(context);
    return RefreshIndicator(
      onRefresh: () async {

        context.read<MyClinicDoctorViewModel>().getTodayAppointments(context,widget.DbName.toString(),widget.branch!.id.toString());
        context
            .read<MyClinicDoctorViewModel>()
            .getUpcommingAppointments(context,widget.DbName.toString(),widget.branch!.id.toString());
      },
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          leading: const CustomBackButton(),
          leadingWidth: leadingWidth,
          backgroundColor: AppColors.primary_color,
          centerTitle: true,
          title: Text(
            "Branch Appointments",
            style: Style.alltext_appbar,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: showTodayAppointments ? 5 : 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showTodayAppointments = true;
                            });
                          },
                          child: SizedBox(
                              height: 60.h,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: showTodayAppointments
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                )),
                                child: Center(
                                    child: Text("Today's Appointments",
                                        textAlign: TextAlign.center)),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: !showTodayAppointments ? 5 : 0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              showTodayAppointments = false;
                            });
                          },
                          child: SizedBox(
                              height: 60.h,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: !showTodayAppointments
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                )),
                                child: Center(
                                    child: Text("Upcoming Appointments",
                                        textAlign: TextAlign.center)),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Visibility(
                  visible: showTodayAppointments,
                  replacement: appointments.upcommingAppointmentList.isEmpty
                      ? appointments.isUpcommingAppointmentLoading == true
                          ? ListView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: bannerShimmereffect(
                                      94.toDouble(), 385.toDouble()),
                                );
                              },
                            )
                          : noDataFounForList("Currently you have no records")
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              appointments.upcommingAppointmentList.length,
                          itemBuilder: (context, index) {
                            UpcomingAppointment app =
                                appointments.upcommingAppointmentList[index];
                            return AppointmentNotificationCard(
                              onTap: () {},
                              title:
                                  "appointment with  ${app.doctors!.title!.titleName}. ${app.doctors!.fullName} on ${DateFormat("dd-MM-yyyy").format(DateTime.parse(app.startTime.toString()))}.",
                              subTitle:
                                  "Starts: ${getTime(app.startTime.toString())} Ends: ${getTime(app.endTime.toString())}",
                              docImage:
                                  "${AppUrls.docImage}${app.doctors!.drImages}",
                            );
                          }),
                  child: appointments.todayAppointmentList.isEmpty
                      ? appointments.isTodayAppointmentLoading == true
                          ? ListView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: bannerShimmereffect(
                                      94.toDouble(), 385.toDouble()),
                                );
                              },
                            )
                          : noDataFounForList("Currently you have no records")
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: appointments.todayAppointmentList.length,
                          itemBuilder: (context, index) {
                            TodaysPatientAppointment app =
                                appointments.todayAppointmentList[index];
                            return AppointmentNotificationCardQueio(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PatientQurio(
                                              todaysPatientAppointment: app,
                                            )));

                                // appointments.getAppoinmentsqueue(context, app.doctorsId, app.id);
                                //
                                // debugPrint(
                                //     "--------------------${app.doctorsId}");   debugPrint(
                                //     "--------------------${app.id}");
                              },
                              title:
                                  " appointment with ${app.doctors!.title!.titleName}. ${app.doctors!.fullName} on ${DateFormat("dd-MM-yyyy").format(DateTime.parse(app.startTime.toString()))}.",
                              subTitle:
                                  "Starts: ${DateFormat("hh:mm a").format(DateTime.parse(app.startTime.toString()))} Ends: ${DateFormat("hh:mm a").format(DateTime.parse(app.endTime.toString()))}",
                              docImage:
                                  "${AppUrls.docImage}${app.doctors!.drImages}",
                            );
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
