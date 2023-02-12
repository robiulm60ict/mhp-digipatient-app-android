import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../view_model/anatomy/anatomy_model.dart';
import '/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Messages {
  static toastMessage({
    required String msg,
    Color backgroundColor = Colors.red,
    double fontSize = 16,
    ToastGravity gravity = ToastGravity.CENTER,
  }) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: backgroundColor,
        fontSize: fontSize,
        gravity: gravity);
  }

  static flushBarMessage(BuildContext context, String msg,
      {backgroundColor = Colors.red,
      durationSecond = 2,
      flushBarPosition = FlushbarPosition.TOP}) async {
    await Flushbar(
      message: msg,
      duration: Duration(seconds: durationSecond),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      padding: EdgeInsets.all(15.r),
      flushbarPosition: flushBarPosition,
      backgroundColor: backgroundColor,

    ).show(context);
  }

  static flushBarWithOption(BuildContext context,
      {
        required Widget child,
        Key? key,
        VoidCallback? onTap,
        durationSecond = 6,
        buttonTitle = "Leave",
        flushBarPosition = FlushbarPosition.BOTTOM,
        backgroundColor = Colors.white}) async {
    await Flushbar(
      key: key,
      showProgressIndicator: true,
      // progressIndicatorValueColor: AlwaysStoppedAnimation(Colors.redAccent),
      // mainButton: ElevatedButton(onPressed: onTap, child: Text(buttonTitle, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),),),
      // duration: Duration(seconds: durationSecond),
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeInOut,
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      padding: EdgeInsets.all(15.r),
      flushbarPosition: flushBarPosition,
      backgroundColor: backgroundColor,
      title: "Select Options",
      titleColor: Colors.black,
      messageColor: Colors.black,
      messageText: child,
      // messageText: Stack(
      //   alignment: Alignment.topRight,
      //   children: [
      //     child,
      //     Positioned(
      //         // top: -20,
      //         child: IconButton(onPressed: (){}, icon: Icon(Icons.clear, color: Colors.red,))),
      //   ],
      // ),
      onStatusChanged: (status) {
        debugPrint("Status Change : == ${status?.index}");
        if(status?.index != null){
          context.read<AnatomyModelView>().setFlushBarState(status!.index);
        }

      },
    ).show(context);
  }

  static snackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
