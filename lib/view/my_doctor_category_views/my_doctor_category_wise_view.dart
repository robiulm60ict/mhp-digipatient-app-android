import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/custom_rating.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';

class MyDoctorCategoryWiseView extends StatelessWidget {
  const MyDoctorCategoryWiseView({Key? key, required this.categoryName}) : super(key: key);
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 130.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.cardiology, height: 117.h, width: 134.w,),
                    Text(categoryName, style: TextStyle(fontSize: 26.sp, color: Colors.white),)
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h,),
            Expanded(child: GridView.builder(
                gridDelegate: FlutterzillaFixedGridView(
                    crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                  height: 130.h

                ), itemBuilder: (context, index)=> Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  margin: const EdgeInsets.only(top: 35),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    child: Column(
                      children: [
                        SizedBox(height: 35.h, width: double.infinity,),
                        Text("Dr. Asif Manwar", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464),),),
                        Text("Consultant, Cardiology", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A),),),
                        Text("Square Hospital", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp,  color: const Color(0xFF8A8A8A),),),
                        CustomRating.ratingBar(onRatingUpdate: (val){}),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: 0,
                    child: CircleAvatar(radius: 25.h,),),
              ],
            ),),),
          ],
        ),
      ),
    );
  }
}
