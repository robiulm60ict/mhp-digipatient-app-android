import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';
import '../resources/constants.dart';
import '../routes/routes.gr.dart';
import '../widgets/custom_elivated_button.dart';

class Splash2View extends StatefulWidget {
  const Splash2View({Key? key}) : super(key: key);

  @override
  State<Splash2View> createState() => _Splash2ViewState();
}

class _Splash2ViewState extends State<Splash2View> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      context.router.replace(const SplashRoute());
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // body: Column(
      //   children: [
      //     // Stack(
      //     //   alignment: Alignment.bottomCenter,
      //     //   children: [
      //     //     Image.asset(
      //     //       Assets.imagesCurved,
      //     //       height: 565.h,
      //     //       width: double.infinity,
      //     //     ),
      //     //
      //     //     Positioned(
      //     //       bottom: 300,
      //     //       child: Text(
      //     //         "MacroHealthPlus",
      //     //         style: TextStyle(
      //     //             fontSize: 29.sp,
      //     //             color: const Color(0xFFFFFFFF),
      //     //             fontWeight: FontWeight.w700),
      //     //       ),
      //     //     ),
      //     //     Positioned(
      //     //       bottom: 100,
      //     //       child: Text(
      //     //         "Welcome",
      //     //         style: TextStyle(
      //     //             fontSize: 24.sp,
      //     //             color: AppColors.primaryColor,
      //     //             fontWeight: FontWeight.w700),
      //     //       ),
      //     //     ),
      //     //     Padding(
      //     //       padding: EdgeInsets.symmetric(horizontal: kPadding.w),
      //     //       child: Text(
      //     //         "MacroHealthPlus Software Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum lobortis vitae dictumst posuere suspendisse porttitor sed orci.",
      //     //         textAlign: TextAlign.left,
      //     //         style: TextStyle(
      //     //             fontSize: 14.sp,
      //     //             color: const Color(0xFF484848),
      //     //             fontWeight: FontWeight.w400),
      //     //       ),
      //     //     ),
      //     //   ],
      //     // ),
      //     Expanded(
      //       child: Stack(
      //         alignment: Alignment.center,
      //         children: [
      //           Container(
      //             height: 180.h,
      //             color: AppColors.primaryColor,
      //           ),
      //          // Column(
      //          //   children: [
      //          //     Expanded(
      //          //       flex: 2,
      //          //       child: ClipPath(
      //          //         clipper: ProsteBezierCurve(
      //          //           position: ClipPosition.top,
      //          //           list: [
      //          //             BezierCurveSection(
      //          //               start: Offset(screenWidth, 0),
      //          //               top: Offset(screenWidth, 0),
      //          //               end: const Offset(0, 0),
      //          //             ),
      //          //           ],
      //          //         ),
      //          //         child: Container(
      //          //           color: AppColors.primaryColor,
      //          //         ),
      //          //       ),
      //          //     ),
      //          //     Expanded(
      //          //       flex: 1,
      //          //       child: ClipPath(
      //          //         clipper: ProsteBezierCurve(
      //          //           position: ClipPosition.bottom,
      //          //           list: [
      //          //             BezierCurveSection(
      //          //               start: const Offset(0, 125),
      //          //               top: Offset(screenWidth / 4, 150),
      //          //               end: Offset(screenWidth / 2, 125),
      //          //             ),
      //          //             BezierCurveSection(
      //          //               start: Offset(screenWidth / 2, 125),
      //          //               top: Offset(screenWidth / 4 * 3, 100),
      //          //               end: Offset(screenWidth, 150),
      //          //             ),
      //          //           ],
      //          //         ),
      //          //         child: Container(
      //          //           alignment: Alignment.center,
      //          //           padding: EdgeInsets.only(bottom: 100.h),
      //          //           color: AppColors.primaryColor,
      //          //           child: Text(
      //          //             "MacroHealthPlus",
      //          //             style: TextStyle(
      //          //                 fontSize: 29.sp,
      //          //                 color: const Color(0xFFFFFFFF),
      //          //                 fontWeight: FontWeight.w700),
      //          //           ),
      //          //         ),
      //          //       ),
      //          //     ),
      //          //   ],
      //          // )
      //         ],
      //       ),
      //     ),
      //     // Stack(
      //     //   children: [
      //     //     Container(
      //     //       height: 200,
      //     //       color: Colors.grey,
      //     //     ),
      //     //     ClipPath(
      //     //       clipper: ProsteBezierCurve(
      //     //         position: ClipPosition.bottom,
      //     //         list: [
      //     //           BezierCurveSection(
      //     //             start: Offset(0, 150),
      //     //             top: Offset(screenWidth / 2, 200),
      //     //             end: Offset(screenWidth, 150),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //       child: Container(
      //     //         height: 200,
      //     //         color: Colors.red,
      //     //       ),
      //     //     ),
      //     //   ],
      //     // ),
      //
      //     Text(
      //       "Welcome",
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //           fontSize: 24.sp,
      //           color: AppColors.primaryColor,
      //           fontWeight: FontWeight.w700),
      //     ),
      //     Padding(
      //       padding:
      //           EdgeInsets.symmetric(horizontal: kPadding.w, vertical: 10.h),
      //       child: Text(
      //         "MacroHealthPlus Software Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum lobortis vitae dictumst posuere suspendisse porttitor sed orci.",
      //         textAlign: TextAlign.left,
      //         style: TextStyle(
      //             fontSize: 14.sp,
      //             color: const Color(0xFF484848),
      //             fontWeight: FontWeight.w400),
      //       ),
      //     ),
      //
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: kPadding.w),
      //       child: Row(
      //         children: [
      //           CustomElevatedButton(
      //             title: "Sign up",
      //             onPressed: () {
      //               context.router.replace(const SignupRoute());
      //             },
      //             textColor: AppColors.primaryColor,
      //           ),
      //           SizedBox(
      //             width: kPadding.w,
      //           ),
      //           CustomElevatedButton(
      //             title: "Log in",
      //             onPressed: () {
      //               context.router.replace(const LoginRoute());
      //             },
      //             textColor: Colors.white,
      //             backgroundColor: AppColors.primaryColor,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: kPadding.h,
      //     ),
      //   ],
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.linearGradient1,
              AppColors.linearGradient2,
            ],),),
      ),
    );
  }
}

