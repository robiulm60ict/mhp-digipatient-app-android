import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/enum/vitals_enum.dart';
import 'package:digi_patient/model/my_record_model/vitals_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';
import '../routes/routes.gr.dart';

class VitalsCard extends StatelessWidget {
  const VitalsCard({Key? key, required this.title, required this.subtitle, required this.image, this.onTap, required this.v, required this.allData, required this.index, required this.icon, required this.unitId, required this.color}) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;
  final Vitals v;
  final List<PatientsVs> allData;
  final int index;
  final String icon;
  final String unitId;
  final String color;

  @override
  Widget build(BuildContext context) {
    // debugPrint("----------------------------${allData.length}");
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
          child: ListTile(
            onTap: (){
              context.router.push(VitalsItemDetailsRoute(index: index, icon: icon, title: title, img: image, subtitle: subtitle, v: v, allData: allData, unitId: unitId, color: color));
            },
            title: Text(title, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
          subtitle: Text(subtitle, textAlign: TextAlign.start, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
          leading: Image.network(image, height: 35.h,  fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red,),),
          ),
          // child: Column(
          //   mainAxisSize: MainAxisSize.min,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
          //         Image.network(image, height: 35.h,  fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: Colors.red,),),
          //       ],
          //     ),
          //     Align(
          //       // alignment: Alignment.centerLeft,
          //         child: Text(subtitle, textAlign: TextAlign.start, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),)),
          //   ],
          // ),
        )
    );
    // return Expanded(
    //   child: InkWell(
    //     onTap: (){
    //       if(v != Vitals.bmi){
    //         //TODO: Uncomment this to visit route
    //         context.router.push(VitalsItemDetailsRoute(index: index, title: title, img: image, subtitle: subtitle, v: v, allData: allData));
    //       }
    //     },
    //     child: Card(
    //       shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.circular(8.r)
    //       ),
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
    //                 Image.network(image, height: 35.h,  fit: BoxFit.fill, errorBuilder: (context, error, stackTrace) => Icon(Icons.error, color: Colors.red,),),
    //               ],
    //             ),
    //             Align(
    //                 // alignment: Alignment.centerLeft,
    //                 child: Text(subtitle, textAlign: TextAlign.start, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),)),
    //           ],
    //         ),
    //       )
    //     ),
    //   ),
    // );
  }
}
