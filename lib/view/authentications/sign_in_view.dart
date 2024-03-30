import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../resources/colors.dart';
import '../../utils/message.dart';
import '../../utils/user.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/push_notification/notification_service.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/gradient_appBar.dart';
import '../forget_password/otpsend_view.dart';
import 'sign_up_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool keepMeSignedIn = true;
  bool obSecureText = false;

  TextEditingController? passwordController = TextEditingController();
  TextEditingController? emailController = TextEditingController();

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
      // getUserData();
      setState(() {});
    });

    print("ff${token}");
    // TODO: implement initState
    super.initState();
  }

  GlobalKey<FormState> _formKey = GlobalKey();

  FocusNode focusNode = FocusNode();  var number = '';



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
            height: 30.h,
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
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: IntlPhoneField(
              focusNode: focusNode,
              controller: emailController,
              initialCountryCode: 'BD',
              keyboardType: TextInputType.phone,

              decoration: InputDecoration(
                labelText: 'Phone Number',
                focusColor: AppColors.primary_color,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primary_color, width: 1),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.primary_color, width: 1),
                ),
              ),
              languageCode: "bd",
              onChanged: (phone) {
                emailController!.text;
                print(phone.completeNumber);
                number = phone.completeNumber;
                print(number);
              },
              onCountryChanged: (country) {
                print('Country changed to: ${country.name}');
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
          //   child: CustomTextField(
          //     maxLength: 11,
          //     textEditingController: emailController,
          //     keyboardType: TextInputType.number,
          //     prefix: Icon(
          //       Icons.person_pin,
          //       color: AppColors.primaryColor,
          //     ),
          //     hintText: "Mobile",
          //   ),
          // ),
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
            contentPadding: EdgeInsets.only(left: 16.w),
            title: Text(
              "Keep me signed in",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: keepMeSignedIn ? AppColors.primaryColor : Colors.grey),
            ),
          ),
          SizedBox(
            height: 4.h,
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
                          'email': number,
                          'password': passwordController!.text,
                          'deviceToke': token,
                          "login_status": "1",
                        };
                        print(body);
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
            height: 8.h,
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
