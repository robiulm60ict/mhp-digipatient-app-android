import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VitalsSetButton extends StatelessWidget {
  const VitalsSetButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor
          ),
          onPressed: onPressed, child: Text("Set", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.white),)),
    );
  }
}
