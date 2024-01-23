import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view/authentications/sign_up_view.dart';
import 'package:digi_patient/view_model/auth_view_model.dart';
import 'package:digi_patient/widgets/custom_button.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/colors.dart';
import '../../utils/user.dart';
import '../../view_model/push_notification/notification_service.dart';
import '../../widgets/gradient_appBar.dart';
import '../forget_password/forget_pincode_verification_view.dart';
import '../forget_password/otpsend_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool keepMeSignedIn = true;
  bool obSecureText = false;

  TextEditingController? passwordController;
  TextEditingController? emailController;

  NotificationService notificationService = NotificationService();

  String token = "";

  @override
  void initState() {
    notificationService.requestPermission();
    notificationService.getToken();
    notificationService.getDeviceToken();
    notificationService.isTokenrefresh();

    notificationService.firbaseInit(context);
    //notificationService.getToken();
    notificationService.messaging.getToken().then((value) {
      token = value!;
    });
    Future.delayed(const Duration(seconds: 0)).then((v) {
      getUserData();
      setState(() {});
    });

    print("ff${token}");
    // TODO: implement initState
    super.initState();
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? phone = prefs.getString(UserP.email);
    print(phone);
    String? password = prefs.getString(UserP.password);
    emailController = TextEditingController(text: phone);
    passwordController = TextEditingController(text: password);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    passwordController!.dispose();
    emailController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      body: ListView(
        children: [
          const GradientAppBar(
            text: 'User Login',
          ),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Text(
              "Mobile",
              style: TextStyle(
                  fontSize: 16.sp,
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
              maxLength: 11,
              textEditingController: emailController,
              keyboardType: TextInputType.number,
              prefix: Icon(
                Icons.person_pin,
                color: AppColors.primaryColor,
              ),
              hintText: "Mobile",
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Text(
              "Password",
              style: TextStyle(
                  fontSize: 16.sp,
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
              textEditingController: passwordController,
              obscureText: !obSecureText,
              prefix: Icon(
                Icons.lock,
                color: AppColors.primaryColor,
              ),
              hintText: "Password",
              suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      obSecureText = !obSecureText;
                    });
                  },
                  icon: Icon(
                    obSecureText ? Icons.visibility : Icons.visibility_off,
                    color: obSecureText ? AppColors.primaryColor : Colors.grey,
                  )),
            ),
          ),

          // ),
          // SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => OtpSendView()));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 12.sp, color: AppColors.primaryColor),
                  )),
            ),
          ),
          // SizedBox(height: 10.h,),
          CheckboxListTile(
            value: keepMeSignedIn,
            onChanged: (val) {
              setState(() {
                keepMeSignedIn = val!;
              });
            },
            checkColor: Colors.white,
            activeColor: AppColors.primaryColor,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.only(left: 20.w),
            title: Text(
              "Keep me signed in",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: keepMeSignedIn ? AppColors.primaryColor : Colors.grey),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: authVm.isLoginLoading == true
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    text: "Login",
                    onTap: () {
                      if (emailController!.text.isNotEmpty ||
                          passwordController!.text.isNotEmpty) {
                        Map<String, String> body = {
                          'email': emailController!.text,
                          'password': passwordController!.text,
                          'deviceToke': token
                        };
                        authVm.loginApi(context, body,
                            keepMeSignIn: keepMeSignedIn);
                      } else {
                        Messages.snackBar(context, "Fill Up All of the field!",
                            backgroundColor: Colors.red);
                      }

                      // context.router.replace(const DashboardRoute());
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
                    text: "Don't have account yet?",
                    style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                TextSpan(
                    text: "  Register Here",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpView())))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
