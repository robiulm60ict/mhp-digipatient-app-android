import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/anatomy/anatomy_symptoms_model.dart';
import 'package:digi_patient/model/doctor_model/doctor_chember_time_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/model/online_model/online_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view_model/anatomy/anatomy_view_model.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../utils/utils.dart';
import '../../view_model/doctor/my_doctor_view_model.dart';
import '../../widgets/back_button.dart';

import 'package:carousel_slider/carousel_slider.dart';

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
    context.read<MyDoctorViewModel>().getDoctorFee(widget.doctors.id);
    context.read<AppointmentViewModel>().setWeekDays();
    context
        .read<MyDoctorViewModel>()
        .getDocChamberTime(context, docId: widget.doctors.id);
    context.read<AnatomyModelView>().getSelectedSymptomsList(setEmpty: true);
  }

  bool morningButton = true;
  bool isChamber = true;
  bool isHospitalSelected = true;

  @override
  Widget build(BuildContext context) {
    final appointmentViewModel = Provider.of<AppointmentViewModel>(context);
    final myDocVM = Provider.of<MyDoctorViewModel>(context);
    final anatomy = Provider.of<AnatomyModelView>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Appointment ",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
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
          List<SymptomsAnatomy> diseaseList = anatomy.getSelectedSymptomsList();
         if (diseaseList.isNotEmpty) {
            await appointmentViewModel.getPatientId().then((value) =>
                context.router.push(PaymentMethodRoute(
                    appointmentDate:
                        appointmentViewModel.appointmentDate.toString(),
                    appointmentType: isChamber ? "Chamber" : "Online",
                    doctorId: "${widget.doctors.id}",
                    patientId: "$value",
                    amount: widget.amount,
                    doctor: widget.doctors,
                    diseaseList: diseaseList)));
          } else {
           Messages.snackBar(context, "Please Select Disease!");
         }
        },
        backgroundColor: AppColors.primaryColor,
        label: Text(
          "Confirm Appointment",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          TextButton(
              onPressed: () async {
                await appointmentViewModel.setAppointmentDate(context);
              },
              child: Text(
                "${appointmentViewModel.monthName}  ${appointmentViewModel.year}",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF646464)),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(appointmentViewModel.weekDayList.length,
                  (index) {
                WeekDayModel avm = appointmentViewModel.weekDayList[index];
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      appointmentViewModel.selectButton(index);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      color: avm.isSelected
                          ? AppColors.primaryColor
                          : Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              avm.weekName,
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: avm.isSelected
                                      ? Colors.white
                                      : const Color(0xFF646464)),
                            ),
                            Text(
                              avm.day.toString(),
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: avm.isSelected
                                      ? Colors.white
                                      : const Color(0xFF646464)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  color: isChamber ? AppColors.primaryColor : Colors.white,
                  child: ListTile(
                    onTap: () {
                      isChamber = true;
                      setState(() {});
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
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: isChamber
                              ? Colors.white
                              : AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: isChamber ? Colors.white : AppColors.primaryColor,
                  child: ListTile(
                    onTap: () {
                      isChamber = false;
                      setState(() {});
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
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: isChamber
                              ? AppColors.primaryColor
                              : AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  color: morningButton ? AppColors.primaryColor : Colors.white,
                  child: ListTile(
                    onTap: () {
                      morningButton = true;
                      setState(() {});
                    },
                    leading: Image.asset(
                      morningButton
                          ? Assets.imagesDayInActive
                          : Assets.imagesDayActive,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      "MORNING",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: morningButton
                              ? Colors.white
                              : AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Card(
                  color: morningButton ? Colors.white : AppColors.primaryColor,
                  child: ListTile(
                    onTap: () {
                      morningButton = false;
                      setState(() {});
                    },
                    leading: Image.asset(
                      morningButton
                          ? Assets.imagesNightActive
                          : Assets.imagesNightInActive,
                      height: 20.h,
                      width: 20.w,
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      "EVENING",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: morningButton
                              ? AppColors.primaryColor
                              : AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 80.h,
            child: myDocVM.isDocChamberTimeLoading ||
                    myDocVM.doctorTimeSlotList.isEmpty
                ? const Center(
                    child: Text("No  Data"),
                  )
                : CarouselSlider.builder(
                    // scrollDirection: Axis.horizontal,
                    itemCount: myDocVM.doctorTimeSlotList.length,
                    itemBuilder:
                        (BuildContext context, int index, int pageViewIndex) {
                      DocTimeSlots docTime = myDocVM.doctorTimeSlotList[index];
                      return Center(
                        child: Card(
                            child: ListTile(
                          title: Text(
                              "${docTime.day}-${docTime.month}-${docTime.year}"),
                          subtitle: Text(
                              "${myDocVM.getTime(docTime.slotFrom)} To ${myDocVM.getTime(docTime.slotTo)}"),
                          trailing: Text("${docTime.type}"),
                        )),
                      );
                    },
                    options: CarouselOptions(
                      // height: 400,
                      // aspectRatio: 16/9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 1600),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      // enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                    // itemBuilder: (context, index) => Card(
                    //   color: index == 1 ? AppColors.primaryColor : Colors.white,
                    //   child: Padding(
                    //     padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                    //     child: Text("9.30AM", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: index == 1 ? Colors.white : const Color(0xFF646464)),),
                    //   ),
                    // ),
                  ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              context.router.push(const AnatomyRoute());
            },
            child: Card(
              color: AppColors.primaryColor,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
                child: Text(
                  "Select Disease",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Visibility(
            visible: isChamber,
            // replacement: Column(
            //   children: [
            //     ListTile(
            //       onTap: (){},
            //       leading: CircleAvatar(
            //         backgroundColor: AppColors.primaryColor,
            //         child:  Icon(Icons.call, color: Colors.white, size: 15.h,),
            //       ),
            //       title: Text("Voice Call", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF646464)),),
            //       subtitle: Text("Can you make voice call", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //     trailing: Text("150.00 BDT", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
            //     ),
            //     ListTile(
            //       onTap: (){},
            //       leading: CircleAvatar(
            //         backgroundColor: AppColors.primaryColor,
            //         child:  Icon(Icons.video_call, color: Colors.white, size: 15.h,),
            //       ),
            //       title: Text("Video Call", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF646464)),),
            //       subtitle: Text("Can you make video call", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //     trailing: Text("1500.00 BDT", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
            //     ),
            //     ListTile(
            //       onTap: (){},
            //       leading: CircleAvatar(
            //         backgroundColor: AppColors.primaryColor,
            //         child:  Icon(Icons.message, color: Colors.white, size: 15.h,),
            //       ),
            //       title: Text("Messaging", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xFF646464)),),
            //       subtitle: Text("Can messaging with Doctor", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //     trailing: Text("100.00 BDT", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
            //     ),
            //
            //   ],
            // ),
            replacement: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appointmentViewModel.onlineList.length,
                itemBuilder: (context, index) {
                  OnlineModel on = appointmentViewModel.onlineList[index];
                  return Card(
                    color: on.isSelected ? Colors.white : Colors.white38,
                    child: ListTile(
                      onTap: () {
                        appointmentViewModel.selectOnline(index);
                      },
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primaryColor,
                        child: Icon(
                          on.iconData,
                          color: Colors.white,
                          size: 15.h,
                        ),
                      ),
                      title: Text(
                        on.title,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF646464)),
                      ),
                      subtitle: Text(
                        on.subTitle,
                        style: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF646464)),
                      ),
                      trailing: Text(
                        "${on.amount} BDT",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                      ),
                    ),
                  );
                }),

            child: Card(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      isHospitalSelected = !isHospitalSelected;
                      setState(() {});
                    },
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(Assets.imagesHospitalLogo),
                    ),
                    title: Text(
                      "${widget.doctors!.doctors?.usualProvider?.usualProviderName.toString()}",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor),
                    ),
                    trailing: Icon(
                      Icons.check_circle_rounded,
                      color: isHospitalSelected
                          ? AppColors.primaryColor
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        appointmentViewModel.weekDayList.length, (index) {
                      WeekDayModel avm =
                          appointmentViewModel.weekDayList[index];
                      return Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(4.0.r),
                          child: Text(
                            avm.weekName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xFF646464)),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Visibility(
            visible: anatomy.getSelectedSymptomsList().isNotEmpty,
            child: Text(
              "Selected Diseases",
              style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: anatomy.getSelectedSymptomsList().length,
            itemBuilder: (context, index) {
              SymptomsAnatomy at = anatomy.getSelectedSymptomsList()[index];
              return Card(
                child: ListTile(
                  title: Text(
                    "${at.symptomName}",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}
