import 'dart:io';

import 'package:agora_uikit/models/rtm_message.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/auth_textfield.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../enum/gender_enum.dart';
import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../routes/routes.gr.dart';
import '../../utils/message.dart';
import '../../widgets/custom_elivated_button.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final ImagePicker _picker = ImagePicker();
// List<img.Image?> fileImage = [];
  List<XFile?> xFileList = [];
// Pick an image

  pickImage({required bool fromGallery}) async {
    try{
      final XFile? image = await _picker.pickImage(
          source: fromGallery ? ImageSource.gallery : ImageSource.camera);
      if (image != null) {
        // saveImage(image);
        xFileList.clear();
        xFileList.add(image);
        setState(() {});
      } else {
        xFileList.clear();
        setState(() {});
        Messages.flushBarMessage(
            context, fromGallery ? "Select an Image" : "Take a Photo");
      }
    }catch (e){
      debugPrint(e.toString());
      Messages.flushBarMessage(context, e.toString());
    }


    // Capture a photo
    // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    // if(photo != null){
    // // saveImage(photo);
    // xFileList.clear();
    // xFileList.add(photo);
    // setState(() {
    //
    // });
    // }else{
    // Message.flushBarMessage(context, "Something Went wrong Try Again");
    // }
  }
  TextEditingController dateOfBirthController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    dateOfBirthController.dispose();
  }

// saveImage(XFile xFile) async {
// final path = xFile.path;
// final bytes = await File(path).readAsBytes();
// final img.Image? image = img.decodeImage(bytes);
// fileImage.clear();
// fileImage.add(image);
// setState(() {});
// }

  Gender _gender = Gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsets.all(kPadding.r),
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Image.asset(Assets.logoGreen, height: 74.h, width: 126.w,),
            Text(
              "Create Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor),
            ),
            SizedBox(
              height: kPadding.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(

                onTap: () async {
                  final res = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(kPadding.r),),
                      actionsPadding: EdgeInsets.only(left: kPadding.w, right: kPadding.w, top: kPadding.h, bottom: kPadding * 2.h),
                      alignment: Alignment.center,
                      title: Text(
                        "Chose Option",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryColor),
                      ),
                      actions: [
                        ElevatedButton(
                            child: const Text("From Gallery"),
                            onPressed: () {
                              // pickImage(fromGallery: true);
                              context.router.pop(true);
                            }),
                        SizedBox(
                          width: kPadding.w,
                        ),
                        ElevatedButton(
                            child: const Text("Take Photo"),
                            onPressed: () {
                              // pickImage(fromGallery: false);
                              context.router.pop(false);
                            }),
                        // CustomElevatedButton(
                        //     notExpandedWidth: 100,
                        //     isExpanded: false,
                        //     title: "Take Photo",
                        //     onPressed: () {
                        //       context.router.pop(false);
                        //     }),
                      ],
                    ),
                  );
                  debugPrint(res.toString());
                  if (res != null) {
                    await pickImage(fromGallery: res);
                  } else {
                    Messages.flushBarMessage(
                        context, "Select an option to continue");
                  }
                },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 35.h,
                      backgroundImage: xFileList.isEmpty
                          ?  const AssetImage(Assets.avatar)
                          : null,
                      child: xFileList.isNotEmpty
                          ? Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: FileImage(

                                File(xFileList[0]!.path),
                              ),
                              fit: BoxFit.fill),
                        ),
                      )
                          : const SizedBox.shrink(),
                    ),
                    Positioned(
                      right: 4,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 18.h,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: kPadding.h,
            ),
            Text(
              xFileList.isEmpty ? "Upload your profile picture" : "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor),
            ),
            SizedBox(height: 10.h,),
            CustomTextField(
              prefix: Icon(Icons.person, color: AppColors.primaryColor,),
              hintText: "Name",
            ),
            SizedBox(height: 10.h,),
            CustomTextField(
              // enable: false,
              textEditingController: dateOfBirthController,
              prefix: Icon(Icons.date_range, color: AppColors.primaryColor,),
              hintText: "Date of Birth",
              onTap: ()async{
                final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(3033));
                dateOfBirthController.text = "${date?.day}-${date?.month}-${date?.year}";
                },
            ),
            SizedBox(height: 10.h,),
            CustomTextField(
              prefix: Icon(Icons.bloodtype, color: AppColors.primaryColor,),
              hintText: "Blood Group",
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<Gender>(
                    activeColor: AppColors.primaryColor,
                    title: Text(
                      'Male',
                      style: genderTextStyle(context),
                    ),
                    value: Gender.male,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<Gender>(
                    activeColor: AppColors.primaryColor,
                    title: Text(
                      'Female',
                      style: genderTextStyle(context),
                    ),
                    value: Gender.female,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<Gender>(
                    activeColor: AppColors.primaryColor,
                    title: Text(
                      'Others',
                      style: genderTextStyle(context),
                    ),
                    value: Gender.others,
                    groupValue: _gender,
                    onChanged: (Gender? value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            CustomTextField(
              prefix: Icon(Icons.lock, color: AppColors.primaryColor,),
              hintText: "Password",
            ),
            SizedBox(
              height: 10.h,
            ),CustomTextField(
              prefix: Icon(Icons.bloodtype, color: AppColors.primaryColor,),
              hintText: "Confirm Password",
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomElevatedButton(
              isExpanded: false,
              title: "Save",
              onPressed: () {
                debugPrint(_gender.name);
                if (xFileList.isNotEmpty) {
                  // congratsDialogue(context, onTap: (){
                    context.router.replace(const DashboardRoute());
                  // });

                } else {
                  Messages.flushBarMessage(
                      context, "Please Upload your image");
                }
              },
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

TextStyle genderTextStyle(BuildContext context) {
  debugPrint(MediaQuery.of(context).size.width.toString());
  return TextStyle(
    fontSize: MediaQuery.of(context).size.width >= 450 ? 12.sp : 10.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF606060),
  );
}
