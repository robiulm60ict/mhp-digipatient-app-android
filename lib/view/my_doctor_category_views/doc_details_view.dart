import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/doctor_model/doctor_chember_time_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/custom_rating.dart';
import 'package:digi_patient/view/appointment/book_appointment_view.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../utils/utils.dart';
import '../../view_model/appointment_view_model/appointment_view_model.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import '../../widgets/back_button.dart';

class DocDetailsView extends StatefulWidget {
  const DocDetailsView({Key? key, required this.id}) : super(key: key);
  final num id;

  @override
  State<DocDetailsView> createState() => _DocDetailsViewState();
}

class _DocDetailsViewState extends State<DocDetailsView> {
  // ScrollController listViewController = ScrollController();
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   // listViewController.dispose();
  // }
  Datum? doc;

  @override
  void initState() {
    super.initState();
    getDoctor(widget.id);
  }

  getDoctor(num id) async {
    doc = context
        .read<MyDoctorDelaisViewModel>()
        .myDoctorList
        .firstWhere((element) => element.doctorsMasterId == id) as Datum?;

    // await context.read<MyDoctorViewModel>().getDoctorFee(doc?.id);
    await context
        .read<MyDoctorViewModel>()
        .getDocChamberTime(context, docId: doc?.id);
    setState(() {});
  }

  double rating = 3;

  @override
  Widget build(BuildContext context) {
    final mdVM = Provider.of<MyDoctorViewModel>(context);
    final appointmentViewModel = Provider.of<AppointmentViewModel>(context);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child:  SizedBox(
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r))),
            onPressed: () {
             appointmentViewModel.selectButton(0);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookAppointmentView(doctors: doc!, amount: "${doc?.doctors?.doctorFee==null? "0":doc?.doctors?.doctorFee} ")));

              // context.router.push(BookAppointmentRoute(
              //     doctors: doc!,
              //     amount:
              //     "${doc?.doctors?.doctorFee ?? "0"} "));
            },
            child: Text(
              "Request For Appointment",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.linearGradient2,
      ),
      backgroundColor: Colors.white,
      body: Column(
        // alignment: Alignment.topCenter,
        // controller: listViewController,
        // shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: 160.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.linearGradient2,
                  AppColors.linearGradient1,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.w, top: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${doc?.doctors?.title} ${doc?.doctors?.drMiddleName} ${doc?.doctors?.drGivenName} ${doc?.doctors?.drLastName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:Style.alltext_default_balck_blod,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${doc?.doctors?.department?.departmentsName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:Style.alltext_default_balck,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            CustomRating.ratingBar(
                                itemSize: 20,
                                ignoreGestures: false,
                                onRatingUpdate: (rati) {
                                  rating = rati;
                                  setState(() {});
                                }),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              "$rating",
                                style: Style.alltext_default_balck,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.r),
                                      bottomLeft: Radius.circular(5.r)),
                                  border: Border.all(
                                      color: Colors.white, width: 0.5)),
                              child: const Icon(
                                Icons.money,
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 40.h,
                                // width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(5.r),
                                      bottomRight: Radius.circular(5.r)),
                                  border: Border.all(
                                      color: Colors.white, width: 0.5),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                      text:
                                          "${doc?.doctors?.doctorFee ?? "0"} ",
                                      style: Style.alltext_default_balck,
                                      children: [
                                        TextSpan(
                                          text: "BDT",
                                          style: Style.alltext_default_balck,
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: AppColors.linearGradient1,
                          backgroundImage: NetworkImage( "${AppUrls.docImage}${doc?.doctors?.drImages}"),
                        ),
                      ),
                      // Image.network(
                      //   "${AppUrls.docImage}${doc?.doctors?.drImages}",
                      //   height:70.h,
                      //   width: 70.w,
                      //   fit: BoxFit.fill,
                      //   errorBuilder: (context, error, stackTrace) =>
                      //       const CircleAvatar(
                      //     backgroundColor: Colors.red,
                      //     radius: 40,
                      //   ),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              // controller: listViewController,
              // shrinkWrap: true,
              //   physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12.r),
              children: [
                // SizedBox(height: 10,)
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(
                            Icons.people,
                            color: AppColors.primaryColor,
                          ),
                          title: Text(
                            "1000+",
                            style:Style.alltext_default_balck,
                          ),
                          subtitle: Text(
                            "Patients",
                            style:
                            Style.alltext_default_balck,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          leading: Icon(
                            Icons.cases_outlined,
                            color: AppColors.primaryColor,
                          ),
                          title: Text(
                            "${doc?.doctors?.workExperienceYears.toString()} years",
                            style: Style.alltext_default_balck,
                          ),
                          subtitle: Text(
                            "Experience",
                            style:
                            Style.alltext_default_balck,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Text(
                      "Specialities",
                      style: Style.alltext_default_balck_blod,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding: EdgeInsets.all(0.r),
                        child: Text(
                          "${doc?.doctors!.specialist?.specialistsName.toString()}",
                          style: Style.alltext_default_balck,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "About Doctor",
                  style: Style.alltext_default_balck_blod,
                ),
                ReadMoreText(
                  "${doc?.doctors?.drAbout.toString()}",
                  trimLines: 3,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'See All',
                  trimExpandedText: 'See less',
                  moreStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                  lessStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Schedule",
                  style: Style.alltext_default_balck_blod,
                ),
                SizedBox(
                  height: 10.h,
                ),

                SizedBox(
                  height: 70.h,
                  child: mdVM.isDocChamberTimeLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: mdVM.doctorTimeSlotList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            DocTimeSlot docTime =
                                mdVM.doctorTimeSlotList[index];
                            bool isMorning =
                                docTime.type?.toLowerCase() == "morning";
                            return Card(
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0.h, horizontal: 16.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${docTime.day}-${docTime.month}-${docTime.year}",
                                      style:Style.alltext_default_balck,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          isMorning
                                              ? Assets.imagesDayActive
                                              : Assets.imagesDayInActive,
                                          height: 20.h,
                                          width: 20.w,
                                          fit: BoxFit.fill,
                                        ),
                                        SizedBox(
                                          width: 8.w,
                                        ),
                                        Image.asset(
                                          isMorning
                                              ? Assets.imagesNightInActive
                                              : Assets.imagesNightActive,
                                          height: 20.h,
                                          width: 20.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
                SizedBox(
                  height: 20.h,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
