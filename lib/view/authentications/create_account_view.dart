import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/auth_model/birth_sex_model.dart';
import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/utils/datetime.dart';
import 'package:digi_patient/view_model/auth_view_model.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../routes/routes.gr.dart';
import '../../utils/message.dart';
import '../../widgets/custom_elivated_button.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key, required this.phoneNumber, required this.token, required this.vCode}) : super(key: key);
  final String phoneNumber;
  final String token;
  final String vCode;
  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final ImagePicker _picker = ImagePicker();

// List<img.Image?> fileImage = [];
  List<XFile?> xFileList = [];

// Pick an image

  pickImage({required bool fromGallery}) async {
    try {
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
    } catch (e) {

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
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  BloodGroup? bloodGroup;

  BirthSex? birthSex;
  bool obSecureText = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      context.read<AuthViewModel>().getBirthSex(context);
      context.read<AuthViewModel>().getBloodGroup(context);
      // setBirthSexAndBloodGroup();
    });
  }

  setBirthSexAndBloodGroup() {
    if (!context
        .read<AuthViewModel>()
        .isBloodGroupLoading && !context
        .read<AuthViewModel>()
        .isBirthSexLoading) {
      bloodGroup = context
          .read<AuthViewModel>()
          .bloodGroupList
          .first
          .bloodGroup!
          .first;
      birthSex = context
          .read<AuthViewModel>()
          .birthSexList
          .first
          .birthSex!
          .first;
      setState(() {

      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    dateOfBirthController.dispose();
    password.dispose();
    email.dispose();
    name.dispose();
  }

// saveImage(XFile xFile) async {
// final path = xFile.path;
// final bytes = await File(path).readAsBytes();
// final img.Image? image = img.decodeImage(bytes);
// fileImage.clear();
// fileImage.add(image);
// setState(() {});
// }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);

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
            Image.asset(Assets.imagesLogoGreen, height: 74.h, width: 126.w,),
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
                      actionsAlignment: MainAxisAlignment.center,

                      content:
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       // mainAxisAlignment: MainAxisAlignment.center
                       mainAxisSize: MainAxisSize.min,
                       children:  [
                         SizedBox(
                           height: kPadding.h,
                         ),
                         ElevatedButton(
                             child: const Text("From Gallery"),
                             onPressed: () {
                               // pickImage(fromGallery: true);
                               context.router.pop(true);
                             }),
                         SizedBox(
                           height: 10.h,
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
                     )
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
                          ?  const AssetImage(Assets.imagesAvatar)
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
              textEditingController: name,
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
                // final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(3033));
                DateTime? date = await PickDateTime().pickDate(context, initialDate: DateTime.now());
                dateOfBirthController.text = "${date?.day}-${date?.month}-${date?.year}";
                },
            ),
            SizedBox(height: 10.h,),
            // CustomTextField(
            //   prefix: Icon(Icons.bloodtype, color: AppColors.primaryColor,),
            //   hintText: "Blood Group",
            // ),
            ///
            // auth.isBloodGroupLoading ? const Center(child: CircularProgressIndicator(),) : SizedBox(
            //   height: 50.h,
            //   width: double.infinity,
            //   child: DropdownButton<BloodGroup>(
            //     items: auth.bloodGroupListItems,
            //     isExpanded: true,
            //     value: bloodGroup,
            //     onChanged: (value) {
            //       if(value != null){
            //         setState(() {
            //           bloodGroupId = "${value.id}";
            //           bloodGroup = value;
            //         });
            //       }
            //
            //     },),
            // ),
            auth.isBloodGroupLoading ? const Center(child: CircularProgressIndicator(),) :

            SizedBox(
              height: 55.h,
              width: double.infinity,
              child: DropdownButton<BloodGroup>(
                hint: Text("Select Blood Group", style: TextStyle(fontSize: 14.sp,),),
                    items: auth.bloodGroupList.first.bloodGroup?.map((e) => DropdownMenuItem<BloodGroup>(value: e,child: Text("${e.bloodGroupName}", style: TextStyle(fontSize: 14.sp, ),),)).toList(),
                    isExpanded: true,
                    value: bloodGroup,
                    onChanged: (value) {
                      if(value != null){
                        setState(() {
                          // bloodGroupId = "${value.id}";
                          bloodGroup = value;
                        });
                      }

                    },),
            ),

            SizedBox(
              height: 10.h,
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       child: RadioListTile<Gender>(
            //         activeColor: AppColors.primaryColor,
            //         title: Text(
            //           'Male',
            //           style: genderTextStyle(context),
            //         ),
            //         value: Gender.male,
            //         groupValue: _gender,
            //         onChanged: (Gender? value) {
            //           setState(() {
            //             _gender = value!;
            //           });
            //         },
            //       ),
            //     ),
            //     Expanded(
            //       child: RadioListTile<Gender>(
            //         activeColor: AppColors.primaryColor,
            //         title: Text(
            //           'Female',
            //           style: genderTextStyle(context),
            //         ),
            //         value: Gender.female,
            //         groupValue: _gender,
            //         onChanged: (Gender? value) {
            //           setState(() {
            //             _gender = value!;
            //           });
            //         },
            //       ),
            //     ),
            //     Expanded(
            //       child: RadioListTile<Gender>(
            //         activeColor: AppColors.primaryColor,
            //         title: Text(
            //           'Others',
            //           style: genderTextStyle(context),
            //         ),
            //         value: Gender.others,
            //         groupValue: _gender,
            //         onChanged: (Gender? value) {
            //           setState(() {
            //             _gender = value!;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // ),
            auth.isBirthSexLoading ? const Center(child: CircularProgressIndicator(),) :

            SizedBox(
              height: 55.h,
              width: double.infinity,
              child: DropdownButton<BirthSex>(
                hint: Text("Select Gender", style: TextStyle(fontSize: 14.sp,),),

                items: auth.birthSexList.first.birthSex?.map((e) => DropdownMenuItem<BirthSex>(value: e,child: Text("${e.birthSexName}", style: TextStyle(fontSize: 14.sp,),),)).toList(),
                isExpanded: true,
                value: birthSex,
                onChanged: (value) {
                  if(value != null){
                    setState(() {
                      // bloodGroupId = "${value.id}";
                      birthSex = value;
                    });
                  }

                },),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
              textEditingController: password,
              obscureText: !obSecureText,
              prefix:  Icon(Icons.lock, color: AppColors.primaryColor,), hintText: "Password",
              suffix: IconButton(onPressed: (){
                setState(() {
                  obSecureText = !obSecureText;
                });
              }, icon: Icon(obSecureText ? Icons.visibility : Icons.visibility_off, color: obSecureText? AppColors.primaryColor : Colors.grey,)),),

            // CustomTextField(
            //   textEditingController: password,
            //   prefix: Icon(Icons.lock, color: AppColors.primaryColor,),
            //   hintText: "Password",
            // ),
            SizedBox(
              height: 10.h,
            ),CustomTextField(
              textEditingController: email,
              prefix: Icon(Icons.email, color: AppColors.primaryColor,),
              hintText: "Email",
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            auth.isRegistrationLoading ? const Center(child: CircularProgressIndicator(),) : CustomElevatedButton(
              isExpanded: false,
              title: "Save",
              onPressed: () async{
                // debugPrint("------------------------------------------------\n\n\n\n\n\n");
                // debugPrint("Phone Number" + widget.phoneNumber);
                // debugPrint("Token" + widget.token);
                // debugPrint("verification code" + widget.vCode);
                if(password.text.length < 7){
                  Messages.snackBar(context, "Enter At least 8 Digit Password");
                }else{
                  if(xFileList.isNotEmpty && name.text.isNotEmpty && dateOfBirthController.text.isNotEmpty && bloodGroup != null && birthSex != null && password.text.isNotEmpty && email.text.isNotEmpty){
                    Map<String , String> body = {
                      'phone_number' : widget.phoneNumber,
                      'token' : widget.token,
                      'verification_code' : widget.vCode,
                      'patient_first_name' : name.text,
                      'patient_birth_sex_id' : "${birthSex?.id}",
                      'ptn_blood_group_id' : "${bloodGroup?.id}",
                      'patient_dob' : dateOfBirthController.text,
                      'image' : File(xFileList.first!.path).toString(),
                      'password' : password.text,
                      'patient_email' : email.text,
                    };
                    await auth.signUp(context, body, File(xFileList.first!.path).path);
                    // await auth.registration(context, imageFile: File(xFileList.first!.path), phoneNumber: widget.phoneNumber, token: widget.token, verificationCode: widget.vCode, name: name.text, genderId: "${birthSex?.id}", bloodGroupId: "${bloodGroup?.id}", dateOfBirth: dateOfBirthController.text, password: password.text, email: email.text);
                    // auth.signUpOriginal(context, body, widget.token);
                    ///
                    // final imageBytes = File(xFileList.first!.name).length() as List<int>;
                    // auth.signUp(context, body, File(xFileList.first!.name).toString());
                    ///
                    // final res = SendImage();
                    // await res.addImage(body, File(xFileList.first!.name).path).onError((error, stackTrace) {
                    //   debugPrint(error.toString());
                    //   return false;
                    // });
                    ///
                    // await auth.registration(context, imageFile: File(xFileList.first!.path),
                    //     phoneNumber: widget.phoneNumber, token: widget.token, verificationCode: widget.vCode,
                    //     name: name.text, genderId: "${birthSex?.id}", bloodGroupId: "${bloodGroup?.id}",
                    //     dateOfBirth: dateOfBirthController.text, password: password.text, email: email.text);
                    // await UserRegistration().sendImageAndData(imageFile: File(xFileList.first!.path),
                    //     phoneNumber: widget.phoneNumber, token: widget.token, verificationCode: widget.vCode,
                    //     name: name.text, genderId: "${birthSex?.id}", bloodGroupId: "${bloodGroup?.id}",
                    //     dateOfBirth: dateOfBirthController.text, password: password.text, email: email.text);
                    // auth.signUpApi(context, body);
                    // auth.signUpAndSendImage(context, body: body, filePath: xFileList.first!.path);

                  }else {
                    Messages.flushBarMessage(
                        context, "Enter all of the field and upload image also");
                  }
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
    fontSize: MediaQuery.of(context).size.width >= 450 ? 12.sp : 9.sp,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF606060),
  );
}
