import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';
import '../resources/styles.dart';

class VitalTextTitle extends StatelessWidget {
  const VitalTextTitle({Key? key, required this.title, required this.controller, this.keyBoardType}) : super(key: key);
  final String title;
  final TextEditingController controller;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 35.h,
    //   width: double.infinity,
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //         color: AppColors.primaryColor,
    //         width: .5.r,
    //     ),
    //   ),
    //   child: Row(
    //     children: [
    //       Expanded(
    //         child: Container(
    //           height: 30.h,
    //           alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //               color: Colors.grey.shade200,
    //               border: Border(
    //                   right: BorderSide(color: AppColors.primaryColor)
    //               )
    //           ),
    //           padding: EdgeInsets.symmetric(horizontal: 6.w),
    //           child: Text(
    //             title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         child: SizedBox(
    //           height: 30.h,
    //           child: TextField(
    //             controller: controller,
    //             // keyboardType: keyBoardType,
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: Style.alltext_default_balck,),
        SizedBox(height: 20.h,),
        SizedBox(
          width: 200.w,
          child: TextField(controller: controller, keyboardType: TextInputType.number, enabled: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor)
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryColor)
            )
          ),
          ),
        ),
      ],
    );
  }
}