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

import '../../../../resources/styles.dart';
import '../../../../view_model/mydoctor/new_my_doctor_view_model.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/doc_card.dart';

class ClinicBranchDoctorView extends StatefulWidget {
  ClinicBranchDoctorView({Key? key}) : super(key: key);

  @override
  State<ClinicBranchDoctorView> createState() => _MyDoctorViewState();
}

class _MyDoctorViewState extends State<ClinicBranchDoctorView> {
  @override
  Widget build(BuildContext context) {
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
        onRefresh: () async {},
        child: Container(
          padding: EdgeInsets.only(left: 12,right: 12),
          width: double.infinity,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset(
                      "assets/images/picturebuttons1.png",fit: BoxFit.fill,
                    ),
                    height: 150.h,
                    width: double.infinity,
                  ),
                  Style.distan_size10,
                  SizedBox(
                      width: 250.w,
                      child: Text(
                        "WELCOME TO",
                        style: Style.alltext_default_balck_blod_dilog,
                      )),
                  Style.distan_size15,
                  Text(
                    "IBN SINA DHANMONDI BRANCH",
                    style: Style.alltext_default_balck_blod,
                  ),
                  Style.distan_size10,
                  Center(
                    child: Text(
                      "Available Doctors",
                      style: Style.alltext_default_balck,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    gridDelegate: FlutterzillaFixedGridView(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 16,
                        height: 165.h),
                    itemBuilder: (context, index) {
                      return
                        InkWell(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  margin: const EdgeInsets.only(top: 35),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 35.h,
                                          width: double.infinity,
                                        ),
                                        Text(
                                          "Dr. Matroska John",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: Style.alltext_default_balck_blod,
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "docSpeciality"!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: Style.alltext_default_balck,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "docSpeciality"!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.start,
                                          style: Style.alltext_default_balck,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "docHospital"!,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: Style.alltext_default_balck,
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Positioned(
                              //     top: 0,
                              //     child: CircleAvatar(radius: 25.h,),),
                              Positioned(
                                top: 10,
                                child: ClipOval(
                                  child: FadeInImage(
                                    fit: BoxFit.cover,
                                    width: 65,
                                    height: 65,
                                    image: NetworkImage(
                                      "docImage"!,
                                    ),
                                    imageErrorBuilder: (context, error, stackTrace) =>
                                    const CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage(Assets.dummy_image),
                                    ),
                                    placeholder: const AssetImage(Assets.imagesAvatar),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                        DeActveocCard(
                        onTap: () {},
                        docImage:
                            "",
                        docName: "Dr. Matroska John",
                        docSpeciality: "MBBS,FCPS,Cardologist",
                        docHospital: "Bangladesh Hospital",
                        doctortitle: null,
                        docId: '',
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
