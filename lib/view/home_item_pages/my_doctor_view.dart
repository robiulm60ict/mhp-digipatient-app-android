import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/custom_search_dialogue.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view/my_doctor_category_views/doc_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../resources/styles.dart';
import '../../utils/message.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/doc_card.dart';
import '../../widgets/shimmer.dart';
import '../my_doctor_category_views/doc_detailsdeactive_view.dart';

class MyDoctorView extends StatefulWidget {
  MyDoctorView({Key? key}) : super(key: key);

  @override
  State<MyDoctorView> createState() => _MyDoctorViewState();
}

class _MyDoctorViewState extends State<MyDoctorView> {
  bool showTodayAppointments = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyDoctorDelaisViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.page_background_color,
      appBar: AppBar(
        leadingWidth: leadingWidth,
        toolbarHeight: 60.h,
        leading: const CustomBackButton(),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Doctor",
          style: Style.alltext_appbar,
        ),
        // leading: Padding(
        //   padding: Platform.isIOS
        //       ? const EdgeInsets.only(bottom: 40)
        //       : EdgeInsets.symmetric(vertical: width < 411 ? 20.0 : 30),
        //   child: const CustomBackButton(),
        // ),
        flexibleSpace: const Image(
          image: AssetImage(Assets.imagesMyDoctorAppBar),
          fit: BoxFit.fill,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          provider.getmyAllDoctors(context);
          provider.getmyAllDeactiveDoctors(context);
        },
        child: Container(
          width: double.infinity,
          child: ListView(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Consumer<MyDoctorDelaisViewModel>(builder: (context, dvm, child) {
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
                              "DC - ",
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
                                  labelText: 'Add Doctor ID here',
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
                                dvm.docotrRequest(
                                    context, dvm.controllerRequest.text);
                              } else {
                                Messages.snackBar(
                                  context,
                                  "Enter Doctor identity number",
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
                                    child: Text("Active Doctors",
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
                                child: const Center(
                                    child: Text("Inactivate Doctors",
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
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8.r),
                    //       side: BorderSide(color: AppColors.primaryColor)),
                    //   child: ListTile(
                    //     onTap: () => customSearchDialogue(context,
                    //         doctorList: provider.myDoctordeactiveFullList
                    //                 .reversed.first.data ??
                    //             []),
                    //     leading: Icon(
                    //       Icons.search_rounded,
                    //       color: AppColors.primaryColor,
                    //       size: 15.h,
                    //     ),
                    //     title: Text(
                    //       "Search Doctor",
                    //       style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Consumer<MyDoctorDelaisViewModel>(
                        builder: (context, data, child) {
                      if (data.myDoctordeactiveList.isEmpty) {
                        return data.isDoctorLoading == true
                            ? GridView.builder(
                                itemCount: 12,
                                shrinkWrap: true,
                                gridDelegate: FlutterzillaFixedGridView(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 16,
                                    height: 175.h),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: bannerShimmereffect(
                                        94.toDouble(), 385.toDouble()),
                                  );
                                },
                              )
                            : noDataFounForList(
                                "Currently you have no records");
                      } else {
                        return GridView.builder(
                          itemCount: provider.myDoctordeactiveList.length,
                          shrinkWrap: true,
                          gridDelegate: FlutterzillaFixedGridView(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 16,
                              height: 165.h),
                          itemBuilder: (context, index) {
                            var docc = provider.myDoctordeactiveList[index];

                            return DeActveocCard(
                              onTap: () {
                                print(docc.doctorsMasterId.toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DocDeactiveDetailsView(
                                                id: docc.doctorsMasterId)));

                                // context.router
                                //     .push(DocDetailsRoute(id: doc!.doctorsMasterId!));
                              },
                              docImage:
                                  "${AppUrls.drprofile}${docc.doctors?.drImages.toString()}",
                              docName:
                                  "${docc!.doctors!.title == null ? '' : docc!.doctors!.title!.titleName} ${docc!.doctors!.fullName}",
                              docSpeciality: docc
                                      .doctors?.specialist?.specialistsName
                                      .toString() ??
                                  "",
                              docHospital:
                                  "${docc.doctors!.usualProvider != null ? docc.doctors!.usualProvider!.usualProviderName.toString() : ""}",
                              doctortitle: docc.doctors!.academic,
                              docId: docc.doctorsMasterId.toString(),
                            );
                          },
                        );
                      }
                    }),
                  ],
                ),
                child: Column(
                  children: [
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8.r),
                    //       side: BorderSide(color: AppColors.primaryColor)),
                    //   child: ListTile(
                    //     onTap: () => customSearchDialogue(context,
                    //         doctorList:
                    //             provider.myDoctorFullList.reversed.first.data ??
                    //                 []),
                    //     leading: Icon(
                    //       Icons.search_rounded,
                    //       color: AppColors.primaryColor,
                    //       size: 15.h,
                    //     ),
                    //     title: Text(
                    //       "Search Doctor",
                    //       style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    //     ),
                    //   ),
                    // ),
                    Consumer<MyDoctorDelaisViewModel>(
                        builder: (context, data, child) {
                      if (data.myDoctorList.isEmpty) {
                        return data.isDoctorLoading == true
                            ? GridView.builder(
                                itemCount: 12,
                                shrinkWrap: true,
                                gridDelegate: FlutterzillaFixedGridView(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 16,
                                    height: 175.h),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: bannerShimmereffect(
                                        94.toDouble(), 385.toDouble()),
                                  );
                                },
                              )
                            : noDataFounForList(
                                "Currently you have no records");
                      } else {
                        return GridView.builder(
                          itemCount: provider.myDoctorList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: FlutterzillaFixedGridView(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 16,
                              height: 165.h),
                          itemBuilder: (context, index) {
                            var doc = provider.myDoctorList[index];

                            return DocCard(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DocDetailsView(
                                            id: doc!.doctorsMasterId)));

                                // context.router
                                //     .push(DocDetailsRoute(id: doc!.doctorsMasterId!));
                              },
                              docImage:
                                  "${AppUrls.drprofile}${doc.doctors?.drImages.toString()}",
                              docName:
                                  "${doc!.doctors!.title == null ? '' : doc!.doctors!.title!.titleName} ${doc!.doctors!.fullName}",
                              docSpeciality: doc
                                      .doctors?.specialist?.specialistsName
                                      .toString() ??
                                  "",
                              docHospital:
                                  "${doc.doctors!.usualProvider != null ? doc.doctors!.usualProvider!.usualProviderName.toString() : ""}",
                              doctortitle: doc.doctors!.academic,
                              docId: doc.doctorsMasterId.toString(),
                            );
                          },
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
