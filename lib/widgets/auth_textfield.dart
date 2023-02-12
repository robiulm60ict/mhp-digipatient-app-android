import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {Key? key,
      this.textEditingController,
      this.focusNode,
      this.onFieldSubmitted,
      this.keyBoardType = TextInputType.emailAddress,
      this.prefixIconData = Icons.email,
      this.hintText = 'habib@gmail.com',
      this.enable = true,
        this.onTap,
      })
      : super(key: key);
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final TextInputType keyBoardType;
  final IconData prefixIconData;
  final String hintText;
  final bool enable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: keyBoardType,
      enabled: enable,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIconData),
        hintText: hintText,
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
