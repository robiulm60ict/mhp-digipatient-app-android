import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/doctor_model/doctor_chember_time_model.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/custom_rating.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../utils/utils.dart';
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
    return Scaffold(
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
            height: 200.h,
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
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${doc?.doctors?.department?.departmentsName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.white),
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
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 45.h,
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
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45.h,
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
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      children: [
                                        TextSpan(
                                          text: "BDT",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white),
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
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 70.h,
                          backgroundColor: AppColors.linearGradient1,
                        ),
                      ),
                      Image.network(
                        "${AppUrls.docImage}${doc?.doctors?.drImages}",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            const CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 40,
                        ),
                      ),
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
              padding: EdgeInsets.all(20.r),
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
                            "3000+",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          subtitle: Text(
                            "Patients",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
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
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          subtitle: Text(
                            "Experience",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Specialty",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF646464)),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Wrap(
                        spacing: 5,
                        children: [
                          Card(
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.all(3.0.r),
                              child: Text(
                                "${doc?.doctors!.specialist?.specialistsName.toString()}",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xFF8A8A8A)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "About Doctor",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF646464)),
                ),
                ReadMoreText(
                  "${doc?.doctors?.drAbout.toString()}",
                  trimLines: 5,
                  colorClickableText: Colors.pink,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'See All',
                  trimExpandedText: 'See less',
                  moreStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                  lessStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor),
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Schedule",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF646464)),
                ),
                SizedBox(
                  height: 20.h,
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
                              elevation: 5,
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
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primaryColor),
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
                SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r))),
                    onPressed: () {
                      context.router.push(BookAppointmentRoute(
                          doctors: doc!,
                          amount:
                          "${doc?.doctors?.doctorFee ?? "0"} "));
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
