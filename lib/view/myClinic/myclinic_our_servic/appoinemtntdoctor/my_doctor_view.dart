import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';

import 'package:digi_patient/utils/utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../../model/clinic/mydoctorlistbrance.dart';
import '../../../../model/clinic/orgamozationlist_model.dart';
import '../../../../resources/app_url.dart';
import '../../../../resources/styles.dart';
import '../../../../view_model/clinic/my_clinic_view_model/my_clinic_doctor_view_model.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/doc_card.dart';
import '../../../../widgets/shimmer.dart';
import 'brance_doc_details_view.dart';

class ClinicBranchDoctorView extends StatefulWidget {
  ClinicBranchDoctorView({Key? key,this.mhpdoctorlist,this.branch,this.DbName}) : super(key: key);
  List<MhpDoctorsMaster>? mhpdoctorlist;
  Branch? branch;
  String? DbName;
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
                    widget.branch!.name.toString(),
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
                  Consumer<MyClinicDoctorViewModel>(
                      builder: (context, data, child) {
                        if (widget.mhpdoctorlist!.isEmpty) {
                          return noDataFounForList(
                              "Currently you have no records");
                        } else {
                          return GridView.builder(
                            itemCount:widget.mhpdoctorlist!.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            gridDelegate: FlutterzillaFixedGridView(
                                crossAxisCount: 2,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 16,
                                height: 165.h),
                            itemBuilder: (context, index) {
                              var docc = widget.mhpdoctorlist![index];

                              return BranceActveocCard(
                                onTap: () {
                                  // print(docc.doctorsMasterId.toString());
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BranceDocDetailsView(doc: docc,DbName: widget.DbName,branch: widget.branch,
                                                  )));

                                  // context.router
                                  //     .push(DocDetailsRoute(id: doc!.doctorsMasterId!));
                                },
                                docImage:
                                "${AppUrls.drprofile}${docc.drImages.toString()}",
                                docName:
                                "${docc.title == null ? '' : docc.title!.titleName} ${docc.fullName}",
                                docSpeciality: docc
                                    .specialist?.specialistsName
                                    .toString() ??
                                    "",
                                docHospital:
                                "${docc.usualProvider != null ? docc.usualProvider!.usualProviderName.toString() : ""}",
                                doctortitle: docc.academic,
                                docId: docc.toString(),
                              );
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
