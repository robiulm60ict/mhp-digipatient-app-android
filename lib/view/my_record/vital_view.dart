
import 'package:digi_patient/resources/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../enum/vitals_enum.dart';
import '../../model/my_record_model/vitals_model.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/my_record_view_model/my_record_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/line_chart.dart';
import '../../widgets/shimmer.dart';
import '../../widgets/vitals_card.dart';

class VitalsView extends StatefulWidget {
  const VitalsView({
    Key? key,
  }) : super(key: key);

  @override
  State<VitalsView> createState() => _VitalsViewState();
}

class _VitalsViewState extends State<VitalsView>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = [];
  List<Widget> tabView = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getVitals();
    });
  }

  getVitals() async {
    await context.read<MyRecordViewModel>().getVitals(
          context,
        );
  }

  PatientsVs? dropdownValue;
  bool isBloodPressure = true;

  @override
  Widget build(BuildContext context) {
    final vital = Provider.of<MyRecordViewModel>(context);

    List<Widget> getTabBar() {
      tabs.clear();
      vital.vitalsList.first.vsArray?.forEach((element) {
        tabs.add(
          Tab(
            height: 70,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(4.0.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${element.patientsVs!.isNotEmpty ? element.patientsVs?.first.name : ""}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 10.sp, color: const Color(0xFF646464)),
                    ),
                    Text(
                      "${element.patientsVs!.isNotEmpty ? element.patientsVs?.first.value : ""}",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
      return tabs;
    }

    List<Widget> getTabView() {
      tabView.clear();
      vital.vitalsList.first.vsArray?.forEach((element) {
        tabView.add(CustomLineChartAll(
          patientVsList: element.patientsVs ?? [],
        ));
      });
      return tabView;
    }

    return RefreshIndicator(onRefresh: () async {
      getVitals();
    }, child:

    // Consumer<MyRecordViewModel>(builder: (context, data, child) {
    //   if (data.vitalsList.isEmpty) {
    //     return noDataFounForList("No Vitals History");
    //   } else {
    //     return

          DefaultTabController(
          length: vital.vitalsList.isNotEmpty
              ? vital.vitalsList.first.vsArray!.length
              : 0,
          child: Scaffold(
            backgroundColor: AppColors.page_background_color,
            appBar: AppBar(   leading: const CustomBackButton(),
              leadingWidth: leadingWidth,
              backgroundColor: AppColors.primary_color,

              title: Text("Vitals", style: Style.alltext_appbar),
              centerTitle: true,
            ),
            body: Consumer<MyRecordViewModel>(builder: (context, data, child) {
              if (data.vitalsList.isEmpty) {
                return  noDataFounForList("Currently you have no records");
              } else {
                return ListView(
                  padding: EdgeInsets.all(defaultPadding.r),
                  children: [
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(8.r)),
                    //   child: Image.asset(
                    //     Assets.vitalsVital,
                    //     height: 100.h,
                    //
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 25.h,
                    // ),
                    // || vital.vitalsList.first.bpArray != null || vital.vitalsList.first.bpArray!.isNotEmpty
                    // vital.isVitalLoading || vital.vitalsList.first.bpArray!.isEmpty
                    //     ? const Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : VitalsCard(
                    //     title:
                    //     "${vital.vitalsList.first.bpArray?.first.name}",
                    //     subtitle:
                    //     "${vital.vitalsList.first.bpArray?.first.systolic }/${vital.vitalsList.first.bpArray?.first.diastolic }",
                    //     image:
                    //     "${AppUrls.image}images/VitalSignIcon/${vital.vitalsList.first.bpArray?.first.icon }",
                    //     icon: "${vital.vitalsList.first.bpArray?.first.icon }",
                    //     unitId: "",
                    //     color: "",
                    //     v: Vitals.bloodPressure,
                    //     allData: const [],
                    //     index: 0),
                    vital.vitalsList.reversed.first.vsArray!.isEmpty
                        ? vital.isVitalLoading == true
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
                            : noDataFounForList("No Vitals History")
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: vital.vitalsList.isNotEmpty
                                ? vital.vitalsList.first.vsArray?.length
                                : 0,
                            itemBuilder: (context, index) {
                              final vitals =
                                  vital.vitalsList.first.vsArray?[index];
                              debugPrint(vitals.toString());
                              return VitalsCard(
                                index: index,
                                title:
                                    "${vitals!.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.name : ""}",
                                subtitle:
                                    "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.value : ""} ${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.unitsId : ""}",
                                image:
                                    "${AppUrls.baseUrlPatientMain}/images/VitalSignIcon/${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.icon : ""}",
                                unitId:
                                    "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.unitsId : ""}",
                                color:
                                    "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.color : ""}",
                                icon:
                                    "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.icon : ""}",
                                allData: vitals.patientsVs!.isNotEmpty
                                    ? vitals.patientsVs!
                                    : [],
                                v: vitals.patientsVs!.isNotEmpty
                                    ? vitals.patientsVs?.first.name
                                                .toString()
                                                .toLowerCase() ==
                                            "blood pressure"
                                        ? Vitals.bloodPressure
                                        : vitals.patientsVs?.first.name
                                                    .toString() ==
                                                "BMI"
                                            ? Vitals.bmi
                                            : Vitals.weight
                                    : Vitals.weight,
                              );
                            },
                          ),
                    SizedBox(
                      height: 12.h,
                    ),
                    // Text(
                    //   "Overview",
                    //   style: TextStyle(
                    //       fontSize: 16.sp,
                    //       fontWeight: FontWeight.bold,
                    //       color: const Color(0xFF3C3C3C)),
                    // ),
                    // SizedBox(
                    //   height: 18.h,
                    // ),
                    // Text(
                    //   "Blood Pressure",
                    //   style: TextStyle(fontSize: 16.sp, color: Colors.black),
                    // ),
                    // SizedBox(
                    //   height: 18.h,
                    // ),
                    // vital.isVitalLoading
                    //     ? const Center(
                    //   child: CircularProgressIndicator(),
                    // )
                    //     : const SizedBox(
                    //   height: 300,
                    //   child: CustomLineChart(),
                    // ),
                    SizedBox(
                      height: 18.h,
                    ),
                    // vital.isVitalLoading
                    //     ? const Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : TabBar(
                    //         // controller: _tabController,
                    //         indicatorSize: TabBarIndicatorSize.label,
                    //         indicatorColor: AppColors.primaryColor,
                    //         isScrollable: true,
                    //
                    //         tabs: getTabBar(),
                    //       ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                    // vital.isVitalLoading
                    //     ? const Center(
                    //         child: CircularProgressIndicator(),
                    //       )
                    //     : SizedBox(
                    //         height: 300.h,
                    //         child: TabBarView(
                    //           // controller: _tabController,
                    //           children: getTabView(),
                    //         ),
                    //       ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                );
              }
            }),
            // vital.vitalsList!.isEmpty?
            // vital.isVitalLoading == true
            //     ? ListView.builder(
            //       itemCount: 4,
            //       scrollDirection: Axis.vertical,
            //       physics: const ScrollPhysics(),
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(5.0),
            //           child: bannerShimmereffect(
            //               94.toDouble(), 385.toDouble()),
            //         );
            //       },
            //     )
            //     : noDataFounForList("No Vitals History")
            //     : ListView(
            //         padding: EdgeInsets.all(defaultPadding.r),
            //         children: [
            //           // Card(
            //           //   shape: RoundedRectangleBorder(
            //           //       borderRadius: BorderRadius.circular(8.r)),
            //           //   child: Image.asset(
            //           //     Assets.vitalsVital,
            //           //     height: 100.h,
            //           //
            //           //   ),
            //           // ),
            //           // SizedBox(
            //           //   height: 25.h,
            //           // ),
            //           // || vital.vitalsList.first.bpArray != null || vital.vitalsList.first.bpArray!.isNotEmpty
            //           // vital.isVitalLoading || vital.vitalsList.first.bpArray!.isEmpty
            //           //     ? const Center(
            //           //         child: CircularProgressIndicator(),
            //           //       )
            //           //     : VitalsCard(
            //           //     title:
            //           //     "${vital.vitalsList.first.bpArray?.first.name}",
            //           //     subtitle:
            //           //     "${vital.vitalsList.first.bpArray?.first.systolic }/${vital.vitalsList.first.bpArray?.first.diastolic }",
            //           //     image:
            //           //     "${AppUrls.image}images/VitalSignIcon/${vital.vitalsList.first.bpArray?.first.icon }",
            //           //     icon: "${vital.vitalsList.first.bpArray?.first.icon }",
            //           //     unitId: "",
            //           //     color: "",
            //           //     v: Vitals.bloodPressure,
            //           //     allData: const [],
            //           //     index: 0),
            //           vital.vitalsList.reversed.first.vsArray!.isEmpty?
            //           vital.isVitalLoading == true
            //               ? Center(
            //             child: ListView.builder(
            //               itemCount: 4,
            //               scrollDirection: Axis.vertical,
            //               physics: const ScrollPhysics(),
            //               shrinkWrap: true,
            //               itemBuilder: (context, index) {
            //                 return Padding(
            //                   padding: const EdgeInsets.all(5.0),
            //                   child: bannerShimmereffect(
            //                       94.toDouble(), 385.toDouble()),
            //                 );
            //               },
            //             ),
            //           )
            //               : noDataFounForList("No Vitals History")
            //               : ListView.builder(
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   shrinkWrap: true,
            //                   itemCount: vital.vitalsList.isNotEmpty
            //                       ? vital.vitalsList.first.vsArray?.length
            //                       : 0,
            //                   itemBuilder: (context, index) {
            //                     final vitals =
            //                         vital.vitalsList.first.vsArray?[index];
            //                     debugPrint(vitals.toString());
            //                     return VitalsCard(
            //                       index: index,
            //                       title:
            //                           "${vitals!.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.name : ""}",
            //                       subtitle:
            //                           "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.value : ""} ${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.unitsId : ""}",
            //                       image:
            //                           "https://gdbackend.macrohealthplus.org//images/VitalSignIcon/${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.icon : ""}",
            //                       unitId:
            //                           "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.unitsId : ""}",
            //                       color:
            //                           "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.color : ""}",
            //                       icon:
            //                           "${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.icon : ""}",
            //                       allData: vitals.patientsVs!.isNotEmpty
            //                           ? vitals.patientsVs!
            //                           : [],
            //                       v: vitals.patientsVs!.isNotEmpty
            //                           ? vitals.patientsVs?.first.name
            //                                       .toString()
            //                                       .toLowerCase() ==
            //                                   "blood pressure"
            //                               ? Vitals.bloodPressure
            //                               : vitals.patientsVs?.first.name
            //                                           .toString()
            //                                            ==
            //                                       "BMI"
            //                                   ? Vitals.bmi
            //                                   : Vitals.weight
            //                           : Vitals.weight,
            //                     );
            //                   },
            //                 ),
            //           SizedBox(
            //             height: 12.h,
            //           ),
            //           Text(
            //             "Overview",
            //             style: TextStyle(
            //                 fontSize: 16.sp,
            //                 fontWeight: FontWeight.bold,
            //                 color: const Color(0xFF3C3C3C)),
            //           ),
            //           SizedBox(
            //             height: 18.h,
            //           ),
            //           Text(
            //             "Blood Pressure",
            //             style: TextStyle(fontSize: 16.sp, color: Colors.black),
            //           ),
            //           SizedBox(
            //             height: 18.h,
            //           ),
            //           vital.isVitalLoading
            //               ? const Center(
            //                   child: CircularProgressIndicator(),
            //                 )
            //               : const SizedBox(
            //                   height: 300,
            //                   child: CustomLineChart(),
            //                 ),
            //           SizedBox(
            //             height: 18.h,
            //           ),
            //           vital.isVitalLoading
            //               ? const Center(
            //                   child: CircularProgressIndicator(),
            //                 )
            //               : TabBar(
            //                   // controller: _tabController,
            //                   indicatorSize: TabBarIndicatorSize.label,
            //                   indicatorColor: AppColors.primaryColor,
            //                   isScrollable: true,
            //
            //                   tabs: getTabBar(),
            //                 ),
            //           SizedBox(
            //             height: 10.h,
            //           ),
            //           vital.isVitalLoading
            //               ? const Center(
            //                   child: CircularProgressIndicator(),
            //                 )
            //               : SizedBox(
            //                   height: 300.h,
            //                   child: TabBarView(
            //                     // controller: _tabController,
            //                     children: getTabView(),
            //                   ),
            //                 ),
            //           SizedBox(
            //             height: 50.h,
            //           ),
            //         ],
            //       ),
          ),
        )
      //}
   // }
    );
  //);
  }
}

getLineChart(List<PatientsVs> val) {
  return CustomLineChartAll(
    patientVsList: val,
  );
}
