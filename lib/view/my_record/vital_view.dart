import 'package:digi_patient/enum/vitals_enum.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/line_chart.dart';
import 'package:digi_patient/widgets/vitals_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VitalsView extends StatefulWidget {
  const VitalsView({Key? key,}) : super(key: key);
  // final int tabLength;

  @override
  State<VitalsView> createState() => _VitalsViewState();
}

class _VitalsViewState extends State<VitalsView> with SingleTickerProviderStateMixin  {
  // TabController? _tabController;
  List<Widget> tabs = [];
  List<Widget> tabView = [];
  // List<VitalTabModel> vitalTabList = [];
  // int length = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
  await getVitals();
  // if(context.read<MyRecordViewModel>().vitalsList.first.vsArray != null){
  //   _tabController = TabController(length: context.read<MyRecordViewModel>().vitalsList.first.vsArray!.length, vsync: this);
  //
  // }else{
  //   _tabController = TabController(length: 0, vsync: this);
  //
  // }

      // debugPrint("${widget.tabLength}------------------------------------------\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-----------");
//   getTabData();
//   _tabController = TabController(length: widget.tabLength, vsync: this);
// setState(() {
//
// });
    });
    // try{
    //   _tabController = TabController(length: context.read<MyRecordViewModel>().vitalsList.first.vsArray!.length + 1, vsync: this);
    //
    // }catch (e){
    //   debugPrint(e.toString());
    //   _tabController = TabController(length: 0, vsync: this);
    // }



  }

getVitals()async{
    await context.read<MyRecordViewModel>().getVitals(context,);
    // setTabData();
    // getTabData();

}

// setTabData(){
//     vitalTabList.clear();
//     vitalTabList.add(VitalTabModel(name: "${context.read<MyRecordViewModel>().vitalsList.first.bpArray?.first.name}", value: double.parse("${context.read<MyRecordViewModel>().vitalsList.first.bpArray?.first.systolic}"), dateTime: context.read<MyRecordViewModel>().getDateTime("${context.read<MyRecordViewModel>().vitalsList.first.bpArray?.first}")));
//     if(context.read<MyRecordViewModel>().vitalsList.isNotEmpty && context.read<MyRecordViewModel>().vitalsList.first.vsArray != null){
//       for(var i = 0; i<context.read<MyRecordViewModel>().vitalsList.first.vsArray!.length; i++){
//         final vs =  context.read<MyRecordViewModel>().vitalsList.first.vsArray![i].patientsVs!.first;
//         vitalTabList.add(VitalTabModel(name:vs.name!, value: double.parse("${vs.value}"), dateTime: context.read<MyRecordViewModel>().getDateTime("${vs.createdAt}")));
//       }
//     }
// }

  // getTabData()async{
  //   tabs.clear();
  //   tabView.clear();
  //   // tabs.add(Tab(
  //   //     height: 70,
  //   //     child: Card(
  //   //         child: Padding(
  //   //           padding:  EdgeInsets.all(4.0.r),
  //   //           child: Column(
  //   //             mainAxisSize: MainAxisSize.min,
  //   //
  //   //             children: [
  //   //               Text("${context.read<MyRecordViewModel>().vitalsList.first.bpArray?.first.name}", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
  //   //               Text("${context.read<MyRecordViewModel>().vitalsList.first.bpArray?.first.systolic}/${context.read<MyRecordViewModel>().vitalsList.first.bpArray?.first.diastolic}", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController?.index == 0 ? AppColors.primaryColor : const Color(0xFF646464)),),
  //   //             ],
  //   //           ),
  //   //         ))),);
  //   // tabView.add(const Card(
  //   //     child: CustomLineChart()
  //   // ),);
  //   // vitalTabList.forEach((element) {
  //   //   tabs.add(
  //   //     Tab(
  //   //         height: 70,
  //   //         child: Card(
  //   //             child: Padding(
  //   //               padding:  EdgeInsets.all(4.0.r),
  //   //               child: Column(
  //   //                 mainAxisSize: MainAxisSize.min,
  //   //
  //   //                 children: [
  //   //                   Text(element.name, textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
  //   //                   Text("${element.value}", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController?.index == 0 ? AppColors.primaryColor : const Color(0xFF646464)),),
  //   //                 ],
  //   //               ),
  //   //             ))),);
  //   //   tabView.add(const Card(
  //   //
  //   //   ),);
  //   // });
  //   context.read<MyRecordViewModel>().vitalsList.first.vsArray?.forEach((element) {
  //
  //     tabs.add(
  //       Tab(
  //         height: 70,
  //         child: Card(
  //             child: Padding(
  //               padding:  EdgeInsets.all(4.0.r),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //
  //                 children: [
  //                   Text("${element.patientsVs!.isNotEmpty ? element.patientsVs?.first.name : ""}", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
  //                   Text("${element.patientsVs!.isNotEmpty ? element.patientsVs?.first.refRangeValue : ""}", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: _tabController?.index == 0 ? AppColors.primaryColor : const Color(0xFF646464)),),
  //                 ],
  //               ),
  //             ))),);
  //     tabView.add(const Card(
  //
  //     ),);
  //   });
  //   setState(() {
  //
  //   });
  //   debugPrint("-----tabbar ${tabs.length}---tbview--${tabView.length}-");
  // }




  PatientsVs? dropdownValue ;
  bool isBloodPressure = true;
  @override
  Widget build(BuildContext context) {

    final vital = Provider.of<MyRecordViewModel>(context);

    List<Widget> getTabBar(){
      tabs.clear();
      vital.vitalsList.first.vsArray?.forEach((element) {
        tabs.add(
          Tab(
              height: 70,
              child: Card(
                  child: Padding(
                    padding:  EdgeInsets.all(4.0.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text("${element.patientsVs!.isNotEmpty ? element.patientsVs?.first.name : ""}", textAlign: TextAlign.center, style: TextStyle(fontSize: 10.sp, color: const Color(0xFF646464)),),
                        Text("${element.patientsVs!.isNotEmpty ? element.patientsVs?.first.refRangeValue : ""}", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color:  AppColors.primaryColor),),
                      ],
                    ),
                  ),),),);
      });
      return tabs;
    }
    List<Widget> getTabView(){
      tabView.clear();
      vital.vitalsList.first.vsArray?.forEach((element) {
        tabView.add( CustomLineChartAll(patientVsList: element.patientsVs ?? [],));
      });
      return tabView;
    }
    return DefaultTabController(
      length: vital.vitalsList.isNotEmpty ? vital.vitalsList.first.vsArray!.length : 0,
      child: Scaffold(
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
            vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) : VitalsCard(title: "${vital.vitalsList.first.bpArray?.first.name}", subtitle: "${vital.vitalsList.first.bpArray?.first.systolic}/${vital.vitalsList.first.bpArray?.first.diastolic}", image: "${AppUrls.image}images/VitalSignIcon/${vital.vitalsList.first.bpArray?.first.icon}", v: Vitals.bloodPressure, allData: const [], index: 0),
            vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: vital.vitalsList.isNotEmpty ? vital.vitalsList.first.vsArray?.length : 0,
                itemBuilder: (context, index) {
                // if(vital.vitalsList.isNotEmpty){
                //   PatientsVs? vitals = vital.vitalsList.first.vsArray?[index].patientsVs?.first;
                // }else{
                //   PatientsVs? vitals;
                // }
               final vitals =  vital.vitalsList.first.vsArray?[index];
               debugPrint(vitals.toString());
                  return VitalsCard(index: index, title: "${vitals!.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.name : ""}", subtitle: "${ vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.refRangeValue : ""}", image: "${AppUrls.image}images/VitalSignIcon/${vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.icon : ""}", allData: vitals.patientsVs!.isNotEmpty ? vitals.patientsVs! : [], v: vitals.patientsVs!.isNotEmpty ? vitals.patientsVs?.first.name.toString().toLowerCase() == "blood pressure" ? Vitals.bloodPressure : Vitals.weight :  Vitals.weight,);
                },
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 2,
            //   childAspectRatio: 3/2,
            // ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const VitalsCard(title: "Blood Pressure", subtitle: "120/80", image: Assets.vitalsBloodPressure, v: Vitals.bloodPressure,),
            //     SizedBox(width: 6.w,),
            //     const VitalsCard(title: "Heart Rate", subtitle: "89", image: Assets.vitalsHeartRate, v: Vitals.heartRate),
            //   ],
            // ),
            // SizedBox(height: 6.h,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const VitalsCard(title: "Temperature", subtitle: "90.7  c", image: Assets.vitalsTemperature, v: Vitals.temperature),
            //     SizedBox(width: 6.w,),
            //     const VitalsCard(title: "Weight", subtitle: "75kg", image: Assets.vitalsWeight, v: Vitals.weight),
            //   ],
            // ),
            // SizedBox(height: 6.h,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const VitalsCard(title: "Height", subtitle: "172cm", image: Assets.vitalsHeight, v: Vitals.height),
            //     SizedBox(width: 6.w,),
            //     const VitalsCard(title: "BMI", subtitle: "27.7", image: Assets.vitalsBmi, v: Vitals.bmi),
            //   ],
            // ),
            // SizedBox(height: 6.h,),
            // Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(8.r),
            //   ),
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.h),
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text("Blood Sugar", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
            //             SizedBox(width: 5.w,),
            //             Image.asset(Assets.vitalsBloodSugar, height: 35.h, fit: BoxFit.fill,),
            //           ],
            //         ),
            //         SizedBox(height: 15.h,),
            //         Table(
            //           border: TableBorder.all(color: Colors.transparent,),
            //
            //           children: [
            //             TableRow(
            //                 children: [
            //               const Text("  "),
            //               Text("HBA1C", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //               Text("Mean Blood", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //               Text("Glucose", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //             ]),
            //             TableRow(children: [
            //               Text("F", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //               Text("5.0", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //               Text("80", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //               Text("4.7", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //             ]),
            //             TableRow(children: [
            //               Text("NF", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //               Text("6.0", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //               Text("70", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //               Text("4.7", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //             ]),
            //           ],
            //         ),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //   children: [
            //         //     Text("  "),
            //         //     Text("HBA1C", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //         //     Text("Mean Blood", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //         //     Text("Glucose", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //         //   ],
            //         // ),
            //         // SizedBox(height: 6.h,),
            //         // Row(
            //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         //   children: [
            //         //     Text("F", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF646464)),),
            //         //     Text("5.0", textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //         //     Text("80",style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //         //     Text("4.7", style: TextStyle(fontSize: 16.sp, color: AppColors.primaryColor),),
            //         //   ],
            //         // ),
            //         // SizedBox(height: 6.h,),
            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 12.h,),
            Text("Overview", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xFF3C3C3C)),),
            SizedBox(height: 18.h,),
            //  SizedBox(
            //   height: 40.h,
            //   child: ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //           backgroundColor: isBloodPressure ? AppColors.primaryColor : Colors.black12
            //       ),
            //       onPressed:  () {
            //         setState(() {
            //           isBloodPressure = true;
            //         });
            //       }, child:  Text("Blood Pressure", style: TextStyle(fontSize: 16.sp, color: Colors.white),)),
            // ),
            Text("Blood Pressure", style: TextStyle(fontSize: 16.sp, color: Colors.black  ),),
            SizedBox(height: 18.h,),
            vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) :const SizedBox(height: 300, child: CustomLineChart(),),
            SizedBox(height: 18.h,),
      vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) : TabBar(
      // controller: _tabController,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppColors.primaryColor,
      isScrollable: true,

      tabs: getTabBar(),

      ),
SizedBox(height: 10.h,),
            vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) : SizedBox(
              height: 300.h,
              child: TabBarView(
                  // controller: _tabController,
                children: getTabView(),
              ),
            ),
            SizedBox(height: 18.h,),
//             vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) : Row(
//               children: [
//                 SizedBox(
//                   height: 40.h,
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: isBloodPressure ? AppColors.primaryColor : Colors.black12
//                       ),
//                       onPressed:  () {
//                      setState(() {
//                        isBloodPressure = true;
//                      });
//                   }, child: const Text("Blood Pressure")),
//                 ),
// //                 Expanded(child: Card(
// //                   color: isBloodPressure ? Colors.black12 : AppColors.primaryColor,
// //                   child: SizedBox(
// //                     height: 40.h,
// //                     child: DropdownButton<PatientsVs>(
// //                       isExpanded: true,
// //                       onTap: () {
// // setState(() {
// //   isBloodPressure = false;
// // });
// //                       },
// //                       value: dropdownValue,
// //
// //                       items: vital.vitalsList.first.vsArray!
// //                           .map<DropdownMenuItem<PatientsVs>>((VsArray value) {
// //                         return DropdownMenuItem<PatientsVs>(
// //                           value: value.patientsVs?.first,
// //                           child: Text(
// //                             "${value.patientsVs?.first.name}",
// //                             style: TextStyle(fontSize: 18.sp),
// //                           ),
// //                         );
// //                       }).toList(),
// //                       // Step 5.
// //                       onChanged: (PatientsVs? newValue) {
// //                         setState(() {
// //                           dropdownValue = newValue;
// //
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                 ),)
//               ],
//             ),
          SizedBox(height: 25.h,),
            // vital.isVitalLoading ? const Center(child: CircularProgressIndicator(),) : SizedBox(
            //     height: 300.h,
            //     width: double.infinity,
            //     child: isBloodPressure ? const CustomLineChart() : getLineChart(dropdownValue?.name.toString().toLowerCase())),
SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}

getLineChart(List<PatientsVs> val){
  return CustomLineChartAll(patientVsList: val,);
}

// getButtons(){
//   for(var i = 0; i< ; i++){
//     return SizedBox(
//         height: 40.h,
//         child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//         backgroundColor: isBloodPressure ? AppColors.primaryColor : Colors.black12
//     ),
//   onPressed:  () {
//   setState(() {
//   isBloodPressure = true;
//   });
//   }, child: const Text("Blood Pressure"));
//   }
// }