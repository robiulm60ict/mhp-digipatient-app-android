import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.textEditingController,
      this.keyboardType,
      this.prefix,
      this.hintText,
      this.obscureText = false,
      this.suffix,
      this.onTap,
      this.maxLength,
      this.enable})
      : super(key: key);
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final String? hintText;
  final bool obscureText;
  final Widget? suffix;
  final VoidCallback? onTap;
  final bool? enable;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enable,
      controller: textEditingController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(fontSize: 16.sp),
      onTap: onTap,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.hint_text_color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.hint_text_color),
        ),
        enabled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.hint_text_color),
        ),
      ),
    );
  }
}
