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
import 'pdfview.dart';

class PatientEducationResouresView extends StatefulWidget {
  PatientEducationResouresView({super.key, this.subcatagoryId});

  var subcatagoryId;

  @override
  State<PatientEducationResouresView> createState() =>
      _PatientEducationResouresViewState();
}

class _PatientEducationResouresViewState
    extends State<PatientEducationResouresView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<ResourcesViewModel>()
          .getpatienteducationResouresData(widget.subcatagoryId);
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
            "Patient Education Resources",
            style: Style.alltext_ExtraLarge_white,
          ),
        ),
        body: Consumer<ResourcesViewModel>(builder: (context, provider, child) {
          if (provider.patientresourcesList.isEmpty) {
            return provider.iseducationResouresLoading == true
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
                      child: ListView.builder(
                        itemCount: provider.patientresourcesList.length,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var sub = provider.patientresourcesList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PdfViewerPage(
                                        pdfUrl: "${AppUrls.baseUrlResoures}/uploads/${sub.file}",
                                          )));
                            },
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                enabled: true,
                                title: Text(sub.title.toString()),
                                trailing: Icon(
                                  Icons.picture_as_pdf,
                                  size: 45,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      // GridView.builder(
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     gridDelegate: FlutterzillaFixedGridView(
                      //         crossAxisCount: 3,
                      //         mainAxisSpacing: 4,
                      //         crossAxisSpacing: 4,
                      //         height: 135.h),
                      //     itemCount: provider.patientresourcesList.length,
                      //     itemBuilder: (BuildContext context, index) {
                      //       var resoures = provider.patientresourcesList[index];
                      //       return Column(
                      //         children: [
                      //           Card(
                      //             elevation: 8,
                      //             color: Colors.white,
                      //             shadowColor: Colors.black,
                      //             shape: RoundedRectangleBorder(
                      //
                      //               // side: new BorderSide(
                      //               //     color: AppColors.primaryColor, width: 2.0),
                      //                 borderRadius: BorderRadius.circular(8.0)),
                      //             child: Container(
                      //               padding: EdgeInsets.all(6.0),
                      //               color: AppColors.page_background_color,
                      //               child: InkWell(
                      //                 onTap: () {
                      //               //   Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientEducationSubCatagoryView(catagoryid: resoures.id,)));
                      //                 },
                      //                 child: Column(
                      //                   mainAxisSize: MainAxisSize.min,
                      //                   children: [
                      //                     Container(
                      //                       padding: EdgeInsets.all(10),
                      //                       decoration: BoxDecoration(
                      //                           color: Colors.green.shade50,
                      //                           // border: Border.all(
                      //                           //     color: Colors.redAccent),
                      //                           shape: BoxShape.circle),
                      //                       height: 65.h,
                      //                       width: double.infinity,
                      //                       child: ClipRRect(
                      //                         borderRadius: BorderRadius.circular(8.0),
                      //
                      //                         child:  Image.asset(
                      //                           Assets.homeResource,
                      //                           height: 65.h,
                      //                           width: double.infinity,
                      //                           fit: BoxFit.fill,
                      //                         ),),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //           Style.distan_size2,
                      //           Padding(
                      //             padding: const EdgeInsets.all(0.0),
                      //             child: Text(
                      //               resoures.title.toString(),
                      //               maxLines: 3,
                      //               overflow: TextOverflow.ellipsis,
                      //               textAlign: TextAlign.center,
                      //               style: Style.alltext_default_balck,
                      //
                      //             ),
                      //           )
                      //         ],
                      //       );
                      //     }),
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
