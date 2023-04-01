import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/custom_button.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors.dart';
import '../../widgets/gradient_appBar.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool keepMeSignedIn = true;
  bool obSecureText = false;
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(

        children: [
          const GradientAppBar(text: 'User Login',),
          SizedBox(height: 100.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Text("Email or Mobile", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: CustomTextField(
              // keyboardType: TextInputType.number,
              prefix: Icon(Icons.person_pin, color: AppColors.primaryColor,), hintText: "Email or Mobile",),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Text("Password", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: CustomTextField(
              textEditingController: passwordController,
              prefix:  Icon(Icons.lock, color: AppColors.primaryColor,), hintText: "Password", ),),
                // suffix: IconButton(onPressed: (){
            //   setState(() {
            //     obSecureText = !obSecureText;
            //   });
            // }, icon: Icon(obSecureText ? Icons.visibility : Icons.visibility_off, color: obSecureText! ? AppColors.primaryColor : Colors.grey,)),),

            // ),
          // SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(

                  onPressed: (){}, child: Text("Forget Passwords?", style: TextStyle(fontSize: 12.sp, color: AppColors.primaryColor),)),
            ),
          ),
          // SizedBox(height: 10.h,),
          CheckboxListTile(
            value: keepMeSignedIn,
            onChanged: (val){
              setState(() {
                keepMeSignedIn = val!;
              });
            },
            checkColor: Colors.white,
            activeColor: AppColors.primaryColor,
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.only(left: 20.w),
            title: Text("Keep me signed in", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: keepMeSignedIn ? AppColors.primaryColor : Colors.grey),),),
          SizedBox(height: 24.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: CustomButton(text: "Sign in", onTap: (){
              context.router.replace(const DashboardRoute());
            },),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
              children: [
                TextSpan(text: "Don't have account yet?", style: TextStyle(fontSize: 14.sp, color: Colors.black)),
                TextSpan(text: "  Register Here", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor), recognizer: TapGestureRecognizer()..onTap = ()=> context.router.push(const SignUpRoute()))
              ]
            ),),
          ),
          SizedBox(height: 100.h,),
        ],
      ),
    );
  }
}
