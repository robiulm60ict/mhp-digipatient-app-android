import 'package:digi_patient/enum/vitals_enum.dart';
import 'package:digi_patient/utils/popup_dialogue.dart';
import 'package:digi_patient/widgets/vitals_set_button.dart';
import 'package:digi_patient/widgets/vitals_title_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/back_button.dart';

class VitalsItemDetailsView extends StatelessWidget {
  const VitalsItemDetailsView({Key? key, required this.title, required this.img, required this.subtitle, required this.v}) : super(key: key);
  final String title;
  final String img;
  final String subtitle;
  final Vitals v;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text(title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
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
                padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 25.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(img, height: 70, width: 70, fit: BoxFit.fitHeight,),
                    SizedBox(width: 16.w,),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
                        Text(subtitle, style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            SizedBox(
              height: 40.h,
              child: ElevatedButton(onPressed: (){
                getPopUpDialogue(v, context);
              }, child: Text("+ Add $title", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),)),
            ),
            SizedBox(height: 20.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(" Last 2 Months  ", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),)),
            SizedBox(height: 8.h,),
            Expanded(child: ListView.builder(
              itemCount: 7,
                itemBuilder: (context, index) {
                  return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Card(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.0.w),
                            child: Icon(Icons.delete, color: AppColors.primaryColor, size: 16.h,),
                          ),
                        ),
                      ),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 4.h),
                          child: Row(
                            children: [
                              Image.asset(img, height: 30, width: 30, fit: BoxFit.fill,),
                              SizedBox(width: 5.w,),
                              Text(subtitle, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
                              const Spacer(),
                              Icon(Icons.date_range, color: const Color(0xFF646464), size: 16.h,),
                              SizedBox(width: 3.w,),
                              Text("03/12/2022", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
                              SizedBox(width: 5.w,),
                              IconButton(onPressed: (){}, icon:  Icon(Icons.delete, color: Colors.red, size: 16.h,))
                            ],
                          ),
                        ),
                      ),
                  );
                },))
          ],
        ),
      ),
    );
  }
}

getPopUpDialogue(Vitals v, BuildContext context){
  TextEditingController sbp = TextEditingController();
  TextEditingController dbp = TextEditingController();

  if(v == Vitals.bloodPressure){
    return popUpDialogue(context, Column(
      children: [
        VitalTextTitle(title: "Systolic BP", controller: sbp),
        SizedBox(height: 10.h,),
        VitalTextTitle(title: "Diastolic BP", controller: dbp),
        SizedBox(height: 20.h,),
        VitalsSetButton(onPressed: (){}),
      ],
    ),
    );
  }
}


