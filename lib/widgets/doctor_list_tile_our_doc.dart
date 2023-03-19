import 'package:digi_patient/utils/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';
import '../resources/colors.dart';

class DoctorListTileOurDoc extends StatelessWidget {
  const DoctorListTileOurDoc({Key? key, this.onTap}) : super(key: key);
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),

        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0.h, left: 12.w, bottom: 8.h, right: 10.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.h,
                child: Image.asset(Assets.imagesAvatar),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Bhabesh Chandra Mondal",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                    SizedBox(height: 5.h,),
                    Text("Consultant, Cardiac Anesthesiology", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),)
                    ,SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Degree:", textAlign: TextAlign.left, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: const Color(0xFF8A8A8A)),),
                        Text(" MBBS, DA, FCPS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),)
                      ],
                    ),
                    SizedBox(height: 5.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                            width: 62.w,
                            fit: BoxFit.fill,
                            Assets.imagesHospitalLogo),
                        CustomRating.ratingBar(onRatingUpdate: (r){}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
