import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/utils/utils.dart';
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
    bool isTablet = MediaQuery.of(context).size.width > 450;
    debugPrint(MediaQuery.of(context).size.width.toString());
    final auth = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: ListView(
        children: [
          const GradientAppBar(text: "Sign Up"),
          SizedBox(height: 60.h,),
          Padding(padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
          child: Text("Enter Mobile Number", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
          ),
          SizedBox(height: 10.h,),

          Card(
            margin: EdgeInsets.all(defaultPadding.r),
            // color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(color: AppColors.primaryColor,

              )
            ),
            child: Row(
              children: [
                Text("  +880  ", style: TextStyle(fontSize: 16.sp, color: AppColors.blackColor),),
                 Expanded(child: TextField(
                  controller: phnNumber,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  // decoration: InputDecoration(
                  //   border: InputBorder.none,
                  //
                  // ),
                ),),
              ],
            ),
          ),

          SizedBox(height: 30.h,),
          Visibility(
            visible: !auth.isSendOtpLoading,
            replacement: const Center(child: CircularProgressIndicator()),
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: CustomButton(text: "Continue", onTap: (){
              if(phnNumber.text.isNotEmpty){
                auth.sendOtp(context, phnNumber: phnNumber.text);
              }else{
                Messages.snackBar(context, "Enter Mobile Number");
              }
            },),
          ),),

          SizedBox(height: 15.h,),
          Text("Or", textAlign: TextAlign.center, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.grey),),
          SizedBox(height: 15.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r)
            ),
            height: 50.h,
            child: InkWell(
              onTap: (){
                debugPrint("google ");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.iconsGoogle, height: 20.h,),
                  SizedBox(width: 5.w,),
                  Text("Continue with Google", style: TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r)
            ),
            height: 50.h,
            child: InkWell(
              onTap: (){},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.iconsFacebook, height: 13.h,),
                  SizedBox(width: 5.w,),
                  Text("Continue with Facebook", style: TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  children: [
                    TextSpan(text: "Did you have account?", style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                    TextSpan(text: "  Login", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor), recognizer: TapGestureRecognizer()..onTap = ()=> context.router.push(const SignInRoute()))
                  ]
              ),),
          ),
        ],
      ),
    );
  }
}
