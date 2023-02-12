import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onPress,
      this.loading = false,
      this.height = 48,
      this.width = double.infinity})
      : super(key: key);
  final String title;
  final bool loading;
  final double height;
  final double width;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.h,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r)
          )
        ),
        child: loading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.0.r),
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  const Text("Please Wait"),
                ],
              )
            : Text(
                title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700, color: Colors.white),
              ),
      ),
    );
  }
}
