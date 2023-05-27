import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.title,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      required this.onPressed,  this.isExpanded = true,
      this.notExpandedWidth = double.infinity,
        this.radius = 5,
      })
      : super(key: key);
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isExpanded;
  final double notExpandedWidth;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return isExpanded ? Expanded(
      child: SizedBox(
        height: 40.h,
        child: ElevatedButton(

          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
            )
          ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 14.sp, fontWeight: FontWeight.w700, color: textColor),
          ),
        ),
      ),
    ) : SizedBox(
      height: 40.h,
      width: notExpandedWidth.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w700, color: textColor),
        ),
      ),
    );
  }
}
