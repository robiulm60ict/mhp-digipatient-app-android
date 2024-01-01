import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view/authentications/sign_in_view.dart';
import 'package:digi_patient/view_model/auth_view_model.dart';
import 'package:digi_patient/widgets/custom_button.dart';
import 'package:digi_patient/widgets/gradient_appBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.gr.dart';
import 'forget_pincode_verification_view.dart';

class OtpSendView extends StatefulWidget {
  const OtpSendView({Key? key}) : super(key: key);

  @override
  State<OtpSendView> createState() => _OtpSendViewState();
}

class _OtpSendViewState extends State<OtpSendView> {
  TextEditingController phnNumber = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phnNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: Consumer<AuthViewModel>(builder: (context, auth, child) {
        return ListView(
          children: [
            const GradientAppBar(text: "Forgot Password"),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
              child: Text(
                "Enter Mobile Number",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            Card(
              margin: EdgeInsets.all(defaultPadding.r),
              // color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(
                    color: AppColors.primaryColor,
                  )),
              child: SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Text(
                      "  +88  ",
                      style:
                          TextStyle(fontSize: 16.sp, color: AppColors.blackColor),
                    ),
                    Expanded(
                      child: TextField(
                        controller: phnNumber,
                        maxLength: 11,


                        keyboardType: TextInputType.number,
                        enabled: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 30.h,
            ),
            auth.isSendOtpLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
                    child: CustomButton(
                      text: "Continue",
                      onTap: () {

                        if (phnNumber.text.isEmpty) {
                          Messages.snackBar(context, "Enter Mobile Number");

                        }

                        else if (phnNumber.text.length !=11) {
                          Messages.snackBar(context, "Mobile Number must be 11 digit");
                        }
                        else {
                          auth.sendOtpForget(context, phnNumber: phnNumber.text);

                        }
                      },
                    ),
                  ),

            SizedBox(
              height: 15.h,
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            //   child: RichText(
            //     textAlign: TextAlign.center,
            //     text: TextSpan(children: [
            //       TextSpan(
            //           text: "Did you have account?",
            //           style: TextStyle(fontSize: 14.sp, color: Colors.black)),
            //       // TextSpan(
            //       //     text: "  Login",
            //       //     style: TextStyle(
            //       //         fontSize: 14.sp,
            //       //         fontWeight: FontWeight.bold,
            //       //         color: AppColors.primaryColor),
            //       //     recognizer: TapGestureRecognizer()
            //       //       ..onTap = () => Navigator.push(
            //       //           context,
            //       //           MaterialPageRoute(
            //       //               builder: (context) => SignInView())))
            //     ]),
            //   ),
            // ),
          ],
        );
      }),
    );
  }
}
