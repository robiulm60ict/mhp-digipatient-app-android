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
          if (provider.patientsubCatagoryList.isEmpty) {
            return provider.issubCatagoryLoading == true
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
                      child:ListView.builder(
                        itemCount:  provider.patientsubCatagoryList.length,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
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
        }));
  }
}
