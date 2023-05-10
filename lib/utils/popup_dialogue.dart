import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/doctor_model/doctors_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

import '../generated/assets.dart';

notificationPopup(BuildContext context, {Color color = Colors.grey, required String doctorName, required String docImage, }) {
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
                  "specialist",
                  style: TextStyle(
                    color: color,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),

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
              backgroundImage:   NetworkImage(docImage),
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
                  "time",
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
                  "hospital name",
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
                  "date",
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
                  "location",
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

invoiceSuccessPopUp(BuildContext context,{bool barrierDismissible = false, required String appointmentDate, required String doctorId, required String patientId, required String amount, required String paymentMethod, required String appointmentType, required Doctors doctor}){
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useSafeArea: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r)
        ),
        actionsPadding: EdgeInsets.only(bottom: 25.h),
        title: Lottie.asset(Assets.animationSuccessful, repeat: false),
        content: Text('Payment Successful', textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        alignment: Alignment.center,
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              context.router.push(SingleInvoiceRoute(appointmentDate: appointmentDate, doctorId: doctorId, patientId: patientId, amount: amount, appointmentType: appointmentType, doctor: doctor, paymentMethod: paymentMethod));
            },
            child: Text('View Invoice', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),),
          ),
        ],
      );
    },
  );

}