import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/shimmer.dart';
import '../../utils/utils.dart';
import '../../view_model/my_medicine_view_model/my_medicine_view_model.dart';
import 'lab/labreport_slider.dart';

class UploadMyReport extends StatefulWidget {
  UploadMyReport({
    super.key,
  });

  @override
  State<UploadMyReport> createState() => _UploadMyReportState();
}

class _UploadMyReportState extends State<UploadMyReport> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyMedicineViewModel>().getMyReport(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{    context.read<MyMedicineViewModel>().getMyReport(context); },
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          title: Text("My Report", style: Style.alltext_appbar),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Consumer<MyMedicineViewModel>(builder: (context, data, child) {
                  if (data.myreportimageRxList.isEmpty) {
                    return data.ismyreportLoading == true
                        ? Center(
                            child: ListView.builder(
                              itemCount: 4,
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
                        : noDataFounForList("Currently you have no records");
                  } else {
                    return SingleChildScrollView(
                      child: Column(
                        children: [

                          GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: FlutterzillaFixedGridView(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 10,
                            height: 90.h),
                        itemCount:data.myreportimageRxList.length,
                        itemBuilder: (BuildContext context, index) {
                          var info = data.myreportimageRxList[index];
                          return InkWell(

                            onTap: () {
                             // info.file!.split(".").last != "pdf"
                                                  //     ?
                                                  //
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  ReportSliderImage(file: info.file,
                                                                      )));
                                                  //     : Navigator.push(
                                                  //         context,
                                                  //         MaterialPageRoute(
                                                  //             builder: (context) =>
                                                  //                 PdfViewerPage(
                                                  //                     pdfUrl:
                                                  //                         "https://gdbackend.macrohealthplus.org/images/patients_reports/${info.file}")));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 70.h,
                                  width: double.infinity,
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0.r),
                                      child: Image.asset(
                                          Assets.myMedicineRx,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                 info.name.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Style.alltext_default_balck,
                                )
                              ],
                            ),
                          );
                        })


                          // ListView.builder(
                          //     itemCount: data.myreportimageRxList.length,
                          //     shrinkWrap: true,
                          //     physics: ScrollPhysics(),
                          //     itemBuilder: (context, index) {
                          //       var info = data.myreportimageRxList[index];
                          //       return Padding(
                          //         padding: const EdgeInsets.only(top: 6),
                          //         child: Container(
                          //           color: Colors.white,
                          //           padding: const EdgeInsets.all(8.0),
                          //           child: Column(
                          //             children: [
                          //               Container(
                          //                 padding: EdgeInsets.only(left: 8),
                          //                 //width: 420.w,
                          //                 child: InkWell(
                          //                   onTap: () {
                          //                     // info.file!.split(".").last != "pdf"
                          //                     //     ?
                          //                     //
                          //                         Navigator.push(
                          //                             context,
                          //                             MaterialPageRoute(
                          //                                 builder: (context) =>
                          //                                     ReportSliderImage(file: info.file,
                          //                                         )));
                          //                     //     : Navigator.push(
                          //                     //         context,
                          //                     //         MaterialPageRoute(
                          //                     //             builder: (context) =>
                          //                     //                 PdfViewerPage(
                          //                     //                     pdfUrl:
                          //                     //                         "https://gdbackend.macrohealthplus.org/images/patients_reports/${info.file}")));
                          //                   },
                          //                   child: Card(
                          //                     color: Colors.white,
                          //                     child: Row(
                          //                       mainAxisAlignment:
                          //                           MainAxisAlignment
                          //                               .spaceBetween,
                          //                       children: [
                          //                         Padding(
                          //                           padding:
                          //                               const EdgeInsets.only(
                          //                                   left: 6),
                          //                           child: Column(
                          //                             crossAxisAlignment:
                          //                                 CrossAxisAlignment
                          //                                     .start,
                          //                             children: [
                          //                               Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .center,
                          //                                 crossAxisAlignment:
                          //                                     CrossAxisAlignment
                          //                                         .start,
                          //                                 children: [
                          //                                   SizedBox(
                          //                                     width: 80.w,
                          //                                     child: Text(
                          //                                       "Name",
                          //                                       style: Style
                          //                                           .alltext_default_balck,
                          //                                     ),
                          //                                   ),
                          //                                   Text(
                          //                                     ": ",
                          //                                     style: Style
                          //                                         .alltext_default_balck,
                          //                                   ),
                          //                                   SizedBox(
                          //                                     width: 180.w,
                          //                                     child: Text(
                          //                                         "${info.name ?? ""} ",
                          //                                         style: Style
                          //                                             .alltext_default_balck),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                               Style.distan_size2,
                          //                               Row(
                          //                                 mainAxisAlignment:
                          //                                     MainAxisAlignment
                          //                                         .center,
                          //                                 crossAxisAlignment:
                          //                                     CrossAxisAlignment
                          //                                         .start,
                          //                                 children: [
                          //                                   SizedBox(
                          //                                     width: 80.w,
                          //                                     child: Text(
                          //                                       "Type Of Report",
                          //                                       style: Style
                          //                                           .alltext_default_balck,
                          //                                     ),
                          //                                   ),
                          //                                   Text(
                          //                                     ": ",
                          //                                     style: Style
                          //                                         .alltext_default_balck,
                          //                                   ),
                          //                                   SizedBox(
                          //                                     width: 180.w,
                          //                                     child: Text(
                          //                                         "${info.name ?? ""} ",
                          //                                         style: Style
                          //                                             .alltext_default_balck),
                          //                                   ),
                          //                                 ],
                          //                               ),
                          //                               Style.distan_size2,
                          //                               // Row(
                          //                               //   mainAxisAlignment:
                          //                               //       MainAxisAlignment
                          //                               //           .center,
                          //                               //   crossAxisAlignment:
                          //                               //       CrossAxisAlignment
                          //                               //           .start,
                          //                               //   children: [
                          //                               //     SizedBox(
                          //                               //       width: 40.w,
                          //                               //       child: Text(
                          //                               //         "Date",
                          //                               //         style: Style
                          //                               //             .alltext_default_balck,
                          //                               //       ),
                          //                               //     ),
                          //                               //     Text(
                          //                               //       ": ",
                          //                               //       style: Style
                          //                               //           .alltext_default_balck,
                          //                               //     ),
                          //                               //     // SizedBox(
                          //                               //     //   width: 180.w,
                          //                               //     //   child: Text(
                          //                               //     //       DateFormat(
                          //                               //     //               "dd-MM-yyyy")
                          //                               //     //           .format(DateTime.parse(info
                          //                               //     //               .createdAt
                          //                               //     //               .toString())),
                          //                               //     //       style: Style
                          //                               //     //           .alltext_default_balck),
                          //                               //     // ),
                          //                               //   ],
                          //                               // ),
                          //                               // Style.distan_size2,
                          //                               // Row(
                          //                               //   mainAxisAlignment:
                          //                               //       MainAxisAlignment
                          //                               //           .center,
                          //                               //   crossAxisAlignment:
                          //                               //       CrossAxisAlignment
                          //                               //           .start,
                          //                               //   children: [
                          //                               //     SizedBox(
                          //                               //       width: 40.w,
                          //                               //       child: Text(
                          //                               //         "Time",
                          //                               //         style: Style
                          //                               //             .alltext_default_balck,
                          //                               //       ),
                          //                               //     ),
                          //                               //     Text(
                          //                               //       ": ",
                          //                               //       style: Style
                          //                               //           .alltext_default_balck,
                          //                               //     ),
                          //                               //     // SizedBox(
                          //                               //     //   width: 180.w,
                          //                               //     //   child: Text(
                          //                               //     //       "${DateFormat("hh:mm a").format(DateTime.parse(info.createdAt.toString()))}",
                          //                               //     //       style: Style
                          //                               //     //           .alltext_default_balck),
                          //                               //     // ),
                          //                               //   ],
                          //                               // ),
                          //                               Style.distan_size2,
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         // Padding(
                          //                         //   padding:
                          //                         //       const EdgeInsets.all(8.0),
                          //                         //   child: SizedBox(
                          //                         //     height: 70.h,
                          //                         //     width: 50.w,
                          //                         //     child: info.file!
                          //                         //                 .split(".")
                          //                         //                 .last ==
                          //                         //             "pdf"
                          //                         //         ? Icon(Icons.picture_as_pdf)
                          //                         //         : Image.network(
                          //                         //             "${AppUrls.report_image}${info.file}",
                          //                         //             height: 75.h,
                          //                         //             width: 50.w,
                          //                         //             fit: BoxFit.fill,
                          //                         //           ),
                          //                         //   ),
                          //                         // )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       );
                          //     }),
                        ],
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
