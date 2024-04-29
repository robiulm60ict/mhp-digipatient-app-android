import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../model/clinic/mydoctorlistbrance.dart';
import '../../../../model/clinic/orgamozationlist_model.dart';
import '../../../../utils/utils.dart';
import '../../../../view_model/appointment_view_model/brance_appointment_view_model.dart';
import '../../../../widgets/back_button.dart';
import 'brance_book_appointment_view.dart';

class BranceDocDetailsView extends StatefulWidget {
  BranceDocDetailsView({Key? key, this.doc,this.DbName,this.branch}) : super(key: key);
  MhpDoctorsMaster? doc;
  Branch? branch;
  String? DbName;

  @override
  State<BranceDocDetailsView> createState() => _DocDetailsViewState();
}

class _DocDetailsViewState extends State<BranceDocDetailsView> {
  // ScrollController listViewController = ScrollController();
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   // listViewController.dispose();
  // }

  @override
  void initState() {
    super.initState();
    // getDoctor(widget.id);
    print(widget.DbName.toString());
    print(widget.branch!.id.toString());
     context.read<BranceAppointmentViewModel>().getSocialMediea(widget.doc!.id.toString(),widget.DbName.toString(),widget.branch!.id.toString());
      context
          .read<BranceAppointmentViewModel>()
          .getdoctorcountpatient(widget.doc!.id.toString(),widget.DbName.toString(),widget.branch!.id.toString());
  }

  getDoctor(id) async {
    // doc = context
    //     .read<MyDoctorDelaisViewModel>()
    //     .myDoctorList
    //     .firstWhere((element) => element.doctorsMasterId == id) as Datum?;
  }

  double rating = 3;

  @override
  Widget build(BuildContext context) {
    final mdVM = Provider.of<MyDoctorViewModel>(context);
    final appointmentViewModel = Provider.of<BranceAppointmentViewModel>(context);

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
                      builder: (context) => BranceBookAppointmentView(
                          doctors: widget.doc!,
                          amount:
                              "${ widget.doc?.doctorFee == null ? "0" : widget.doc?.doctorFee} ", branch: widget.branch, DbName: widget.DbName,)));

              appointmentViewModel.selectedDatee = null;
              appointmentViewModel.isChamber = "";
              appointmentViewModel.morningeveingButton = "";

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
        elevation: 0,
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
                    padding: EdgeInsets.only(left: 10.0.r, top: 10.r),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.doc!.title == null ? '' : widget.doc!.title!.titleName} ${widget.doc?.fullName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.alltext_default_balck_blod,
                        ),
                        widget.doc!.academic!.isNotEmpty
                            ? SizedBox(
                                height: 8.h,
                              )
                            : SizedBox(),
                        widget.doc!.academic!.isNotEmpty
                            ? Container(
                                height: 20.h,
                                width: 200.h,
                                // width: 200, // specify a height here,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: widget.doc!.academic!.length < 5
                                      ? widget.doc!.academic!.length
                                      : 6,
                                  itemBuilder: (context, index) {
                                    var data = widget.doc!.academic![index];
                                    return Container(
                                      // width: 50.h,

                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0),
                                      child: Text(
                                        "${data.degreeId}${widget.doc!.academic!.last == data ? "" : ", "}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Style.alltext_ExtraSmall_black,
                                      ),
                                    );
                                  },
                                ),
                              )

                            // Row(
                            //         children: List.generate(
                            //             doc!.doctors!.academic!.length, (index) {
                            //         var data = doc!.doctors!.academic![index];
                            //         return Center(
                            //           //  width: Get.size.width*0.26,
                            //           child: Text(
                            //               "${data.degreeId}${doc!.doctors!.academic!.last == data ? "" : ", "}",
                            //               maxLines: 3,
                            //               overflow: TextOverflow.ellipsis,
                            //               textAlign: TextAlign.center,
                            //               style: Style.alltext_ExtraSmall_black),
                            //         );
                            //       }))
                            : Container(),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "${widget.doc?.department?.departmentsName}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Style.alltext_default_balck,
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
                                      text: "${widget.doc?.doctorFee ?? "0"} ",
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.text_primary_color,
                                        fontSize: 16.sp,
                                      ),
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
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0, top: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                Assets.imagesBkash,
                                height: 35.h,
                                width: 35.w,
                                fit: BoxFit.contain,
                              ),
                              // CircleAvatar(
                              //   maxRadius: 24,
                              //   backgroundImage: AssetImage(Assets.imagesBkash),
                              // ),
                              Text(
                                " bKash Payment : ${widget.doc!.drHomePhone.toString() == "null" ? "" : widget.doc!.drHomePhone.toString()}",
                                style: Style.alltext_default_balck_blod,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: widget.doc?.drImages.toString() != "null" ||
                                widget.doc?.drImages.toString() != null
                            ? FadeInImage(
                                fit: BoxFit.cover,
                                width: 65,
                                height: 65,
                                image: NetworkImage(
                                  "${AppUrls.docImage}${widget.doc?.drImages}"!,
                                ),
                                imageErrorBuilder:
                                    (context, error, stackTrace) =>
                                        const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage(Assets.dummy_image),
                                ),
                                placeholder:
                                    const AssetImage(Assets.imagesAvatar),
                              )
                            //

                            : CircleAvatar(
                                radius: 40.r,
                                backgroundColor: AppColors.linearGradient1,
                                backgroundImage: AssetImage(Assets.dummy_image),
                              ),
                      ),
                      Style.distan_size5,
                      // MaterialButton(
                      //   color: Colors.green,
                      //   onPressed: () {
                      //     _showDeleteConfirmationDialog(context);
                      //   },
                      //   child: Text(
                      //     "Active",
                      //     style: Style.alltext_appbar,
                      //   ),
                      // )
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

              children: [
                // SizedBox(height: 10,)
                Container(
                  padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 6.r),
                  height: 80.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            leading: Icon(
                              Icons.people,
                              color: AppColors.primaryColor,
                            ),
                            title: Text(
                              "${mdVM.data.toString()}+",
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
                          elevation: 2,
                          child: ListTile(
                            leading: Icon(
                              Icons.cases_outlined,
                              color: AppColors.primaryColor,
                            ),
                            title: Text(
                              "${widget.doc?.workExperienceYears == null || widget.doc?.workExperienceYears.toString() == "null" ? "0" : widget.doc?.workExperienceYears.toString()} years",
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
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 0.r),
                  child: Row(
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
                            "${widget.doc!.specialist?.specialistsName == null || widget.doc!.specialist?.specialistsName.toString() == "null" ? "" : widget.doc!.specialist?.specialistsName.toString()}",
                            style: Style.alltext_default_balck,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 0.r),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 3,
                          child: Container(
                            height: 55.h,
                            child: Consumer<MyDoctorViewModel>(
                                builder: (context, data, child) {
                              if (data.sociallist.isEmpty) {
                                return Center(
                                  child: Text(
                                    "Currently you have no records",
                                    style: Style.alltext_default_balck,
                                  ),
                                );
                              } else {
                                return ListView.builder(
                                    itemCount: data.sociallist.length > 4
                                        ? 4
                                        : data.sociallist.length,
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
                                          // height: 40.h,
                                          // width: 40.w,
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(5.0),
                                          child: SizedBox(
                                              width: 80.w,
                                              child: InkWell(
                                                onTap: () async {
                                                  await launch(
                                                      info.url.toString());

                                                  // Navigator.push(
                                                  //     context,
                                                  //     MaterialPageRoute(
                                                  //         builder: (context) =>
                                                  //             SocialWebviewView(
                                                  //               url: info.url,
                                                  //             )));
                                                },
                                                child: CircleAvatar(
                                                  maxRadius: 8,
                                                  child: Image.asset(info.name
                                                              .toString() ==
                                                          "FaceBook"
                                                      ? Assets.facebook
                                                      : (info.name.toString() ==
                                                              "Youtube"
                                                          ? Assets.youtube
                                                          : (info.name.toString() ==
                                                                  "LinkedIn"
                                                              ? Assets.linkedin
                                                              : ((info.name
                                                                          .toString() ==
                                                                      "Twitter"
                                                                  ? Assets
                                                                      .twitter
                                                                  : Assets
                                                                      .homeMyRec))))),
                                                ),
                                              )),
                                        ),
                                      );
                                    });
                              }
                            }),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 3,
                          child: Container(
                            height: 55.h,
                            padding: EdgeInsets.all(4),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: IconButton(
                                      onPressed: () {
                                        FlutterPhoneDirectCaller.callNumber(
                                            "${widget.doc!.drWorkPhone.toString()}");
                                      },
                                      icon: Icon(
                                        Icons.call,
                                        size: 25,
                                        color: AppColors.backgroundColor,
                                      )),
                                ),
                                Style.widthdistan_size5,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Support : ",
                                      style: Style.alltext_default_balck,
                                    ),
                                    Text(
                                      "${widget.doc!.drWorkPhone == null || widget.doc!.drWorkPhone.toString() == "null" ? "" : widget.doc!.drWorkPhone.toString()}",
                                      style: Style.alltext_default_balck,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.r, right: 10.r, top: 0.r),
                  child: Text(
                    "About Doctor",
                    style: Style.alltext_default_balck_blod,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                widget.doc!.drAbout.toString() != "null"
                    ? Padding(
                        padding:
                            EdgeInsets.only(left: 10.r, right: 10.r, top: 0.r),
                        child: ReadMoreText(
                          "${widget.doc?.drAbout.toString() ?? ""}",
                          trimLines: 8,
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
                        ),
                      )
                    : Text(""),
                SizedBox(
                  height: 12.w,
                ),
                Card(
                  elevation: 7,
                  child: Container(
                    color: AppColors.linearGradient1,
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 12, bottom: 12),
                    child: Row(
                      children: [
                        // Icon(Icons.note_add_outlined , color: AppColors.text_primary_color,size: 50,),
                        Image.asset(
                          "assets/icons/info.png",
                          width: 40.w,
                          color: Colors.black,
                        ),
                        Style.widthdistan_size5,
                        SizedBox(
                            width: 280.w,
                            child: Text(
                              "Pay the doctor’s consultation fee in bkash. Please remember bkash number and 10-digit transaction ID to confirm doctor’s follow-up appointment. ",
                              style: Style.alltext_default_balck,
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
