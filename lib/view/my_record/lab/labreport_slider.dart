import 'package:carousel_slider/carousel_slider.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../model/my_medicine_model/my_report_model.dart';
import '../../../resources/colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/back_button.dart';
import '../../my_medicine/image_view.dart';
import '../../resources_view/patient_education_view/pdfview.dart';

class ReportSliderImage extends StatefulWidget {
  ReportSliderImage({super.key, this.file});

  List<FileElement>? file;

  @override
  State<ReportSliderImage> createState() => _ReportSliderImageState();
}

class _ReportSliderImageState extends State<ReportSliderImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.primary_color,
        title: Text(
          "Report View",
          style: Style.alltext_appbar,
        ),
      ),
      body: Container(
        child: SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: widget.file!.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = widget.file![index];
                return InkWell(
                  onTap: () {
                    urlImage.file!.split(".").last != "pdf"
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageView(
                                    image:
                                        "https://gdbackend.macrohealthplus.org/images/patients_reports/${urlImage.file}")))
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PdfViewerPage(
                                    pdfUrl:
                                        "https://gdbackend.macrohealthplus.org/images/patients_reports/${urlImage.file}")));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 3,
                        child: Container(
                          width: double.infinity,
                          color: AppColors.page_background_color,
                          height:
                          MediaQuery.of(context).size.height * .40,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                                "https://gdbackend.macrohealthplus.org/images/patients_reports/${urlImage.file}",
                                height:
                                    MediaQuery.of(context).size.height * .40,
                                width:  MediaQuery.of(context).size.width,
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                "Type Of Report",
                                style: Style.alltext_default_balck,
                              ),
                            ),
                            Text(
                              ": ",
                              style: Style.alltext_default_balck,
                            ),
                            SizedBox(
                              width: 180.w,
                              child: Text(
                               urlImage.typeOfReport.toString(),
                                  style: Style.alltext_default_balck),
                            ),
                          ],
                        ),
                      ),
                      Style.distan_size2,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                "Date",
                                style: Style.alltext_default_balck,
                              ),
                            ),
                            Text(
                              ": ",
                              style: Style.alltext_default_balck,
                            ),
                            SizedBox(
                              width: 180.w,
                              child: Text(
                                  DateFormat("dd-MM-yyyy").format(DateTime.parse(
                                      urlImage.createdAt.toString())),
                                  style: Style.alltext_default_balck),
                            ),
                          ],
                        ),
                      ),
                      Style.distan_size2,
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 90.w,
                              child: Text(
                                "Time",
                                style: Style.alltext_default_balck,
                              ),
                            ),
                            Text(
                              ": ",
                              style: Style.alltext_default_balck,
                            ),
                            SizedBox(
                              width: 180.w,
                              child: Text(
                                  DateFormat("hh:mm a").format(DateTime.parse(
                                      urlImage.createdAt.toString())),
                                  style: Style.alltext_default_balck),
                            ),
                          ],
                        ),
                      ),
                      Style.distan_size2,
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                autoPlayAnimationDuration: Duration(seconds: 3),
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height * .55,
                autoPlay: true,
                aspectRatio: 16 / 9,
              )),
        ),
      ),
    );
  }
}
