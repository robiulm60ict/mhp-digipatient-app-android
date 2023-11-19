import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/enum/vitals_enum.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:digi_patient/utils/popup_dialogue.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:digi_patient/widgets/vitals_set_button.dart';
import 'package:digi_patient/widgets/vitals_title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../resources/app_url.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../utils/message.dart';
import '../../../utils/utils.dart';
import '../../../widgets/back_button.dart';

class VitalsItemDetailsView extends StatefulWidget {
  const VitalsItemDetailsView(
      {Key? key,
      required this.title,
      required this.img,
      required this.subtitle,
      required this.v,
      this.allData,
      required this.index,
      required this.icon,
      required this.unitId,
      required this.color})
      : super(key: key);
  final String title;
  final String img;
  final String subtitle;
  final Vitals v;
  final List<PatientsVs>? allData;
  final int index;
  final String icon;
  final String unitId;
  final String color;

  @override
  State<VitalsItemDetailsView> createState() => _VitalsItemDetailsViewState();
}

class _VitalsItemDetailsViewState extends State<VitalsItemDetailsView> {
  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context);
    Widget getView() {
      // if(v == Vitals.bloodPressure){
      //   return Expanded(
      //     child: ListView.builder(
      //       itemCount: myRecord.vitalsList.first.bpArray?.length ?? 0,
      //       itemBuilder: (context, index) {
      //         BpArray vitals =  myRecord.vitalsList.first.bpArray![index] ;
      //         // myRecord.vitalsList.first.bpArray!.isNotEmpty ?
      //         return Card(
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 4.h),
      //             child: ListTile(
      //               leading: Image.network(
      //                 "https://gdbackend.macrohealthplus.org//images/VitalSignIcon/${vitals.icon}",
      //                 height: 35, width: 35, fit: BoxFit.fill,
      //                 errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red,),
      //               ),
      //               title: Text("${vitals.systolic}/${vitals.diastolic}", style: Style.alltext_default_balck_blod),
      //               subtitle: Text(myRecord.getDate("${vitals.createdAt}"), style: Style.alltext_default_balck),
      //               trailing: Text(myRecord.getTime("${vitals.createdAt}", context), style:Style.alltext_default_balck,),
      //
      //             ),
      //           ),
      //         );
      //       } ,),
      //   );
      // }else{
      return Expanded(
        child: ListView.builder(
          itemCount:
              myRecord.vitalsList.first.vsArray?[widget.index].patientsVs?.length ?? 0,
          itemBuilder: (context, ind) {
            final vitals =
                myRecord.vitalsList.first.vsArray?[widget.index].patientsVs![ind];
            return Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 4.h),
                child: ListTile(
                  leading: Image.network(
                    "https://gdbackend.macrohealthplus.org//images/VitalSignIcon/${vitals?.icon}",
                    height: 35,
                    width: 35,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  ),
                  title: Text("${vitals?.value} ${vitals?.unitsId}",
                      style: Style.alltext_default_balck_blod),
                  subtitle: Text(
                    myRecord.getDate("${vitals?.lastCheckUpDate}"),
                    style: Style.alltext_default_balck,
                  ),
                  trailing: Text(
                      myRecord.getTime("${vitals?.lastCheckUpDate}", context),
                      style: Style.alltext_default_balck),
                ),
              ),
            );
          },
        ),
      );
      // }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text(widget.title, style: Style.alltext_appbar),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding.r),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      widget.img,
                      height: 35,
                      width: 35,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: Style.alltext_default_balck_blod,
                        ),
                        Text(widget.subtitle, style: Style.alltext_default_balck),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 40.h,
              child: ElevatedButton(
                  onPressed: () {

                    getPopUpDialogue(widget.v, context, widget.title,
                        icon: widget.icon, unitId: widget.unitId, color: widget.color);


                    // getVitalModalSheet(context, v: v, title: title);
                    // context.router.push(AddVitalsRoute());
                  },
                  child: Text(
                    "+ Add ${widget.title}",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  " Last 2 Months  ",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF646464)),
                )),
            SizedBox(
              height: 8.h,
            ),
            getView()
          ],
        ),
      ),
    );
  }
}

getPopUpDialogue(Vitals v, BuildContext context, String title,
    {required String icon, required String unitId, required String color}) {
  return popUpDialogue(context,
      getPopUp(v, title, context, icon: icon, unitId: unitId, color: color));
}

getVitalModalSheet(BuildContext context,
    {required Vitals v,
    required String unitId,
    required String color,
    required String title,
    required String icon}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return getPopUp(v, title, context,
          icon: icon, unitId: unitId, color: color);
    },
  );
}

getPopUp(Vitals v, String title, BuildContext context,
    {required String icon, required String unitId, required String color}) {
  TextEditingController bmih = TextEditingController();
  TextEditingController bmiw = TextEditingController();
  TextEditingController sbp = TextEditingController();
  TextEditingController dbp = TextEditingController();
  TextEditingController tC = TextEditingController();
  final vital = Provider.of<MyRecordViewModel>(context,listen: false);
  if (v == Vitals.bmi) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Card(child: ListTile(
        //   title: Text(vital.vitalStatus, textAlign: TextAlign.center, style: TextStyle(fontSize: 15.sp, color: Colors.black),),
        // trailing: vital.isSaveVitalLoading ? const Center(child: CircularProgressIndicator(),) : null,
        // ),),
        Center(child: Text("Enter $title Data", textAlign: TextAlign.center, style: Style.alltext_default_balck_blod,)),
        SizedBox(height: 20.h,),
        VitalTextTitle(title: "Weight in kilograms", controller: bmiw),
        SizedBox(height: 5.h,),
        VitalTextTitle(title: "Height in centimeters", controller: bmih),
        SizedBox(height: 10.h,),
        Center(
          child:   VitalsSetButton(onPressed: (){
            if(bmih.text.isNotEmpty && bmiw.text.isNotEmpty){
              vital.calculateBMI(bmiw, bmih);
              vital.saveVitals(context, vitalName: title, icon: icon, unitId: unitId, color: color, value: "${vital.bmiResult.toStringAsFixed(3)}");
              Navigator.pop(context);
            }else{
              vital.setVitalStatus("Enter Both Field data");
              Messages.flushBarMessage(context, "Enter Both Field data");
            }
          }),
        )

      ],
    );
  }
  if (v == Vitals.bloodPressure) {
    return Column(
      children: [
        // Card(child: ListTile(
        //   title: Text(vital.vitalStatus, textAlign: TextAlign.center, style: TextStyle(fontSize: 15.sp, color: Colors.black),),
        // trailing: vital.isSaveVitalLoading ? const Center(child: CircularProgressIndicator(),) : null,
        // ),),
        Text(
          "Enter $title Data",
          textAlign: TextAlign.center,
          style: Style.alltext_default_balck_blod,
        ),
        SizedBox(
          height: 50.h,
        ),
        VitalTextTitle(title: "Systolic BP", controller: sbp),
        SizedBox(
          height: 10.h,
        ),
        VitalTextTitle(title: "Diastolic BP", controller: dbp),
        SizedBox(
          height: 20.h,
        ),
        VitalsSetButton(onPressed: () {
          if (sbp.text.isNotEmpty && dbp.text.isNotEmpty) {
            vital.saveVitals(context,
                vitalName: title,
                icon: icon,
                unitId: unitId,
                color: color,
                value: "${sbp.text}/${dbp.text}");
            context.router.pop();
          } else {
            vital.setVitalStatus("Enter Both Field data");
            Messages.flushBarMessage(context, "Enter Both Field data");
          }
        }),
      ],
    );
  }
  else {
    return Column(
      children: [
        Text(
          "Enter $title Data",
          textAlign: TextAlign.center,
          style: Style.alltext_default_balck_blod,
        ),
        SizedBox(
          height: 50.h,
        ),
        VitalTextTitle(title: title, controller: tC),
        SizedBox(
          height: 20.h,
        ),
        VitalsSetButton(onPressed: () {
          if (tC.text.isNotEmpty) {
            vital.saveVitals(context,
                vitalName: title,
                icon: icon,
                unitId: unitId,
                color: color,
                value: tC.text);
            context.router.pop();
          } else {
            vital.setVitalStatus("Enter data");
            Messages.flushBarMessage(context, "Enter data");
          }
        }),
      ],
    );
  }
}
