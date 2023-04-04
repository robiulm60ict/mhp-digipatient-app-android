import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, this.hintText, this.height = 40, this.suffixIcon, this.onTap}) : super(key: key);
  final String? hintText;
  final double height;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: TextField(
        onTap: onTap,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none
          ),
          prefixIcon: Icon(Icons.search, color: AppColors.primaryColor,),
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
