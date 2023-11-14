import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/department_model/department_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/custom_search_dialogue.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view/my_doctor_category_views/doc_details_view.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../model/myDoctorList/mydoctorList.dart';
import '../../resources/styles.dart';
import '../../routes/routes.gr.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import '../../widgets/doc_card.dart';
import '../../widgets/search_text_field.dart';
import '../../widgets/shimmer.dart';

class MyDoctorView extends StatelessWidget {
  const MyDoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyDoctorDelaisViewModel>(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.page_background_color,
      appBar: AppBar(

        leadingWidth: leadingWidth,
        toolbarHeight: 60.h,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Doctor",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
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
      body: ListView(
        padding: EdgeInsets.all(12.r),
        children: [
          Consumer<MyDoctorDelaisViewModel>(builder: (context, data, child) {
            if (data.myDoctorList.isEmpty) {
              return data.isDoctorLoading == true
                  ? Center(
                      child: GridView.builder(
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
                    ))
                  : noDataFounForList("");
            } else {
              return Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        side: BorderSide(color: AppColors.primaryColor)),
                    child: ListTile(
                      onTap: () => customSearchDialogue(context,
                          doctorList:
                              provider.myDoctorFullList.reversed.first.data ??
                                  []),
                      leading: Icon(
                        Icons.search_rounded,
                        color: AppColors.primaryColor,
                        size: 15.h,
                      ),
                      title: Text(
                        "Search Doctor",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GridView.builder(
                    itemCount: provider.myDoctorFullList.length,
                    shrinkWrap: true,
                    gridDelegate: FlutterzillaFixedGridView(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 16,
                        height: 165.h),
                    itemBuilder: (context, index) {
                      var doc = provider.myDoctorList[index];

                      return DocCard(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DocDetailsView(id: doc!.doctorsMasterId!)));

                          // context.router
                          //     .push(DocDetailsRoute(id: doc!.doctorsMasterId!));
                        },
                        docImage:
                            "${AppUrls.drprofile}${doc?.doctors?.drImages.toString()}",
                        docName:
                            "${doc?.doctors?.title.toString()} ${doc?.doctors?.drGivenName.toString()} ${doc?.doctors?.drMiddleName.toString()} ${doc?.doctors?.drLastName.toString()}",
                        docSpeciality:
                            "${doc?.doctors?.specialist?.specialistsName.toString()}",
                        docHospital:
                            "${doc?.doctors!.usualProvider!.usualProviderName.toString()}",
                      );
                    },
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
