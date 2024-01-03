import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
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

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
      body:  Consumer<AuthViewModel>(builder: (context, auth, child) {

          return  ListView(
            children: [
              const GradientAppBar(text: "Sign Up"),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text(
                              "  +88  ",
                              style:
                              TextStyle(fontSize: 16.sp, color: AppColors.blackColor,),
                            ),
                            Style.distan_size2,
                            Style.distan_size2,
                            Style.distan_size2,
                          ],
                        ),
                        Expanded(
                          flex: 8,
                          child: TextField(
                            controller: phnNumber,
                            keyboardType: TextInputType.number,
                            enabled: true,
                            maxLength: 11,


                            decoration: InputDecoration(
                              border: InputBorder.none,

                            ),
                            // decoration: InputDecoration(
                            //   border: InputBorder.none,
                            //
                            // ),
                          ),
                        ),
                      ],
                    ),
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
                      auth.sendOtp(context, phnNumber: phnNumber.text);

                    }
                  },
                ),
              ),


              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Did you have account?",
                        style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                    TextSpan(
                        text: "  Login",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInView())))
                  ]),
                ),
              ),
            ],
          );

      }),



    );
  }
}
