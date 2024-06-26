import 'dart:async';

import 'package:digi_patient/view_model/auth_view_model.dart';
import 'package:digi_patient/widgets/gradient_appBar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../utils/message.dart';
import 'newpassword_view.dart';

class ForgetPinCodeVerificationView extends StatefulWidget {
  final String? phoneNumber;
  final String? token;

  const ForgetPinCodeVerificationView({
    Key? key,
   required this.phoneNumber,
   required this.token,
  }) : super(key: key);

  @override
  _ForgetPinCodeVerificationViewState createState() =>
      _ForgetPinCodeVerificationViewState();
}

class _ForgetPinCodeVerificationViewState extends State<ForgetPinCodeVerificationView> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    WidgetsBinding.instance.addPostFrameCallback((_){

      context.read<AuthViewModel>().setOtpCheckLoading(false);

    });
    super.initState();
  }
  bool acceptTheTerms = true;

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context,listen: false);
    return Scaffold(
      body: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
               const GradientAppBar(text: "Forget Verification"),

              SizedBox(height: 50.h),

              Padding(
                padding:
                 EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 8.h),
                child: RichText(
                  text: TextSpan(
                      text: "Enter the code sent to ",
                      children: [
                        TextSpan(
                            text: "${widget.phoneNumber}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp)),
                      ],
                      style:
                      TextStyle(color: Colors.black54, fontSize: 15.sp)),
                  textAlign: TextAlign.center,
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 30),
                    child: PinCodeTextField(
                      appContext: context,

                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',

                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      // validator: (v) {
                      //   if (v!.length < 3) {
                      //     return "I'm from validator";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,

                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 55,
                        fieldWidth: 55,
                        activeFillColor: Colors.white,
                        inactiveFillColor: AppColors.backgroundColor,

                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          currentText = value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                child: Text(
                  hasError ? "*Please fill up all the cells properly" : "",
                  style:  TextStyle(
                      color: Colors.red,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
               SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    "Didn't receive the code? ",
                    style: TextStyle(color: Colors.black54, fontSize: 15.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      auth.sendOtpForget(context, phnNumber: widget.phoneNumber.toString());


                    },
                    child:  Text(
                      "RESEND",
                      style: TextStyle(
                          color: const Color(0xFF91D3B3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                  )
                ],
              ),
               SizedBox(
                height: 14.h,
              ),
              CheckboxListTile(
                activeColor: AppColors.primaryColor,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: acceptTheTerms, onChanged: (val){
                acceptTheTerms = val!;
                setState(() {

                });
              },
              title: RichText(text: TextSpan(text: "I accept the ", style: TextStyle(fontSize: 13.sp, color: Colors.grey), children: [
                TextSpan(
                    text: "Terms & conditions",
                    style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                recognizer: TapGestureRecognizer()..onTap = ()=>{}
                ),
              ],),),
              ),
              auth.isOtpCheckLoading ? const Center(child: CircularProgressIndicator(),) : Container(
                margin:
                 EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 30.w),
                decoration: BoxDecoration(
                    color: acceptTheTerms==true? Colors.green:Colors.grey,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: const Offset(1, -2),
                          blurRadius: 5),
                      BoxShadow(
                          color: Colors.green.shade200,
                          offset: const Offset(-1, 2),
                          blurRadius: 5)
                    ],),
                child: ButtonTheme(
                  height: 50.h,
                  child: TextButton(
                    onPressed: () async{

                      if(acceptTheTerms==true){
                        Map<String,dynamic> body = {
                          "phone_number" : widget.phoneNumber,
                          "token" : widget.token,
                          "verification_code" : currentText
                        };

                        snackBar(" Enter The house ");
                        formKey.currentState!.validate();
                        // conditions for validating
                        if (currentText.length != 4) {
                          // snackBar(" Wrong Place ");
                          errorController!.add(ErrorAnimationType
                              .shake); // Triggering error shake animation
                          setState(() => hasError = true);
                        } else {
                          setState(
                                () {
                              hasError = false;
                              auth.otpCheckForget(context, body).then((value) {
                                if(auth.otpCheckError){
                                  errorController!.add(ErrorAnimationType
                                      .shake);
                                  setState(() {
                                    hasError = true;
                                  });
                                }
                              });

                            },
                          );
                        }


                      }else{
                        Messages.snackBar(context, "Selected Terms & conditions");
                      }


                    },
                    child: Center(
                        child: Text(
                          "VERIFY",
                          style:  TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),),
                  ),
                ),
              ),
              //  SizedBox(
              //   height: 16.h,
              // ),
              TextButton(
                child: Text("Clear", style: TextStyle(fontSize: 14.sp, ),),
                onPressed: () {
                  textEditingController.clear();
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Flexible(
              //         child: TextButton(
              //           child: Text("Clear", style: TextStyle(fontSize: 10.sp, ),),
              //           onPressed: () {
              //             textEditingController.clear();
              //           },
              //         ),),
              //     Flexible(
              //         child: TextButton(
              //           child: const Text("Set Text"),
              //           onPressed: () {
              //             setState(() {
              //               textEditingController.text = "123456";
              //             });
              //           },
              //         )),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}