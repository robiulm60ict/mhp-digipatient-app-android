import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.margin = 8, this.padding = 0, this.poopAllRoute = false}) : super(key: key);
  final double margin;
  final double padding;
  final bool poopAllRoute;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Card(
        margin: EdgeInsets.all(margin.r),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(padding.r),
          child: Icon(Icons.arrow_back, color: AppColors.primaryColor, size: 20.h,),
        ),
      ),
    );
  }
}
