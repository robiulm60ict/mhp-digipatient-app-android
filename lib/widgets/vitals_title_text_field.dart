import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';

class VitalTextTitle extends StatelessWidget {
  const VitalTextTitle({Key? key, required this.title, required this.controller, this.keyBoardType}) : super(key: key);
  final String title;
  final TextEditingController controller;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.primaryColor,
              width: .5.r,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border(
                        right: BorderSide(color: AppColors.primaryColor)
                    )
                ),
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  title, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: controller,
                // keyboardType: keyBoardType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}