import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key, required this.iconData, required this.title, this.onTap}) : super(key: key);
  final IconData iconData;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: Icon(iconData, size: 17.h, color: Colors.white,),
        ),
        title: Text(title, style: TextStyle(fontSize: 14.sp, color: AppColors.primaryColor),),
        trailing: Icon(Icons.arrow_forward_ios, size: 10.h, color: AppColors.primaryColor,),
      ),
    );
  }
}
