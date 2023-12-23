import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:digi_patient/utils/custom_rating.dart';
import 'package:digi_patient/view/appointment/book_appointment_view.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/doctor_model/doctor_chember_time_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../utils/utils.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';

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
    print(widget.id);
    getDoctor(widget.id);
    context.read<MyDoctorViewModel>().getSocialMediea(widget.id.toString());

    context
        .read<MyDoctorViewModel>()
        .getDocChamberTime(context, docId: widget.id.toString());
  }

  getDoctor(id) async {
    doc = context
        .read<MyDoctorDelaisViewModel>()
        .myDoctorList
        .firstWhere((element) => element.doctorsMasterId == id) as Datum?;

    // await context.read<MyDoctorViewModel>().getDoctorFee(doc?.id);
    //  context
    //     .read<MyDoctorViewModel>()
    //     .getDocChamberTime(context, docId: doc?.id);
    //  setState(() {});
  }

  double rating = 3;

  @override
  Widget build(BuildContext context) {
    final mdVM = Provider.of<MyDoctorViewModel>(context, listen: false);
    // final appointmentViewModel = Provider.of<AppointmentViewModel>(context);

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_color,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r))),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookAppointmentView(
                          doctors: doc!,
                          amount:
                              "${doc?.doctors?.doctorFee == null ? "0" : doc?.doctors?.doctorFee} ")));

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
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.w, top: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${doc?.doctors!.title!.titleName.toString()} ${doc?.doctors?.fullName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.alltext_default_balck_blod,
                        ),
                        doc!.doctors!.academic!.isNotEmpty
                            ? SizedBox(
                                height: 8.h,
                              )
                            : SizedBox(),
                        doc!.doctors!.academic!.isNotEmpty
                            ? Row(
                                children: List.generate(
                                    doc!.doctors!.academic!.length, (index) {
                                var data = doc!.doctors!.academic![index];
                                return Center(
                                  //  width: Get.size.width*0.26,
                                  child: Text(
                                      "${data.degreeId}${doc!.doctors!.academic!.last == data ? "" : ", "}",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Style.alltext_ExtraSmall_black),
                                );
                              }))
                            : Container(),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${doc?.doctors?.department?.departmentsName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.alltext_default_balck,
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
                                  // setState(() {});
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
                                child: Text(
                                  "৳",
                                  style: Style.alltext_ExtraLarge_black,
                                )
                                // const Icon(
                                //   Icons.money,
                                //   color: Colors.black,
                                // ),
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
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: AppColors.linearGradient1,
                          backgroundImage: NetworkImage(
                              "${AppUrls.docImage}${doc?.doctors?.drImages}"),
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
                            style: Style.alltext_default_balck,
                          ),
                          subtitle: Text(
                            "Patients",
                            style: Style.alltext_default_balck,
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
                            style: Style.alltext_default_balck,
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
                      elevation: 0,
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
                  height: 5.h,
                ),
                Container(
                  height: 40.h,
                  child: Consumer<MyDoctorViewModel>(
                      builder: (context, data, child) {
                    if (data.sociallist.isEmpty) {
                      return Center(
                        child: Text(
                          "No Social Media",
                          style: Style.alltext_default_balck,
                        ),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: data.sociallist.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            var info = data.sociallist[index];
                            return Container(
                              height: 40.h,
                              width: 40.w,
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                height: 80.h,
                                width: 70,
                                color: Colors.white,
                                padding: const EdgeInsets.all(4.0),
                                child: SizedBox(
                                    width: 80.w,
                                    child: InkWell(
                                      onTap: () async {
                                        await launch(info.url.toString());

                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             SocialWebviewView(
                                        //               url: info.url,
                                        //             )));
                                      },
                                      child: CircleAvatar(
                                        maxRadius: 10,
                                        backgroundImage: AssetImage(info.name
                                                    .toString() ==
                                                "FaceBook"
                                            ? Assets.facebook
                                            : (info.name.toString() == "Youtube"
                                                ? Assets.youtube
                                                : (info.name.toString() ==
                                                        "LinkedIn"
                                                    ? Assets.linkedin
                                                    : ((info.name.toString() ==
                                                            "Twitter"
                                                        ? Assets.twitter
                                                        : Assets.homeMyRec))))),
                                      ),
                                    )),
                              ),
                            );
                          });
                    }
                  }),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "About Doctor",
                  style: Style.alltext_default_balck_blod,
                ),
                SizedBox(
                  height: 10.h,
                ),
                doc?.doctors!.drAbout.toString() != "null"
                    ? ReadMoreText(
                        "${doc?.doctors?.drAbout.toString() ?? ""}",
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
                        style: Style.alltext_default_balck,
                      )
                    : Text(""),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Schedule",
                  style: Style.alltext_default_balck_blod,
                ),
                SizedBox(
                  height: 5.h,
                ),


                SizedBox(
                    height: 80.h,
                    child: Consumer<MyDoctorViewModel>(
                        builder: (context, data, child) {
                      if (data.doctorTimeSlotList.isEmpty) {
                        return data.isDocChamberTimeLoading == true
                            ? ListView.builder(
                                itemCount: 1,
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
                        return CarouselSlider.builder(
                          // scrollDirection: Axis.horizontal,
                          itemCount: mdVM.doctorTimeSlotList.length,
                          itemBuilder: (BuildContext context, int index,
                              int pageViewIndex) {
                            DocTimeSlot docTime =
                                mdVM.doctorTimeSlotList[index];
                            return Center(
                              child: Card(
                                  child: ListTile(
                                      title: Text(
                                        //{docTime.day}-
                                        "${docTime.month}-${docTime.year}",
                                        style: Style.alltext_default_balck,
                                      ),
                                      subtitle: Text(
                                        "${docTime.slotFrom.toString()} To ${docTime.slotTo.toString()}",
                                        style: Style.alltext_default_balck,
                                      ),
                                      trailing: Column(
                                        children: [
                                          Text(
                                            "${docTime.type.toString().toUpperCase()}",
                                            style: Style.alltext_default_balck,
                                          ),
                                          Style.distan_size2,
                                          Text(
                                            docTime.status.toString()=="off_duty"?"Off Day" :"",
                                            style: Style.alltext_default_balck,
                                          ),
                                        ],
                                      ),

                                  )
                              ),
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
                        );
                      }
                    })),
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
