import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../resources/app_url.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../view_model/resources_view_model/resources_view_model.dart';
import '../../../widgets/shimmer.dart';
import 'patient_education_sub_category_view.dart';

class PatientEducationView extends StatefulWidget {
  const PatientEducationView({super.key});

  @override
  State<PatientEducationView> createState() => _PatientEducationViewState();
}

class _PatientEducationViewState extends State<PatientEducationView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ResourcesViewModel>().getcatagoryResouresData();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            "Patient Education",
            style: Style.alltext_ExtraLarge_white,
          ),
        ),
        body: Consumer<ResourcesViewModel>(builder: (context, provider, child) {
          if (provider.patientCatagoryList.isEmpty) {
            return provider.isCatagoryLoading == true
                ? Center(
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: bannerShimmereffect(
                              94.toDouble(), 385.toDouble()),
                        );
                      },
                    ),
                  )
                : noDataFounForList("No Data");
          } else {
            return Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: FlutterzillaFixedGridView(
                              crossAxisCount: 3,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              height: 135.h),
                          itemCount: provider.patientCatagoryList.length,
                          itemBuilder: (BuildContext context, index) {
                            var resoures = provider.patientCatagoryList[index];
                            return Column(
                              children: [
                                Card(
                                  elevation: 8,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(

                                      // side: new BorderSide(
                                      //     color: AppColors.primaryColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Container(
                                    padding: EdgeInsets.all(6.0),
                                    color: AppColors.page_background_color,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PatientEducationSubCatagoryView(
                                                      catagoryid: resoures.id,
                                                    )));
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.green.shade50,
                                                // border: Border.all(
                                                //     color: Colors.redAccent),
                                                shape: BoxShape.circle),
                                            height: 65.h,
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Image.network(
                                                  "${AppUrls.baseUrlResoures}/uploads/${resoures.categoryImage.toString()}",
                                                  height: 65.h,
                                                  width: 65.h,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Style.distan_size2,
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Text(
                                    resoures.categoryName.toString(),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: Style.alltext_default_balck,
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
