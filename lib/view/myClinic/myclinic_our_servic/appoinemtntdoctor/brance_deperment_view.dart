import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';

import 'package:digi_patient/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../../model/clinic/orgamozationlist_model.dart';
import '../../../../resources/app_url.dart';
import '../../../../resources/styles.dart';
import '../../../../view_model/clinic/my_clinic_view_model/my_clinic_doctor_view_model.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/doc_card.dart';
import '../../../../widgets/shimmer.dart';
import 'brance_doc_details_view.dart';
import 'my_doctor_view.dart';

class ClinicBranchDepermentView extends StatefulWidget {
  ClinicBranchDepermentView({Key? key,this.branch,this.DbName}) : super(key: key);
  Branch? branch;
  String? DbName;

  @override
  State<ClinicBranchDepermentView> createState() => _MyDoctorViewState();
}

class _MyDoctorViewState extends State<ClinicBranchDepermentView> {
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
          "Department",
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
                    widget.branch!.name.toString(),
                    style: Style.alltext_default_balck_blod,
                  ),
                  Style.distan_size10,
                  Center(
                    child: Text(
                      "Available Doctors department",
                      style: Style.alltext_default_balck,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Consumer<MyClinicDoctorViewModel>(
                      builder: (context, data, child) {
                        if (data.myDoctorFullList.isEmpty) {
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
                            itemCount: data.mydepermentList.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: FlutterzillaFixedGridView(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 16,
                                height: 100.h),
                            itemBuilder: (context, index) {
                              var docc = data.mydepermentList[index];

                              return InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ClinicBranchDoctorView(mhpdoctorlist: docc.mhpDoctorsMaster,DbName: widget.DbName,branch: widget.branch,)));
                                  },
                                  child: Card(elevation: 3,
                                      shadowColor: AppColors.primary_color,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.asset("assets/icons/phlebotomy.png",height: 50,),
                                          Style.distan_size2,
                                          Text(docc.departmentsName.toString(),style: Style.alltext_Large_black,),
                                        ],
                                      )));
                            },
                          );
                        }
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
