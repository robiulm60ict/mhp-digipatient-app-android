import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/routes/routes.gr.dart';
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
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authVm = Provider.of<AuthViewModel>(context);

    return Scaffold(
      body: ListView(

        children: [
          const GradientAppBar(text: 'User Login',),
          SizedBox(height: 100.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: Text("Email", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
          ),
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding.w),
            child: CustomTextField(
              textEditingController: emailController,
              keyboardType: TextInputType.emailAddress,
              prefix: Icon(Icons.person_pin, color: AppColors.primaryColor,), hintText: "Email",),
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
              obscureText: !obSecureText,
              prefix:  Icon(Icons.lock, color: AppColors.primaryColor,), hintText: "Password",
                suffix: IconButton(onPressed: (){
              setState(() {
                obSecureText = !obSecureText;
              });
            }, icon: Icon(obSecureText ? Icons.visibility : Icons.visibility_off, color: obSecureText? AppColors.primaryColor : Colors.grey,)),),),

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
            child: authVm.loginLoading ? const Center(child: CircularProgressIndicator(),) : CustomButton(text: "Sign in", onTap: (){
              if(emailController.text.isNotEmpty || passwordController.text.isNotEmpty){
                Map<String, String> body = {
                  'email' : emailController.text,
                  'password' : passwordController.text
                };
                authVm.loginApi(context, body, keepMeSignIn: keepMeSignedIn);
              }else{
                Messages.snackBar(context, "Fill Up All of the field!", backgroundColor: Colors.red);
              }

              // context.router.replace(const DashboardRoute());
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
                TextSpan(text: "  Register Here", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor), recognizer: TapGestureRecognizer()..onTap = ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpView())))
              ]
            ),),
          ),
          SizedBox(height: 100.h,),
        ],
      ),
    );
  }
}
