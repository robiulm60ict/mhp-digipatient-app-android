import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';

class MyRecordListTile extends StatelessWidget {
  const MyRecordListTile({Key? key, required this.title, required this.iconData, this.iconColor, this.onTap}) : super(key: key);
  final String title;
  final IconData iconData;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0.h),
        child: ListTile(
          onTap: onTap,
          leading: Icon(iconData, color: iconColor, size: 18.h,),
          title: Text(title, style:Style.alltext_default_balck_blod),
          trailing: Icon(Icons.arrow_forward_ios, size: 15.h, color: AppColors.blackColor,),
        ),
      ),
    );
  }
}
