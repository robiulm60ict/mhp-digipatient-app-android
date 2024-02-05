import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../generated/assets.dart';
import '../resources/colors.dart';
import '../resources/styles.dart';

Widget bannerShimmereffect(height, width) => Container(
      margin:  EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: AppColors.shimmer_base_colors,
            width: 0.07,
          )),
      width: width,
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmer_base_colors,
        highlightColor: AppColors.page_background_color,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            Assets.shimmer,
            width: width,
            height: height,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );

Widget noDataFounForList(text) => Container(
  width: double.infinity,
      padding: const EdgeInsets.only(top: 40,left: 2,right: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.nodatafound,
              height: 250.h,
              width: 400.w,
            ),
          ),
          Text(
            text,
            style: Style.alltext_OverLarge_black24_bold,
          )

        ],
      ),
    );
