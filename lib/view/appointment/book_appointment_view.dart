
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../model/anatomy/anatomy_symptoms_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/message.dart';
import '../../utils/utils.dart';
import '../../view_model/anatomy/anatomy_view_model.dart';
import '../../view_model/appointment_view_model/appointment_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';
import '../anatomy/anatomy_view.dart';
import '../payment/payment_method_view.dart';

class BookAppointmentView extends StatefulWidget {
  const BookAppointmentView(
      {Key? key, required this.doctors, required this.amount})
      : super(key: key);
  final Datum doctors;
  final String amount;

  @override
  State<BookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BookAppointmentView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAmount();
    });
  }

  getAmount() {
    // context.read<MyDoctorViewModel>().getDoctorFee(widget.doctors.id);
    // context.read<AppointmentViewModel>().setWeekDays();
    context
        .read<AppointmentViewModel>()
        .getDocChamberTime(context, "", docId: widget.doctors.doctorsMasterId);
    context.read<AppointmentViewModel>().getDocChamberTimeCalender(context, "",
        docId: widget.doctors.doctorsMasterId);
    // context.read<AnatomyModelView>().getSelectedSymptomsList();
  }

  bool isHospitalSelected = true;

  var morning = "";
  var evenimg = "";

  @override
  Widget build(BuildContext context) {
    // final myDocVM = Provider.of<MyDoctorViewModel>(context,listen: false);
    final anatomy = Provider.of<AnatomyModelView>(context);

    return Consumer<AppointmentViewModel>(
        builder: (context, appointmentViewModel, child) {
      return Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          title: Text(
            "Book Appointment ",
            style: Style.alltext_appbar,
          ),
          centerTitle: true,
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BottomAppBar(
            elevation: 5,
            height: 50,
            color: AppColors.primary_color,
            child: MaterialButton(
              onPressed: () async {
                List<SymptomsAnatomy> diseaseList =
                    anatomy.getSelectedSymptomsList();
                print(appointmentViewModel.selectedDatee.toString());
                if (appointmentViewModel.selectedDatee == null) {
                  Messages.snackBar(context, "Please Select Date!");
                } else if (appointmentViewModel.isChamber.toString() == "") {
                  Messages.snackBar(context, "Please Select Appointment Type!");
                } else if (appointmentViewModel.morningeveingButton
                        .toString() ==
                    "") {
                  Messages.snackBar(context, "Please Select Shift Type!");
                } else if (anatomy.favourite.isEmpty) {
                  Messages.snackBar(context, "Please Select Symptoms!");
                } else {
                  print(
                    "${DateFormat("dd-MM-yyyy H:m").format(DateTime.parse("${appointmentViewModel.selectedDatee.toString()}"))}",
                  );
                  print(appointmentViewModel.selectedDatee.toString());

                  await appointmentViewModel.getPatientId().then((value) =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethodView(
                                  appointmentDate:
                                      "${appointmentViewModel.selectedDatee!}",
                                  appointmentType:
                                      appointmentViewModel.isChamber ==
                                              "Chamber"
                                          ? "Chamber"
                                          : "Telehealth",
                                  doctorId: "${widget.doctors.doctorsMasterId}",
                                  patientId: "$value",
                                  amount: widget.amount,
                                  doctor: widget.doctors,
                                  diseaseList: anatomy.favourite,
                                  shiftType: appointmentViewModel
                                              .morningeveingButton ==
                                          "morning"
                                      ? "Morning"
                                      : "Evening"))));

                  setState(() {
                    appointmentViewModel.selectedDatee = null;
                    appointmentViewModel.isChamber = "";
                    appointmentViewModel.morningeveingButton = "";

                    appointmentViewModel.date = DateTime.now();
                    anatomy.favourite.clear();

                    anatomy.symptomsList.clear();

                    anatomy.getSymptomsList.clear();
                  });
                }
              },
              child: Text(
                "Confirm Appointment",
                style: Style.alltext_appbar,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          padding: EdgeInsets.all(10.r),
          children: [
            MaterialButton(
                height: 50,
                color: AppColors.primary_color,
                onPressed: () async {
                  await appointmentViewModel.selectDate(
                      context, widget.doctors.doctorsMasterId);
                  // await appointmentViewModel.selectDate();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appointmentViewModel.selectedDatee == null
                        ? Text("")
                        : Text(
                            "${appointmentViewModel.selectedDatee!.day}-${appointmentViewModel.selectedDatee!.month}-${appointmentViewModel.selectedDatee!.year}",
                            style: Style.alltext_appbar,
                          ),
                    Style.widthdistan_size20,
                    Text(
                      "Selected Date",
                      style: Style.alltext_appbar,
                    )
                  ],
                )),

            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: appointmentViewModel.isChamber.toString() ==
                            "Telehealth"
                        ? AppColors.primaryColor
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.appoinmentchamber("Telehealth");
                      },
                      leading: Image.asset(Assets.imagesMobile,
                          height: 20.h,
                          width: 10.w,
                          fit: BoxFit.fill,
                          color: AppColors.primaryColor),
                      title: Text(
                        "Online".toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.isChamber.toString() ==
                                    "Telehealth"
                                ? AppColors.whiteColor
                                : AppColors.primary_color),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color:
                        appointmentViewModel.isChamber.toString() == "Chamber"
                            ? AppColors.primaryColor
                            : Colors.white,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.appoinmentchamber("Chamber");
                      },
                      leading: Image.asset(
                        Assets.imagesChamber,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        "Chamber".toUpperCase(),
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.isChamber.toString() ==
                                    "Chamber"
                                ? Colors.white
                                : AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: appointmentViewModel.morningeveingButton == "morning"
                        ? AppColors.primaryColor
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        morning = "morning";
                        evenimg = "";
                        print(morning);
                        print(evenimg);

                        setState(() {});
                        appointmentViewModel.appoinmentmorningeveing("morning");
                      },
                      leading: Image.asset(
                        appointmentViewModel.morningeveingButton == "morning"
                            ? Assets.imagesDayInActive
                            : Assets.imagesDayActive,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        "MORNING",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.morningeveingButton ==
                                    "morning"
                                ? Colors.white
                                : AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: appointmentViewModel.morningeveingButton == "evening"
                        ? AppColors.primaryColor
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        // evenimg = "evening";
                        // morning = "";
                        // print(morning);
                        // print(evenimg);
                        setState(() {});
                        appointmentViewModel.appoinmentmorningeveing("evening");
                      },
                      leading: Image.asset(
                        appointmentViewModel.morningeveingButton == "evening"
                            ? Assets.imagesNightActive
                            : Assets.imagesNightInActive,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                        color: AppColors.primaryColor,
                      ),
                      title: Text(
                        "EVENING",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.morningeveingButton ==
                                    "evening"
                                ? AppColors.whiteColor
                                : AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            appointmentViewModel.doctorTimeSlotList.isEmpty
                ? SizedBox()
                : SizedBox(
                    height: 150.h,
                    child: Consumer<AppointmentViewModel>(
                        builder: (context, data, child) {
                      if (data.doctorTimeSlotList.isEmpty) {
                        return data.isDocChamberTimeLoading == true
                            ? ListView.builder(
                                itemCount: 6,
                                // scrollDirection: Axis.vertical,
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: bannerShimmereffect(
                                        90.toDouble(), 385.toDouble()),
                                  );
                                },
                              )
                            : noDataFounForList("No History");
                      } else {
                        return SizedBox(
                            //    height: 150.h,
                            child: ListView.builder(
                          itemCount: data.doctorTimeSlotList.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var docTime = data.doctorTimeSlotList[index];

                            if ((docTime.type ==
                                    appointmentViewModel.morningeveingButton
                                        .toString()) &&
                                (docTime.appointmentType ==
                                    appointmentViewModel.isChamber
                                        .toString())) {
                              return Center(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${docTime.day}",
                                          style: Style.alltext_default_balck,
                                        ),
                                        Text(
                                          "${formatSpecificTime(docTime.slotFrom.toString())} To ${formatSpecificTime(docTime.slotTo.toString())}",
                                          style: Style.alltext_default_balck,
                                        ),
                                        // Text(
                                        //   "${docTime.type.toString().toUpperCase()}",
                                        //   style: Style.alltext_default_balck,
                                        // ),
                                        // Text(
                                        //   "${docTime.appointmentType.toString().toUpperCase()}",
                                        //   style: Style.alltext_default_balck,
                                        // ),
                                        Text(
                                          docTime.status.toString() ==
                                                  "off_duty"
                                              ? "Off Day"
                                              : "",
                                          style: Style.alltext_default_balck,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              // Return an empty container for items that don't match the filter criteria
                              return Container();
                            }
                          },
                        ));
                      }
                    })),
            SizedBox(
              height: 10.h,
            ),

            Consumer<AnatomyModelView>(builder: (context, anatomy, child) {
              return Container(
                width: double.infinity,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnatomyView()));
                        anatomy.favourite.clear();
                        // setState(() {
                        //   anatomy.selecteddata.clear();
                        //   print( anatomy.selecteddata);
                        // });
                        // context.router.push(const AnatomyRoute());
                      },
                      child: Card(
                        color: AppColors.primaryColor,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 10.h),
                          child: Text(
                            "Select Symptoms",
                            textAlign: TextAlign.center,
                            style: Style.alltext_appbar,
                          ),
                        ),
                      ),
                    ),
                    // Visibility(
                    //   visible: anatomy.getSelectedSymptomsList().isNotEmpty,
                    //   child: Text(
                    //     "Selected Symptoms",
                    //     style: TextStyle(
                    //         fontSize: 12.sp,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: anatomy.favourite.isEmpty ? 0 : 100.h,
                      child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            //  anatomy.selecteddata.length,
                            anatomy.favourite.length,
                        itemBuilder: (context, index) {
                          var at = anatomy.favourite[index];
                          //   etSelectedSymptomsList()[index];
                          return Card(
                            child: ListTile(
                              title: Text(
                                "${at.symptomName}",
                                style: Style.alltext_default_balck,
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.primary_color,
                                ),
                                onPressed: () {
                                  anatomy.favourite.removeAt(index);
                                  setState(() {});
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),

            SizedBox(
              height: 10.h,
            ),
            // Visibility(
            //   visible: appointmentViewModel.isChamber,
            //   replacement: ListView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: appointmentViewModel.onlineList.length,
            //       itemBuilder: (context, index) {
            //         OnlineModel on = appointmentViewModel.onlineList[index];
            //         return Card(
            //           color: on.isSelected ? Colors.white : Colors.white38,
            //           child: ListTile(
            //             onTap: () {
            //               appointmentViewModel.selectOnline(index);
            //             },
            //             leading: CircleAvatar(
            //               backgroundColor: AppColors.primaryColor,
            //               child: Icon(
            //                 on.iconData,
            //                 color: Colors.white,
            //                 size: 15.h,
            //               ),
            //             ),
            //             title: Text(
            //               on.title,
            //               style: TextStyle(
            //                   fontSize: 12.sp,
            //                   fontWeight: FontWeight.bold,
            //                   color: const Color(0xFF646464)),
            //             ),
            //             subtitle: Text(
            //               on.subTitle,
            //               style: TextStyle(
            //                   fontSize: 12.sp, color: const Color(0xFF646464)),
            //             ),
            //             trailing: Text(
            //               "${on.amount} BDT",
            //               style: TextStyle(
            //                   fontSize: 12.sp,
            //                   fontWeight: FontWeight.w500,
            //                   color: AppColors.primaryColor),
            //             ),
            //           ),
            //         );
            //       }),
            //   child: Container(),
            // ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      // width: 250.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${widget.doctors.doctors!.title!.titleName.toString()} ${widget.doctors.doctors!.drGivenName.toString()} ${widget.doctors.doctors!.drMiddleName.toString()} ${widget.doctors.doctors!.drLastName.toString()}"),
                          Style.distan_size2,
                          widget.doctors.doctors!.usualProvider != null
                              ? Text(
                                  "${widget.doctors.doctors!.usualProvider!.usualProviderName.toString()}")
                              : Container(),
                          Style.distan_size2,
                          appointmentViewModel.isChamber.toString() == ""
                              ? Container()
                              : Row(
                                  children: [
                                    Text("Appointment Type "),
                                    Text(": "),
                                    Text(appointmentViewModel.isChamber
                                                .toString() ==
                                            "Chamber"
                                        ? "Chamber"
                                        : "Online"),
                                  ],
                                ),
                          Style.distan_size2,
                          appointmentViewModel.morningeveingButton.toString() ==
                                  ""
                              ? Container()
                              : Row(
                                  children: [
                                    Text("Appointment Time "),
                                    Text(": "),
                                    Text(appointmentViewModel
                                                .morningeveingButton
                                                .toString() ==
                                            "morning"
                                        ? "Morning"
                                        : "Evening"),
                                  ],
                                ),
                          Style.distan_size2,
                          Row(
                            children: [
                              Text("Appointment Fees "),
                              Text(": "),
                              Text(
                                  //
                                  // appointmentViewModel.isChamber
                                  // ?
                                  widget.amount
                                  // : appointmentViewModel.online_amount
                                  //     .toString()
                                  ),
                            ],
                          ),
                          Style.distan_size2,
                          appointmentViewModel.selectedDatee != null
                              ? Row(
                                  children: [
                                    Text("Appointment Date"),
                                    Text(": "),
                                    Text(
                                        "${appointmentViewModel.selectedDatee!.day}-${appointmentViewModel.selectedDatee!.month}-${appointmentViewModel.selectedDatee!.year}"
                                        // DateFormat("dd-MM-yyyy").format(DateTime.parse(
                                        //     appointmentViewModel.date.toString())),
                                        ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            appointmentViewModel.doctorTimeSlotList.isEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 6.0, top: 8, right: 6),
                    child: SizedBox(
                      child: Image.asset(Assets.noappoinment),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      );
    });
  }

  String formatSpecificTime(String inputTime) {
    // Assuming the inputTime is in the "HH:mm" format
    DateTime dateTime = DateFormat('HH:mm').parse(inputTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }
}
