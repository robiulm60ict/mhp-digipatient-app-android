import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/view/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../routes/routes.gr.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class DrProfileView extends StatelessWidget {
  DrProfileView({super.key, required this.result});

  var result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   //leadingWidth: leadingWidth,
      //   //toolbarHeight: 80.h,
      //   backgroundColor: AppColors.anatomyColor,
      //   centerTitle: true,
      //   title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: Colors.white),),
      //
      //   // flexibleSpace:  Image(
      //   //   width: double.infinity,
      //   //  // image: AssetImage(Assets.imagesMyDoctorAppBar),
      //   //   fit: BoxFit.fill,
      //   // ),
      // ),
      body: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: result.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var profile = result[index];
            return Container(
              // height: 100,

              width: double.infinity,
              // margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Assets.imagesMyDoctorAppBar),
                          fit: BoxFit.fill,
                        ),
                        color: AppColors.primary_color,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        )),
                    height: MediaQuery.of(context).size.height * .26,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 140.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                "http://35.213.180.244:7000/doctors/images/${profile.drImages}",
                                height: 150,
                                width: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          //  height: 10.h,
                          child: Text(
                            'Name',
                            style: Style.alltext_block_text_style,
                          ),
                        ),
                        Text(
                          ": ${profile.title!.titleName.toString()} ${profile.drGivenName!.toString()} ${profile.drMiddleName!.toString()} ${profile.drLastName!.toString()}",
                          style: Style.alltext_block_text_style,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Work Experience',
                            style: Style.alltext_block_text_style,
                          ),
                        ),
                        Text(
                          ": ${profile.workExperienceYears!.toString()} Years",
                          style: Style.alltext_block_text_style,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Specialist',
                            style: Style.alltext_block_text_style,
                          ),
                        ),
                        Text(
                          ": ${profile.specialist!.specialistsName.toString()}",
                          style: Style.alltext_block_text_style,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Hospital',
                            style: Style.alltext_block_text_style,
                          ),
                        ),
                        Text(
                          ": ${profile.usualProvider!.usualProviderName.toString()}",
                          style: Style.alltext_block_text_style,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Email',
                            style: Style.alltext_block_text_style,
                          ),
                        ),
                        Text(
                          ": ${profile.drEmail!.toString()}",
                          style: Style.alltext_block_text_style,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 90.w,
                          child: Text(
                            'Work Mobile',
                            style: Style.alltext_block_text_style,
                          ),
                        ),
                        Text(
                          ": ${profile.drWorkPhone!.toString()}",
                          style: Style.alltext_block_text_style,
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      padding: EdgeInsets.all(15),
                      color: AppColors.greenColor,
                      minWidth: double.infinity,
                      onPressed: () {
                        context.router.push(const DashboardRoute());
                      },
                      child: Text(
                        "Doctor Request",
                        style: Style.alltext_Large_white,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
