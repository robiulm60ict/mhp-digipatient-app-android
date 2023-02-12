import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: InkWell(
          onTap: onTap,
          child: Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
               child: Center(child: Text(text, style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),))),
        )),
      ],
    );
  }
}
