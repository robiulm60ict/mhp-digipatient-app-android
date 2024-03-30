import 'package:country_code_picker/country_code_picker.dart';
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
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../resources/styles.dart';
import 'forget_pincode_verification_view.dart';

class OtpSendView extends StatefulWidget {
  const OtpSendView({Key? key}) : super(key: key);

  @override
  State<OtpSendView> createState() => _OtpSendViewState();
}

class _OtpSendViewState extends State<OtpSendView> {
  TextEditingController phnNumber = TextEditingController();
  var number = '';

  @override
  void dispose() {
    super.dispose();
    phnNumber.dispose();
  }
  FocusNode focusNode = FocusNode();

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

            // Card(
            //   margin: EdgeInsets.all(defaultPadding.r),
            //   // color: Colors.transparent,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.r),
            //       side: BorderSide(
            //         color: AppColors.primaryColor,
            //       )),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: SizedBox(
            //       height: 55,
            //       child: Row(
            //         children: [
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //
            //               Text(
            //                 "  +88  ",
            //                 style:
            //                 TextStyle(fontSize: 16.sp, color: AppColors.blackColor,),
            //               ),
            //               Style.distan_size2,
            //               Style.distan_size2,
            //               Style.distan_size2,
            //             ],
            //           ),
            //           Expanded(
            //             child: TextField(
            //               controller: phnNumber,
            //               maxLength: 11,
            //
            //
            //               keyboardType: TextInputType.number,
            //               enabled: true,
            //               decoration: InputDecoration(
            //                 border: InputBorder.none,
            //
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Card(
            //   margin: EdgeInsets.all(defaultPadding.r),
            //
            //   // color: Colors.transparent,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.r),
            //       side: BorderSide(
            //         color: AppColors.primaryColor,
            //       )),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: SizedBox(
            //       height: 55.h,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               SizedBox(
            //                 width: 100.w,
            //                 height: 40.h,
            //                 child: CountryCodePicker(
            //                   onChanged: (element)  {
            //                     debugPrint(element.toLongString());
            //                     debugPrint(element.name);
            //                     debugPrint(element.code);
            //                     debugPrint("element.code${element.code}");
            //                     debugPrint("element.dialCode${element.dialCode}");
            //                     debugPrint(element.flagUri);
            //                   },
            //                   initialSelection: 'BD',
            //                   showCountryOnly: true,
            //                   showOnlyCountryWhenClosed: false,
            //                   hideSearch: false,
            //                   hideMainText: false,
            //                   favorite: const ['+880', 'BD'],
            //                 ),
            //               ),
            //               // Text(
            //               //   "  +88  ",
            //               //   style:
            //               //   TextStyle(fontSize: 16.sp, color: AppColors.blackColor,),
            //               // ),
            //               // Style.distan_size10,
            //               // Style.distan_size2,
            //               // Style.distan_size2,
            //             ],
            //           ),
            //           Expanded(
            //             flex: 8,
            //             child: Center(
            //               child: Padding(
            //                 padding: const EdgeInsets.only(top: 12),
            //                 child: TextField(
            //                   controller: phnNumber,
            //                   keyboardType: TextInputType.number,
            //                   // enabled: true,
            //                   // maxLength: 11,
            //                   maxLength: 11, // Set maximum character limit
            //                   maxLengthEnforcement: MaxLengthEnforcement.enforced,
            //                   textAlign: TextAlign.start,
            //                   inputFormatters: [
            //                     FilteringTextInputFormatter.allow(
            //                       RegExp(
            //                           r'^\d+\.?\d{0,2}'), // Allows only digits with up to two decimal places
            //                     ),
            //                   ],
            //
            //                   decoration: InputDecoration(
            //                     border: InputBorder.none,
            //
            //                   ),
            //                   // decoration: InputDecoration(
            //                   //   border: InputBorder.none,
            //                   //
            //                   // ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: IntlPhoneField(
                focusNode: focusNode,
                controller: phnNumber,
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
                  phnNumber!.text;
                  print(phone.completeNumber);
                  number = phone.completeNumber;
                  print(number);
                },
                onCountryChanged: (country) {
                  print('Country changed to: ${country.name}');
                },
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

                        // else if (phnNumber.text.length !=11) {
                        //   Messages.snackBar(context, "Mobile Number must be 11 digit");
                        // }
                        else {
                          auth.sendOtpForget(context, phnNumber: number);

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
