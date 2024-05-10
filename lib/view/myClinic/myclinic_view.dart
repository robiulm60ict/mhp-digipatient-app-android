import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../utils/message.dart';
import '../../utils/utils.dart';

import '../../view_model/clinic/my_clinic_view_model/my_clinic_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';
import 'clinic_branches_view/clinic_branches_view.dart';
import 'clinic_branches_view/deactiveclinic_branches_view.dart';

class MyClinicView extends StatefulWidget {
  const MyClinicView({super.key});

  @override
  State<MyClinicView> createState() => _MyClinicViewState();
}

class _MyClinicViewState extends State<MyClinicView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyClinicViewModel>().getoriganization(context);
      context.read<MyClinicViewModel>().getoriganizationdeactive(context);
    });
    // TODO: implement initState
    super.initState();
  }
  bool showTodayAppointments = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.linearGradient2,
        title: Text(
          "My Clinic",
          style: Style.alltext_appbar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Style.distan_size10,
              Consumer<MyClinicViewModel>(builder: (context, dvm, child) {
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.h)),
                  child: Container(
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6.h),
                    child: Container(
                      //   width: 100.w,
                      decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.grey
                          // )
                          ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "OC - ",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.blackColor,
                              ),
                            ),
                            height: 60.h,
                            width: 50.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                              left: BorderSide(color: Colors.grey),
                              top: BorderSide(color: Colors.grey),
                              bottom: BorderSide(color: Colors.grey),
                              right: BorderSide(color: Colors.grey),
                            )),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                              // left: BorderSide(color: Colors.grey),
                              top: BorderSide(color: Colors.grey),
                              bottom: BorderSide(color: Colors.grey),
                              right: BorderSide(color: Colors.grey),
                            )),
                            height: 60.h,
                            width: 170.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0.r),
                              child: TextField(
                                //   maxLength: 4,
                                textAlign: TextAlign.start,

                                controller: dvm.controllerRequest,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  // border:OutlineInputBorder(
                                  //    borderSide: BorderSide(color: Colors.grey)),
                                  hintText: 'Enter 4 Digit Code',
                                  labelText: 'Add Clinic ID here',
                                  border: InputBorder.none,
                                  // suffixStyle: TextStyle(color: Colors.green)
                                ),
                              ),
                            ),
                          ),
                          Style.widthdistan_size10,
                          MaterialButton(
                            onPressed: () {
                              if (dvm.controllerRequest.text.isNotEmpty) {
                                dvm.clinicRequest(
                                    context, dvm.controllerRequest.text);
                              } else {
                                Messages.snackBar(
                                  context,
                                  "Enter Clinic identity number",
                                );
                              }
                            },
                            color: AppColors.primaryColor,
                            child: Text("Submit"),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
              Style.distan_size10,
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
                              print(showTodayAppointments);
                              print("showTodayAppointments");
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
                                child: const Center(
                                    child: Text("Active Clinic",
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
                              print(showTodayAppointments);
                              print("showTodayAppointments");
                              print(showTodayAppointments);
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
                                child: const Center(
                                    child: Text("Inactivate Clinic",
                                        textAlign: TextAlign.center)),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: showTodayAppointments,
                replacement: Column(
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    Consumer<MyClinicViewModel>(
                        builder: (context, data, child) {
                      if (data.organizationlistmodeldeactive.isEmpty) {
                        return data.isorgaizationLoadingdeactive == true
                            ? Center(
                                child: ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: bannerShimmereffect(
                                          94.toDouble(), 385.toDouble()),
                                    );
                                  },
                                ),
                              )
                            : noDataFounForList(
                                "Currently you have no records");
                      } else {
                        return Column(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data.organizationlistmodeldeactive.length,
                                itemBuilder: (context, index) {
                                  var organzation =
                                      data.organizationlistmodeldeactive[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DeactiveClinicBranches(
                                                    organizationListModle:
                                                        organzation,
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //   color: Colors.black12,
                                          // ),B8DC94
                                          color: index % 2 == 0
                                              ? Color(0xffB8DC94)
                                              : Color(0xffF7F7F7),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 8, bottom: 8),
                                      margin: EdgeInsets.only(
                                          left: 2, right: 2, top: 4, bottom: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 90.w,
                                            width: 75.w,
                                            child: organzation
                                                        .organization!.logo
                                                        .toString() ==
                                                    "null"
                                                ? SizedBox(
                                                    //height: 110,
                                                    // width: 90.w,
                                                    child: Image.asset(
                                                        Assets.nodata))
                                                : Image.network(organzation
                                                    .organization!.logo
                                                    .toString()),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 12),
                                            width: 240.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  organzation.organization!.name
                                                      .toString(),
                                                  style: Style
                                                      .alltext_default_balck_w700,
                                                ),
                                                Style.distan_size5,
                                                Text(
                                                    organzation
                                                        .organization!.address
                                                        .toString(),
                                                    style: Style
                                                        .alltext_default_balck),
                                                Style.distan_size5,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.shop,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                    Style.widthdistan_size2,
                                                    Text(
                                                      "${organzation.organization!.branch!.length.toString()} branches",
                                                      style: Style
                                                          .alltext_small_black,
                                                    ),
                                                    Style.widthdistan_size10,
                                                    // Icon(
                                                    //   Icons.deck,
                                                    //   color: Colors.grey,
                                                    //   size: 20,
                                                    // ),
                                                    // Style.widthdistan_size2,
                                                    // Text(
                                                    //   "644 m2",
                                                    //   style: Style.alltext_small_black,
                                                    // ),
                                                  ],
                                                ),
                                                Style.distan_size5,
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    Style.widthdistan_size10,
                                                    Icon(
                                                      Icons
                                                          .arrow_circle_right_outlined,
                                                      color: Colors.green,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }
                    }),
                  ],
                ),
                child: Column(
                  children: [
                    Consumer<MyClinicViewModel>(
                        builder: (context, data, child) {
                      if (data.organizationlistmodel.isEmpty) {
                        return data.isorgaizationLoading == true
                            ? Center(
                                child: ListView.builder(
                                  itemCount: 6,
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: bannerShimmereffect(
                                          94.toDouble(), 385.toDouble()),
                                    );
                                  },
                                ),
                              )
                            : noDataFounForList(
                                "Currently you have no records");
                      } else {
                        return Column(
                          children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data.organizationlistmodel.length,
                                itemBuilder: (context, index) {
                                  var organzation =
                                      data.organizationlistmodel[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ClinicBranches(
                                                    organizationListModle:
                                                        organzation,
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          // border: Border.all(
                                          //   color: Colors.black12,
                                          // ),B8DC94
                                          color: index % 2 == 0
                                              ? Color(0xffB8DC94)
                                              : Color(0xffF7F7F7),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8, top: 8, bottom: 8),
                                      margin: EdgeInsets.only(
                                          left: 2, right: 2, top: 4, bottom: 4),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 90.w,
                                            width: 75.w,
                                            child: organzation
                                                        .organization!.logo
                                                        .toString() ==
                                                    "null"
                                                ? SizedBox(
                                                    //height: 110,
                                                    // width: 90.w,
                                                    child: Image.asset(
                                                        Assets.nodata))
                                                : Image.network(organzation
                                                    .organization!.logo
                                                    .toString()),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(left: 12),
                                            width: 240.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  organzation.organization!.name
                                                      .toString(),
                                                  style: Style
                                                      .alltext_default_balck_w700,
                                                ),
                                                Style.distan_size5,
                                                Text(
                                                    organzation
                                                        .organization!.address
                                                        .toString(),
                                                    style: Style
                                                        .alltext_default_balck),
                                                Style.distan_size5,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Icon(
                                                      Icons.shop,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                    Style.widthdistan_size2,
                                                    Text(
                                                      "${organzation.organization!.branch!.length.toString()} branches",
                                                      style: Style
                                                          .alltext_small_black,
                                                    ),
                                                    Style.widthdistan_size10,
                                                    // Icon(
                                                    //   Icons.deck,
                                                    //   color: Colors.grey,
                                                    //   size: 20,
                                                    // ),
                                                    // Style.widthdistan_size2,
                                                    // Text(
                                                    //   "644 m2",
                                                    //   style: Style.alltext_small_black,
                                                    // ),
                                                  ],
                                                ),
                                                Style.distan_size5,
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.grey,
                                                      size: 20,
                                                    ),
                                                    Style.widthdistan_size10,
                                                    Icon(
                                                      Icons
                                                          .arrow_circle_right_outlined,
                                                      color: Colors.green,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
