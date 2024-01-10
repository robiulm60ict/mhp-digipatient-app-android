import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/anatomy/anatomy_symptoms_model.dart';

import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view/anatomy/anatomy_view.dart';
import 'package:digi_patient/view/payment/payment_method_view.dart';
import 'package:digi_patient/view_model/anatomy/anatomy_view_model.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/doctor/my_doctor_view_model.dart';
import '../../widgets/back_button.dart';

import '../../widgets/shimmer.dart';

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
    // context
    //     .read<MyDoctorViewModel>()
    //     .getDocChamberTime(context, docId: widget.doctors.doctorsMasterId);
    // context.read<AnatomyModelView>().getSelectedSymptomsList();
  }

  bool isHospitalSelected = true;

  @override
  Widget build(BuildContext context) {
    // final myDocVM = Provider.of<MyDoctorViewModel>(context,listen: false);
    final anatomy = Provider.of<AnatomyModelView>(context, listen: false);

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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // String date = appointmentViewModel.appointmentDate.toString();
            // appointmentViewModel.setBody(docIcd: "${widget.doctors.id}", patientId: "$patientId", date: date, appointmentType: isChamber ? "Chamber" : "Online", disease: "[asd, asdf]", paymentType: "Bkash", amount: "1200", trNxNo: "tr1205");
            // appointmentViewModel.bookAppointment(context, body: appointmentViewModel.body);
            print(appointmentViewModel.isChamber ? widget.amount : "0");
            List<SymptomsAnatomy> diseaseList =
                anatomy.getSelectedSymptomsList();

            if (anatomy.favourite.isEmpty) {
              Messages.snackBar(context, "Please Select Symptoms!");
            } else {
              print(
                "${DateFormat("dd-MM-yyyy H:m").format(DateTime.parse("${appointmentViewModel.date.toString()}"))}",
              );
              print(appointmentViewModel.date.toString());

              await appointmentViewModel.getPatientId().then((value) =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PaymentMethodView(
                              appointmentDate:
                                  appointmentViewModel.date.toString(),
                              appointmentType: appointmentViewModel.isChamber
                                  ? "Chamber"
                                  : "Telehealth",
                              doctorId: "${widget.doctors.doctorsMasterId}",
                              patientId: "$value",
                              amount: widget.amount,
                              doctor: widget.doctors,
                              diseaseList: anatomy.favourite,
                              shiftType: appointmentViewModel.morningButton
                                  ? "Morning"
                                  : "Evening"))));

              setState(() {
                appointmentViewModel.date = DateTime.now();
                anatomy.favourite.clear();

                anatomy.symptomsList.clear();

                anatomy.getSymptomsList.clear();
              });
            }
          },
          backgroundColor: AppColors.primaryColor,
          label: Text(
            "Confirm Appointment",
            style: Style.alltext_appbar,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          padding: EdgeInsets.all(10.r),
          children: [
            TextButton(
                onPressed: () async {
                  //   await appointmentViewModel.setAppointmentDate(context);
                },
                child: Text(
                  "${appointmentViewModel.date.day} -${appointmentViewModel.date.month}  -${appointmentViewModel.date.year}",
                  style: Style.alltext_default_balck,
                )),
            WeeklyDatePicker(
              enableWeeknumberText: false,
              //  weekdayText: "data",
              selectedDay: appointmentViewModel.date,

              //weeknumberColor: const Color(0xFF57AF87),
              weeknumberTextColor: Colors.white,
              //  backgroundColor: const Color(0xFF1A1A1A),
              weekdayTextColor: const Color(0xFF8A8A8A),
              //  digitsColor: Colors.white,
              // selectedBackgroundColor: const Color(0xFF57AF87),
              // weekdays: const ["Mo", "Tu", "We", "Th", "Fr","Sa","Su"],
              // daysInWeek: 7,
              // DateTime
              changeDay: (value) => setState(() {
                print(value);

                // setState(() {
                appointmentViewModel.date = value;
                // });// = value;
              }),
            ),

            // const SizedBox(
            //   height: 10,
            // ),

            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: appointmentViewModel.isChamber
                        ? AppColors.primaryColor
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.appoinmentchamber();
                      },
                      leading: Image.asset(
                        Assets.imagesChamber,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        "CHAMBER",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.isChamber
                                ? Colors.white
                                : AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: appointmentViewModel.isChamber
                        ? Colors.white
                        : AppColors.primaryColor,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.appoinmentonline();
                      },
                      leading: Image.asset(
                        Assets.imagesMobile,
                        height: 20.h,
                        width: 10.w,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        "ONLINE",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.isChamber
                                ? AppColors.primaryColor
                                : AppColors.whiteColor),
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
                    color: appointmentViewModel.morningButton
                        ? AppColors.primaryColor
                        : Colors.white,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.appoinmenttimemorning();
                      },
                      leading: Image.asset(
                        appointmentViewModel.morningButton
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
                            color: appointmentViewModel.morningButton
                                ? Colors.white
                                : AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    color: appointmentViewModel.morningButton
                        ? Colors.white
                        : AppColors.primaryColor,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.appoinmenttimeeveing();
                      },
                      leading: Image.asset(
                        appointmentViewModel.morningButton
                            ? Assets.imagesNightActive
                            : Assets.imagesNightInActive,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.fill,
                      ),
                      title: Text(
                        "EVENING",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appointmentViewModel.morningButton
                                ? AppColors.primaryColor
                                : AppColors.whiteColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
                 height: 150.h,
                child: Consumer<MyDoctorViewModel>(
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
                return ListView.builder(
                  itemCount: data.doctorTimeSlotList.length,
                  // scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var docTime = data.doctorTimeSlotList[index];
                    return Center(
                      child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                            Text(
                              "${docTime.day}",
                              style: Style.alltext_default_balck,
                            ),
                            Text(
                              "${docTime.slotFrom.toString()} To ${docTime.slotTo.toString()}",
                              style: Style.alltext_default_balck,
                            ),

                            Text(
                              "${docTime.type.toString().toUpperCase()}",
                                       style: Style.alltext_default_balck,
                                     ),
                        ],
                      ),
                          )

                          // ListTile(
                          //   title: Text(
                          //     //{docTime.day}-
                          //     "${docTime.day}",
                          //     style: Style.alltext_default_balck,
                          //   ),
                          //   subtitle: Text(
                          //     "${docTime.slotFrom.toString()} To ${docTime.slotTo.toString()}",
                          //     style: Style.alltext_default_balck,
                          //   ),
                          //   trailing: Column(
                          //     children: [
                          //       Text(
                          //         "${docTime.type.toString().toUpperCase()}",
                          //         style: Style.alltext_default_balck,
                          //       ),
                          //       Style.distan_size2,
                          //       Text(
                          //         docTime.status.toString()=="off_duty"?"Off Day" :"",
                          //         style: Style.alltext_default_balck,
                          //       ),
                          //     ],
                          //   ),
                          //
                          // )
                          ),
                    );
                  },
                );

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
                      height: anatomy.favourite.isEmpty?0: 100.h,
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
                          Row(
                            children: [
                              Text("Appointment Type "),
                              Text(": "),
                              Text(appointmentViewModel.isChamber
                                  ? "Chamber"
                                  : "Online"),
                            ],
                          ),
                          Style.distan_size2,
                          Row(
                            children: [
                              Text("Appointment Time "),
                              Text(": "),
                              Text(appointmentViewModel.morningButton
                                  ? "morning"
                                  : "evening"),
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
                          Row(
                            children: [
                              Text("Appointment Date "),
                              Text(": "),
                              Text(
                                DateFormat(
                                    "dd-MM-yyyy")
                                    .format(DateTime.parse(appointmentViewModel.date
                                    .toString())),
                              ),

                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      );
    });
  }
}
