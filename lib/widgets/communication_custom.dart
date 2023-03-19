import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';

class CommunicationCustom extends StatelessWidget {
  const CommunicationCustom({Key? key, required this.userName, required this.message, this.onTap}) : super(key: key);
  final String userName;
  final String message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r)),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(Assets.imagesAvatar),
            ),
            title: Text(
              userName,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              message,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
            ),
          )
      ),
    );
  }
}
