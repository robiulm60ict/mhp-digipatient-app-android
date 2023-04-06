import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/line_chart.dart';
import 'package:digi_patient/widgets/vitals_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VitalsView extends StatefulWidget {
  const VitalsView({Key? key}) : super(key: key);

  @override
  State<VitalsView> createState() => _VitalsViewState();
}

class _VitalsViewState extends State<VitalsView> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    double tabBarHeight = 70;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("Vitals", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultPadding.r),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r)
            ),
            child: Image.asset(Assets.vitalsVital, height: 130.h,),
          ),

          SizedBox(height: 45.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const VitalsCard(title: "Blood Pressure", subtitle: "120/80", image: Assets.vitalsBloodPressure),
              SizedBox(width: 6.w,),
              const VitalsCard(title: "Heart Rate", subtitle: "89", image: Assets.vitalsHeartRate),
            ],
          ),
          SizedBox(height: 6.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const VitalsCard(title: "Temperature", subtitle: "90.7  c", image: Assets.vitalsTemperature),
              SizedBox(width: 6.w,),
              const VitalsCard(title: "Weight", subtitle: "75kg", image: Assets.vitalsWeight),
            ],
          ),
          SizedBox(height: 6.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const VitalsCard(title: "Height", subtitle: "172cm", image: Assets.vitalsHeight),
              SizedBox(width: 6.w,),
              const VitalsCard(title: "BMI", subtitle: "27.7", image: Assets.vitalsBmi),
            ],
          ),
          SizedBox(height: 6.h,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Blood Sugar", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
                      SizedBox(width: 5.w,),
                      Image.asset(Assets.vitalsBloodSugar, height: 35.h, fit: BoxFit.fill,),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Table(
                    border: TableBorder.all(color: Colors.transparent,),

                    children: [
                      TableRow(
                          children: [
                        const Text("  "),
                        Text("HBA1C", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                        Text("Mean Blood", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                        Text("Glucose", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                      ]),
                      TableRow(children: [
                        Text("F", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                        Text("5.0", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                        Text("80", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                        Text("4.7", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                      ]),
                      TableRow(children: [
                        Text("NF", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                        Text("6.0", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                        Text("70", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                        Text("4.7", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                      ]),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("  "),
                  //     Text("HBA1C", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                  //     Text("Mean Blood", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                  //     Text("Glucose", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                  //   ],
                  // ),
                  // SizedBox(height: 6.h,),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("F", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
                  //     Text("5.0", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                  //     Text("80",style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                  //     Text("4.7", style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
                  //   ],
                  // ),
                  // SizedBox(height: 6.h,),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h,),
          Text("Overview", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF3C3C3C)),),
          SizedBox(height: 18.h,),
    TabBar(
    controller: _tabController,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorColor: AppColors.primaryColor,
    isScrollable: true,
    onTap: (value) {
      setState(() {

    });},
    tabs: [
    Tab(
      height: tabBarHeight,
        child: Card(
        child: Padding(
          padding:  EdgeInsets.all(4.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,

      children: [
          Text("Blood Pressure", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
          Text("120/80", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController.index == 0 ? AppColors.primaryColor : const Color(0xFF646464)),),
      ],
    ),
        ))),
    Tab(
      height: tabBarHeight,
        child: Card(
        child: Padding(
          padding:  EdgeInsets.all(4.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
      children: [
          Text("Heart Rate", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
          Text("89bpm", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController.index == 1 ? AppColors.primaryColor : const Color(0xFF646464)),),
      ],
    ),
        ))),
    Tab(
      height: tabBarHeight,
        child: Card(
        child: Padding(
          padding:  EdgeInsets.all(4.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
      children: [
          Text("Temperature", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
          Text("90.7  c", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController.index == 2 ? AppColors.primaryColor : const Color(0xFF646464)),),
      ],
    ),
        ))),
    Tab(
      height: tabBarHeight,
        child: Card(
        child: Padding(
          padding:  EdgeInsets.all(4.0.r),
          child: Column(
            mainAxisSize: MainAxisSize.min,
      children: [
          Text("Oxygen", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
          Text("98%", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController.index == 3 ? AppColors.primaryColor : const Color(0xFF646464)),),
      ],
    ),
        ))),

    ],
    ),
SizedBox(height: 10.h,),
          SizedBox(
            height: 300.h,
            child: TabBarView(
                controller: _tabController,
                children: const [
                  Card(
                    child: CustomLineChart()
                  ),
                  Card(),
                  Card(),
                  Card(),
                ],),
          ),
        ],
      ),
    );
  }
}
