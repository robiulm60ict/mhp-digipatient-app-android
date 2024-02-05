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
    return  RefreshIndicator(
      onRefresh: ()async{
        context
            .read<ResourcesViewModel>()
            .getpatienteducationResouresData(widget.subcatagoryId);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            centerTitle: true, leading: const CustomBackButton(),
            leadingWidth: leadingWidth,
            title: Text(
              "Patient Education Resources",
              style: Style.alltext_ExtraLarge_white,
            ),
          ),
          body: Consumer<ResourcesViewModel>(builder: (context, provider, child) {
            if (provider.patientresourcesList.isEmpty) {
              return provider.iseducationResouresLoading == true
                  ? ListView.builder(
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
