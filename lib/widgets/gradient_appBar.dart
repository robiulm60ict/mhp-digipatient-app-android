import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';

class GradientAppBar extends StatelessWidget {
  const GradientAppBar({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
        color: AppColors.page_background_color,
        // gradient: LinearGradient(
        //   end: Alignment.topCenter,
        //   begin: Alignment.bottomCenter,
        //   colors: [
        //     AppColors.linearGradient1,
        //     AppColors.linearGradient2,
        //   ],),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22.r), bottomRight: Radius.circular(22.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(height: 74.h, width: 136.w, Assets.imagesLogoGreen),
          SizedBox(height: 15,),
          Text(text, textAlign: TextAlign.center, style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor ),),

        ],
      ),
    );
  }
}
