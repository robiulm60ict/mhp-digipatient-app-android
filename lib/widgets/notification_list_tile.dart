import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';
import '../resources/colors.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({Key? key, required this.doctorName, required this.appointmentTime, this.onTap, required this.docImage, required this.beforeText}) : super(key: key);
  final String doctorName;
  final String beforeText;
  final String appointmentTime;
  final VoidCallback? onTap;
  final String docImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
            docImage,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: beforeText,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: " $doctorName",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.text_primary_color,
                    fontSize: 14.sp
                ),
              ),
            ],
          ),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.access_alarm, size: 11.h, color: AppColors.greyColor,),
            SizedBox(width: 5.w,),
            Text(
              appointmentTime,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
        // trailing: Icon(Icons.more_vert, ),
      ),
    );
  }
}