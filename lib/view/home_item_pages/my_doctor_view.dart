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
                            : noDataFounForList("Currently you have no records");
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
                                        builder: (context) => DocDeactiveDetailsView(
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
                            : noDataFounForList("Currently you have no records");
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
