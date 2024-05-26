import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';
import '../../../resources/app_url.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../utils/utils.dart';
import '../../../view_model/resources_view_model/resources_view_model.dart';
import '../../../widgets/back_button.dart';
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
  List resourcespatient = [
    'Improving the practice of pediatric patient',
    'Managing your chronic despises symptoms',
    'Exercise at latest 30 mints a day',
    'Germs are not for sharing',
    'Women improve her health',
  ];


  @override
  Widget build(BuildContext context) {
    return  RefreshIndicator(
      onRefresh: ()async{
        context.read<ResourcesViewModel>().getcatagoryResouresData();
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
            if (provider.patientCatagoryList.isEmpty) {
              return provider.isCatagoryLoading == true
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: FlutterzillaFixedGridView(
                                crossAxisCount: 1,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                height: 85.h),
                            itemCount: provider.patientCatagoryList.length,
                            itemBuilder: (BuildContext context, index) {
                              var resoures = provider.patientCatagoryList[index];

                              String resourceText = index < resourcespatient.length
                                  ? resourcespatient[index]
                                  : 'N/A';
                              return

                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PatientEducationSubCatagoryView(
                                                  catagoryid: resoures.id,
                                                )));

                                    },
                                  child: Card(
                                    elevation: 4,
                                    shadowColor: AppColors.primary_color,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            // height: 75.h,
                                            width: 75.w,
                                            child:

                                            CircleAvatar(
                                              radius: 35,
                                              child: Image.network(
                                                width: 70.w,
                                                "${AppUrls.baseUrlResoures}/uploads/${resoures.categoryImage.toString()}",
                                              ),
                                              backgroundColor: Colors.white,
                                              // backgroundImage:AssetImage(
                                              //   provider.homeItemsList[index].image,
                                              // ),
                                            ),
                                          ),
                                          // Style.widthdistan_size5,
                                          SizedBox(
                                            width: 190.w,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  resoures.categoryName.toString(),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: Style.alltext_Large_black,
                                                ),
                                                Text(
                                                  resourceText,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: Style.alltext_default_balck,
                                                ),

                                              ],
                                            ),
                                          ),
                                          Style.widthdistan_size10,
                                          Image.asset("assets/icons/home/homebutton.png")
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                                Column(
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
                                                      const EdgeInsets.all(6.0),
                                                  child: Image.network(
                                                    "${AppUrls.baseUrlResoures}/uploads/${resoures.categoryImage.toString()}",
                                                    // height: 65.h,
                                                    // width: 65.h,
                                                  //  fit: BoxFit.fill,
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
          })),
    );
  }
}
