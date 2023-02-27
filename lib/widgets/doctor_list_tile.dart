import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';
import '../resources/colors.dart';

class DoctorListTileFavourite extends StatelessWidget {
  const DoctorListTileFavourite({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),

      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22.h,
              backgroundColor: AppColors.primaryColor,
              child: CircleAvatar(
                radius: 20.h,
                child: Image.asset(Assets.avatar),
              ),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dr. Md. Sultan Sarwar Parvez",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Speciality:", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF8A8A8A)),),
                      Text(" Cardiac Surgeon", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),)
                    ],
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          width: 62.w,
                          fit: BoxFit.fill,
                          Assets.hospitalLogo),
                      Text(" Cardiac Surgeon", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
