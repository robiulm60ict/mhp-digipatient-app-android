import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';
import '../routes/routes.gr.dart';

class VitalsCard extends StatelessWidget {
  const VitalsCard({Key? key, required this.title, required this.subtitle, required this.image, this.onTap}) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          context.router.push(VitalsItemDetailsRoute(title: title, img: image, subtitle: subtitle));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(title, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
                    Image.asset(image, height: 35.h,  fit: BoxFit.fill,),
                  ],
                ),
                Align(
                    // alignment: Alignment.centerLeft,
                    child: Text(subtitle, textAlign: TextAlign.start, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),)),
              ],
            ),
          )
        ),
      ),
    );
  }
}
