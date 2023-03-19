import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';
import '../resources/colors.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({Key? key, required this.doctorName, required this.appointmentTime, this.onTap}) : super(key: key);
  final String doctorName;
  final String appointmentTime;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r)
      ),
      child: ListTile(
        onTap: onTap,
        leading: const CircleAvatar(
          backgroundImage: AssetImage(
            Assets.imagesAvatar,
          ),
        ),
        title: RichText(
          text: TextSpan(
            text: 'Today, You have an appointment on ',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: doctorName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
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