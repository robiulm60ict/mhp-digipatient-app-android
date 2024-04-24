import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../resources/colors.dart';
import '../../utils/custom_search_dialogue.dart';
import '../../utils/utils.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import 'package:mdi/mdi.dart';

import '../../widgets/back_button.dart';
import 'clinic_branches_view/clinic_branches_view.dart';

class MyClinicView extends StatelessWidget {
  const MyClinicView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyDoctorDelaisViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.linearGradient2,
        title: Text("My Clinic",style: Style.alltext_appbar,),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Style.distan_size10,
              // Card(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8.r),
              //       side: BorderSide(color: AppColors.primaryColor)),
              //   child: ListTile(
              //     onTap: () => customSearchDialogue(context,
              //         doctorList: provider
              //                 .myDoctordeactiveFullList.reversed.first.data ??
              //             []),
              //     leading: Icon(
              //       Icons.search_rounded,
              //       color: AppColors.primaryColor,
              //       size: 25.h,
              //     ), trailing:
              //
              //   Image.asset("assets/icons/serch.png"),
              //
              //
              //     title: Text(
              //       "Search Clinic",
              //       style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 4.h,
              // ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClinicBranches()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(
                            //   color: Colors.black12,
                            // ),B8DC94
                            color: index % 2 == 0
                                ? Color(0xffB8DC94)
                                : Color(0xffF7F7F7),
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        margin: EdgeInsets.only(
                            left: 2, right: 2, top: 4, bottom: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Image.asset(Assets.imagesChamber),
                              height: 90.w,
                              width: 75.w,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 12),
                              width: 240.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Modern Diagonistic Center -Dhanmondi",
                                    style: Style.alltext_default_balck_w700,
                                  ),
                                  Style.distan_size5,
                                  Text("Dhanmondi, Dhaka",
                                      style: Style.alltext_default_balck),
                                  Style.distan_size5,
                                  Row(crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.shop,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      Style.widthdistan_size2,
                                      Text(
                                        "10 branches",
                                        style: Style.alltext_small_black,
                                      ),
                                      Style.widthdistan_size10,
                                      Icon(
                                        Icons.deck,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      Style.widthdistan_size2,
                                      Text(
                                        "644 m2",
                                        style: Style.alltext_small_black,
                                      ),
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
                                        Icons.arrow_circle_right_outlined,
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
          ),
        ),
      ),
    );
  }
}
