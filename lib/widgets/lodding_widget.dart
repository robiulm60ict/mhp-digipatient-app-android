import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
        child: OverflowBox(
          minHeight: 130.h,
          maxHeight: 130.h,
          child: Lottie.asset(
            'assets/animation/loader.json',
            height: 130.h,
            repeat: true,
            reverse: true,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

