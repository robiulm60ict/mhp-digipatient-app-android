import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/anatomy/anatomy_symptoms_model.dart';
import 'package:digi_patient/model/doctor_model/doctor_chember_time_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/online_model/online_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view/anatomy/anatomy_view.dart';
import 'package:digi_patient/view/payment/payment_method_view.dart';
import 'package:digi_patient/view_model/anatomy/anatomy_view_model.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
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

                await appointmentViewModel.getPatientId().then((value) =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentMethodView(
                                appointmentDate: appointmentViewModel.date
                                    .toString()
                                    .split(" ")
                                    .first,
                                appointmentType: appointmentViewModel.isChamber
                                    ? "Chamber"
                                    : "Telehealth",
                                doctorId: "${widget.doctors.doctorsMasterId}",
                                patientId: "$value",
                                amount: widget.amount
                                    ,
                                doctor: widget.doctors,
                                diseaseList: anatomy.favourite,
                                shiftType: appointmentViewModel.morningButton
                                    ? "morning"
                                    : "evening"))));

                setState(() {
                  appointmentViewModel.date = DateTime.now();

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
              selectedBackgroundColor: const Color(0xFF57AF87),
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
            // Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: List.generate(appointmentViewModel.weekDayList.length,
            //         (index) {
            //       WeekDayModel avm = appointmentViewModel.weekDayList[index];
            //       return Expanded(
            //         child: InkWell(
            //           onTap: () {
            //             appointmentViewModel.selectButton(index);
            //           },
            //           child: Card(
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(6.r)),
            //             color: avm.isSelected
            //                 ? AppColors.primaryColor
            //                 : Colors.white,
            //             child: Padding(
            //               padding: EdgeInsets.symmetric(vertical: 6.0.h),
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
            //                 children: [
            //                   Text(
            //                     avm.weekName,
            //                     style: Style.alltext_default_balck,
            //                   ),
            //                   Text(
            //                     avm.day.toString(),
            //                     style: Style.alltext_default_balck,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     })),
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
            // SizedBox(
            //   height: 80.h,
            //   child: myDocVM.isDocChamberTimeLoading ||
            //           myDocVM.doctorTimeSlotList.isEmpty
            //       ? const Center(
            //           child: Text("No  Data"),
            //         )
            //       : CarouselSlider.builder(
            //           // scrollDirection: Axis.horizontal,
            //           itemCount: myDocVM.doctorTimeSlotList.length,
            //           itemBuilder:
            //               (BuildContext context, int index, int pageViewIndex) {
            //             DocTimeSlot docTime = myDocVM.doctorTimeSlotList[index];
            //             return Center(
            //               child: Card(
            //                   child: ListTile(
            //                       title: Text(
            //                         "${docTime.day}-${docTime.month}-${docTime.year}",
            //                         style: Style.alltext_default_balck,
            //                       ),
            //                       subtitle: Text(
            //                         "${myDocVM.getTime(docTime.slotFrom.toString())} To ${myDocVM.getTime(docTime.slotTo.toString())}",
            //                         style: Style.alltext_default_balck,
            //                       ),
            //                       trailing: Text(
            //                         "${docTime.type}",
            //                         style: Style.alltext_default_balck,
            //                       ))),
            //             );
            //           },
            //           options: CarouselOptions(
            //             // height: 400,
            //             // aspectRatio: 16/9,
            //             viewportFraction: 0.8,
            //             initialPage: 0,
            //             enableInfiniteScroll: true,
            //             reverse: false,
            //             autoPlay: true,
            //             autoPlayInterval: const Duration(seconds: 3),
            //             autoPlayAnimationDuration:
            //                 const Duration(milliseconds: 1600),
            //             autoPlayCurve: Curves.fastOutSlowIn,
            //             enlargeCenterPage: true,
            //             // enlargeFactor: 0.3,
            //             scrollDirection: Axis.horizontal,
            //           ),
            //           // itemBuilder: (context, index) => Card(
            //           //   color: index == 1 ? AppColors.primaryColor : Colors.white,
            //           //   child: Padding(
            //           //     padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
            //           //     child: Text("9.30AM", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: index == 1 ? Colors.white : const Color(0xFF646464)),),
            //           //   ),
            //           // ),
            //         ),
            // ),
            // SizedBox(
            //     height: 80.h,
            //     child: Consumer<MyDoctorViewModel>(
            //         builder: (context, myDocVM, child) {
            //       if (myDocVM.doctorTimeSlotList.isEmpty) {
            //         return myDocVM.isDocChamberTimeLoading == true
            //             ? ListView.builder(
            //                 itemCount: 6,
            //                 // scrollDirection: Axis.vertical,
            //                 physics: const ScrollPhysics(),
            //                 shrinkWrap: true,
            //                 itemBuilder: (context, index) {
            //                   return Padding(
            //                     padding: const EdgeInsets.all(5.0),
            //                     child: bannerShimmereffect(
            //                         90.toDouble(), 385.toDouble()),
            //                   );
            //                 },
            //               )
            //             : noDataFounForList("No History");
            //       } else {
            //         return CarouselSlider.builder(
            //           // scrollDirection: Axis.horizontal,
            //           itemCount: myDocVM.doctorTimeSlotList.length,
            //           itemBuilder:
            //               (BuildContext context, int index, int pageViewIndex) {
            //             DocTimeSlot docTime = myDocVM.doctorTimeSlotList[index];
            //             return Center(
            //               child: Card(
            //                   child: ListTile(
            //                       title: Text(
            //                         //{docTime.day}-
            //                         "${docTime.month}-${docTime.year}",
            //                         style: Style.alltext_default_balck,
            //                       ),
            //                       subtitle: Text(
            //                         "${myDocVM.getTime(docTime.slotFrom.toString())} To ${myDocVM.getTime(docTime.slotTo.toString())}",
            //                         style: Style.alltext_default_balck,
            //                       ),
            //                       trailing: Text(
            //                         "${docTime.type}",
            //                         style: Style.alltext_default_balck,
            //                       ))),
            //             );
            //           },
            //           options: CarouselOptions(
            //             // height: 400,
            //             // aspectRatio: 16/9,
            //             viewportFraction: 0.8,
            //             initialPage: 0,
            //             enableInfiniteScroll: true,
            //             reverse: false,
            //             autoPlay: true,
            //             autoPlayInterval: const Duration(seconds: 3),
            //             autoPlayAnimationDuration:
            //                 const Duration(milliseconds: 1600),
            //             autoPlayCurve: Curves.fastOutSlowIn,
            //             enlargeCenterPage: true,
            //             // enlargeFactor: 0.3,
            //             scrollDirection: Axis.horizontal,
            //           ),
            //           // itemBuilder: (context, index) => Card(
            //           //   color: index == 1 ? AppColors.primaryColor : Colors.white,
            //           //   child: Padding(
            //           //     padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
            //           //     child: Text("9.30AM", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: index == 1 ? Colors.white : const Color(0xFF646464)),),
            //           //   ),
            //           // ),
            //         );
            //       }
            //     })),
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
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                            trailing: IconButton(icon: Icon(Icons.delete,color: AppColors.primary_color,),onPressed: (){
                              anatomy.favourite.removeAt(index);
                              setState(() {

                              });

                            },),
                          ),
                        );
                      },
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
                              Text(appointmentViewModel.date
                                  .toString()
                                  .split(" ")
                                  .first),
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
