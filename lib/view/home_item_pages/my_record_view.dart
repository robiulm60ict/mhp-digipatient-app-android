import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/my_record_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyRecordView extends StatelessWidget {
  const MyRecordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text("My Record", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.h,

                  ), SizedBox(width: 8.w,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Habibur Rahman", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                        SizedBox(height: 2.h,),
                        Text("28543564789",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),),
                        SizedBox(height: 5.h,),
                        Wrap(
                        children: [
                          Icon(Icons.male, size: 13.h, color: const Color(0xFF8A8A8A),),
                          Text("Gender:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
                          Text("Male", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),),
                          SizedBox(width: 8.w,),
                          Icon(Icons.bloodtype, size: 13.h, color: const Color(0xFF8A8A8A),),
                          Text("Blood:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
                          Text("O+", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),),
                        ],
                      )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h,),

          MyRecordListTile(title: 'Vital', iconData: Icons.heart_broken, iconColor: Colors.red, onTap: (){
            context.router.push(const VitalsRoute());
          }),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'My medical History', iconData: Icons.medical_information, ),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'Self Medical History from Great Doc', iconData: Icons.medication_liquid_sharp,),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'Reason For Visit', iconData: Icons.read_more,),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'My Report', iconData: Icons.report, iconColor: Colors.blue,),
          SizedBox(height: 5.h,),
        ],
      ),
    );
  }
}
