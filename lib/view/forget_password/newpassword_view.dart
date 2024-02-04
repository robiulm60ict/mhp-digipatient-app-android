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

import '../../widgets/custom_textfield.dart';
import 'forget_pincode_verification_view.dart';

class NewPasswordSendView extends StatefulWidget {
   NewPasswordSendView({Key? key,required this.phoneNumber}) : super(key: key);
  String phoneNumber = "";

  @override
  State<NewPasswordSendView> createState() => _NewPasswordSendViewState();
}

class _NewPasswordSendViewState extends State<NewPasswordSendView> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    confirmPassword.dispose();
  }
  bool obSecureText = false;

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
                "New Password",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
              child: CustomTextField(
                textEditingController: password,
                obscureText: !obSecureText,
                prefix:  Icon(Icons.lock, color: AppColors.primaryColor,), hintText: "Password",
                suffix: IconButton(onPressed: (){
                  setState(() {
                    obSecureText = !obSecureText;
                  });
                }, icon: Icon(obSecureText ? Icons.visibility : Icons.visibility_off, color: obSecureText? AppColors.primaryColor : Colors.grey,)),),),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
              child: Text(
                "Confirm Password",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor),
              ),
            ),

            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
              child: CustomTextField(
                textEditingController: confirmPassword,
                obscureText: !obSecureText,
                prefix:  Icon(Icons.lock, color: AppColors.primaryColor,), hintText: "confirmPassword",
                suffix: IconButton(onPressed: (){
                  setState(() {
                    obSecureText = !obSecureText;
                  });
                }, icon: Icon(obSecureText ? Icons.visibility : Icons.visibility_off, color: obSecureText? AppColors.primaryColor : Colors.grey,)),),),

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

                        if (password.text.isEmpty) {
                          Messages.snackBar(context, "Enter New Password");

                        } else if (password.text.length <=7) {
                          Messages.snackBar(context, "Minimum password length of 8 digits");

                        }


                        else if (confirmPassword.text.isEmpty) {
                          Messages.snackBar(context, "Enter Confirm Password");

                        }else if (password.text != confirmPassword.text) {
                          // Passwords match
                          Messages.snackBar(context, "Passwords Do Not Match");
                        }


                        else {
                          Map<String,dynamic> body = {
                            "phone_number":widget.phoneNumber,
                            "password":password.text
                          };
                         auth.newpasswordForget(context,body );

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
