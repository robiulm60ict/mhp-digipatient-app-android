import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/department_model/department_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/custom_search_dialogue.dart';
import 'package:digi_patient/utils/utils.dart';
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

class MyDoctorView extends StatelessWidget {
  const MyDoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyDoctorDelaisViewModel>(context);
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My Doctor",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
        leading: Padding(
          padding: Platform.isIOS
              ? const EdgeInsets.only(bottom: 60)
              : EdgeInsets.symmetric(vertical: width < 411 ? 20.0 : 30),
          child: const CustomBackButton(),
        ),
        flexibleSpace: const Image(
          image: AssetImage(Assets.imagesMyDoctorAppBar),
          fit: BoxFit.fill,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          // Row(
          //   children: [
          //      Expanded(child: SearchTextField(
          //       height: 50.h,
          //        onTap:  () => customSearchDialogue(context, doctorList: provider.allDoctorList.first.doctors!),
          //        // suffixIcon: IconButton(onPressed: (){
          //        //   selectCategoryPopUp(context);
          //        // }, icon: Icon(Icons.add_chart_sharp, color: AppColors.primaryColor,),),
          //       hintText: "Search item..",),),
          //     SizedBox(width: 8.w,),
          //
          //     ],
          // ),
          // Card(
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8.r),
          //     side: BorderSide(color: AppColors.primaryColor)
          //   ),
          //   child: ListTile(
          //     onTap: ()=> customSearchDialogue(context, doctorList: provider.allDoctorList.first.doctors ?? []),
          //     leading: Icon(Icons.search_rounded, color: AppColors.primaryColor, size: 15.h,),
          //     title: Text("Search Doctor", style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          //   ),
          // ),),
          SizedBox(
            height: 15.h,
          ),
          // Row(
          //   children: [
          //     Text("Favourite List", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
          //   const Spacer(),
          //     TextButton(onPressed: (){
          //       debugPrint("view all");
          //     }, child: Text("View All", style: TextStyle(
          //         decoration: TextDecoration.underline,
          //         fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),))
          //   ],
          // ),
          // SizedBox(height: 6.h,),
          // SizedBox(
          //   height: 90.h,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //       itemCount: 5,
          //       itemBuilder: (context, index) {
          //     return SizedBox(
          //       width: MediaQuery.of(context).size.width - 25,
          //       child: DoctorListTileFavourite(onTap: (){
          //         //TODO: Connect api and Route
          //         // context.router.push( DocDetailsRoute(id: null));
          //       },),
          //     );
          //   }),
          // ),
          SizedBox(
            height: 15.h,
          ),
          //       Row(
          //         children: [
          //           Text("Category", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
          //           const Spacer(),
          //           TextButton(onPressed: () {
          //             // List<Doctors>? doctorList = [];
          //             List<Doctor>? allDoc = provider.allDoctorList.first.doctors;
          //             // doctorList = allDoc?.where((element) => element.department?.departmentsName == "Dermatology".toLowerCase()).toList();
          //
          //             customSearchDialogue(context, doctorList: allDoc!);
          // } ,
          //           // {
          //           //   debugPrint("view all");
          //           //   context.router.push(const AllDoctorSearchRoute());
          //           // },
          //               child: Text("View All", style: TextStyle(
          //               decoration: TextDecoration.underline,
          //               fontSize: 12.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),))
          //         ],
          //       ),
          SizedBox(
            height: 6.h,
          ),
          Consumer<MyDoctorDelaisViewModel>(builder: (context, data, child) {
            if (data.myDoctorList.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );

              //   data.isDoctorLoading == true
              //     ? Center(
              //   child: ListView.builder(
              //     itemCount: 6,
              //     scrollDirection: Axis.vertical,
              //     physics: const ScrollPhysics(),
              //     shrinkWrap: true,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: const EdgeInsets.all(5.0),
              //         child: bannerShimmereffect(
              //             94.toDouble(), 385.toDouble()),
              //       );
              //     },
              //   ),
              // )
              //     :  noDataFounForList();
            } else {
              return GridView.builder(
                itemCount: provider.myDoctorFullList.length,
                shrinkWrap: true,
                gridDelegate: FlutterzillaFixedGridView(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                    height: 175.h),
                itemBuilder: (context, index) {
                  var doc = provider.myDoctorList[index];

                  return DocCard(
                    onTap: () {
                      context.router
                          .push(DocDetailsRoute(id: doc!.doctorsMasterId!));
                    },
                    docImage:
                        "http://35.213.180.244:7000/doctors/images/${doc?.doctors?.drImages.toString()}",
                    docName:
                        "${doc?.doctors?.title.toString()} ${doc?.doctors?.drGivenName.toString()} ${doc?.doctors?.drMiddleName.toString()} ${doc?.doctors?.drLastName.toString()}",
                    docSpeciality: "${doc?.doctors?.specialist?.specialistsName.toString()}",
                    docHospital: "${doc?.doctors!.usualProvider!.usualProviderName.toString()}",
                  );
                },
              );
            }
          }),
        ],
      ),
    );
  }
}
