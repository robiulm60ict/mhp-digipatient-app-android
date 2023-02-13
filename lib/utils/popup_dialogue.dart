import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

import '../generated/assets.dart';

notificationPopup(BuildContext context, {Color color = Colors.grey, required String doctorName, }) {
  return popUpDialogue(context, Column(
    children: [
      //doctor name designation and image
      Row(
        children: [
          // doctor name and designation
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //doctor name
                Text(
                  doctorName,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                //doctor designation
                Text(
                  "Heart specialist",
                  style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          //doctore image
          Container(
            padding: EdgeInsets.only(left: 5.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: -2,
                    blurRadius: 20,
                    offset: const Offset(0, -2)),
              ],
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 25.h,
              backgroundImage:  const AssetImage(Assets.avatar,),
            ),
          ),
        ],
      ),

      //appointment time
      Container(
        margin: EdgeInsets.only(top: 17.h),
        padding:
        EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
        decoration: BoxDecoration(
            color: const Color(0xffF1F4F7),
            borderRadius: BorderRadius.circular(5.r)),
        child: Column(
          children: [
            //time
            Row(
              children: [
                Icon(
                  Icons.timer,
                  color: color,
                  size: 18.h,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "10:30PM - 11:00PM",
                  style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            //hospital name
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.home_outlined,
                  color: color,
                  size: 18.h,
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  "Dhaka Court",
                  style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            //Date ===============
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  color: color,
                  size: 16.sp,
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  "August 15,2021",
                  style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            //Hospital location ==============
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: color,
                  size: 18.sp,
                ),
                SizedBox(
                  width: 5.h,
                ),
                Text(
                  "Dhanmondi, Dhaka",
                  style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),);
}

selectCategoryPopUp(BuildContext context,){
  return popUpDialogue(context, Column(
    children: [
      ElevatedButton(onPressed: (){
        context.router.pop();
      }, child: Text("All", style: TextStyle(fontSize: 14.sp, color: Colors.white),)),
      ElevatedButton(onPressed: (){
        context.router.pop();

      }, child: Text("Doctor", style: TextStyle(fontSize: 14.sp, color: Colors.white),)),
      ElevatedButton(onPressed: (){
        context.router.pop();

      }, child: Text("Hospital", style: TextStyle(fontSize: 14.sp, color: Colors.white),)),
    ],
  ));
}
popUpDialogue(BuildContext context, Widget content, ){
  return Alert(
    context: context,
    style: AlertStyle(
        alertElevation: 0,
        overlayColor: Colors.black.withOpacity(.6),
        alertPadding: const EdgeInsets.all(25),
        isButtonVisible: false,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        titleStyle: const TextStyle(),
        animationType: AnimationType.grow,
        animationDuration: const Duration(milliseconds: 500)),
    content: Container(
      margin: EdgeInsets.only(top: 22.h),
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            spreadRadius: -2,
            blurRadius: 13,
            offset: const Offset(0, 13),),
        ],
      ),
      child: content,
    ),).show();
}