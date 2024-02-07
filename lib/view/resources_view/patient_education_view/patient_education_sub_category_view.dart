import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../resources/app_url.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../utils/utils.dart';
import '../../../view_model/resources_view_model/resources_view_model.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/shimmer.dart';
import 'custom_search_sub_category_dialogue.dart';
import 'patient_education_resoures_view.dart';

class PatientEducationSubCatagoryView extends StatefulWidget {
   PatientEducationSubCatagoryView({super.key,required this.catagoryid});

   var catagoryid;
  @override
  State<PatientEducationSubCatagoryView> createState() => _PatientEducationSubCatagoryViewState();
}

class _PatientEducationSubCatagoryViewState extends State<PatientEducationSubCatagoryView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResourcesViewModel>().getsubcatagoryResouresData(widget.catagoryid);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        context.read<ResourcesViewModel>().getsubcatagoryResouresData(widget.catagoryid);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            centerTitle: true, leading: const CustomBackButton(),
            leadingWidth: leadingWidth,
            title: Text(
              "Patient Education",
              style: Style.alltext_ExtraLarge_white,
            ),
          ),
          body: Consumer<ResourcesViewModel>(builder: (context, provider, child) {
            if (provider.patientsubCatagoryList.isEmpty) {
              return provider.issubCatagoryLoading == true
                  ? ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
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
              return Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(8.r),
                            side: BorderSide(
                                color: AppColors.primaryColor)),
                        child: ListTile(
                          onTap: () =>
                              customSearchSubCategoryDialogue(
                                  context,
                                  register:
                                  provider.patientsubCatagoryList ?? []),
                          leading: Icon(
                            Icons.search_rounded,
                            color: AppColors.primaryColor,
                            size: 15.h,
                          ),
                          title: Text(
                            "Search Patient",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:ListView.builder(
                          itemCount:  provider.patientsubCatagoryList.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            var sub= provider.patientsubCatagoryList[index];
                            return InkWell(
                              onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientEducationResouresView(subcatagoryId: sub.id,)));

                              },
                              child: Card(
                                color: Colors.white,
                                child: ListTile(

                                  enabled: true,
                                  title: Text(sub.subCategoryName.toString()),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 100.h,
                      ),
                    ],
                  ),
                ),
              );
            }
          })),
    );
  }
}
