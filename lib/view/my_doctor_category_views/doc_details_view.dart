import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/custom_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class DocDetailsView extends StatefulWidget {
  const DocDetailsView({Key? key}) : super(key: key);

  @override
  State<DocDetailsView> createState() => _DocDetailsViewState();
}

class _DocDetailsViewState extends State<DocDetailsView> {
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.linearGradient2,
      ),
      backgroundColor: AppColors.primaryColor,
      body: Column(
        // alignment: Alignment.topCenter,
        children: [
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.linearGradient2,
                  AppColors.linearGradient1,
                ],),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.w, top: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dr. Habib", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.white),),
                        SizedBox(height: 8.h,),
                        Text("Consultant Cardiology", maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14.sp, color: Colors.white),),
                        SizedBox(height: 8.h,),
                        Row(
                          children: [
                            CustomRating.ratingBar(
                                itemSize: 20,
                                onRatingUpdate: (rati){
                                  rating = rati;
                                  setState(() {

                                  });
                                }),
                            SizedBox(width: 8.w,),
                            Text("$rating", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),)
                          ],
                        ),

                        SizedBox(height: 18.h,),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 45.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r),bottomLeft: Radius.circular(5.r)),
                                  border: Border.all(color: Colors.white, width: 0.5)
                              ),
                              child: const Icon(Icons.monetization_on_rounded, color: Colors.white,),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 45.h,
                                // width: 60.w,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(5.r),bottomRight: Radius.circular(5.r)),
                                  border: Border.all(color: Colors.white, width: 0.5),
                                ),
                                child: RichText(text: TextSpan(text: "1500. ",
                                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
                                    children: [
                                      TextSpan(text: "BDT",
                                        style: TextStyle(fontSize: 14.sp, color: Colors.white),

                                      )
                                    ]
                                ),

                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 70.h,
                          backgroundColor: AppColors.linearGradient1,
                        ),
                      ),
                      Image.asset(Assets.user, height: double.infinity, width: double.infinity,  fit: BoxFit.fill,),

                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            // height: 600,
            child: Card(
              elevation: 7,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r), topRight: Radius.circular(25.r))
              ),
              child: ListView(
                children: [

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
