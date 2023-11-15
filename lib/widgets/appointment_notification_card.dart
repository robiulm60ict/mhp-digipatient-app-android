import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/styles.dart';

class AppointmentNotificationCard extends StatelessWidget {
  const AppointmentNotificationCard({Key? key, required this.docImage, required this.title, required this.subTitle, required this.onTap}) : super(key: key);
  final String docImage;
  final String title;
  final String subTitle;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: ClipOval(
          child: Image.network(docImage, fit: BoxFit.cover, height: 50, width: 50, errorBuilder: (context, error, stackTrace) => CircleAvatar(child: Text("Error"),),),
        ),
        title: Text(title, style: Style.alltext_default_balck_blod,),
        subtitle: Text(subTitle, style: Style.alltext_default_balck,),
      ),
    );
  }
}
