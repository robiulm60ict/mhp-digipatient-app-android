import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/user_detail_model/user_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../enum/gender_enum.dart';
import '../../resources/app_url.dart';
import '../../resources/constants.dart';
import '../../utils/message.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_elivated_button.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key, required this.user}) : super(key: key);
  final Patient user;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();

  List<XFile?> xFileList = [];


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
  Gender _gender = Gender.male;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: "${widget.user.patientFirstName} ${widget.user.patientMiddleName} ${widget.user.patientLastName}");
    emailController = TextEditingController(text: "${widget.user.patientEmail}");
    dateOfBirthController = TextEditingController(text: "${widget.user.patientDob}");
    setGender(widget.user.patientBirthSex?.birthSexName ?? "");
  }

  setGender(String gender){
    if( widget.user.patientBirthSex?.birthSexName.toString().toLowerCase() == "male"){
      setState(() {
        _gender = Gender.male;
      });
    }else if( widget.user.patientBirthSex?.birthSexName.toString().toLowerCase() == "female"){
      setState(() {
        _gender = Gender.female;
      });
    }else{
      _gender = Gender.others;
      setState(() {

      });
    }
  }


  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    nameFocusNode.dispose();

    emailController.dispose();
    dateOfBirthController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        centerTitle: true,
        title: Text("Profile", style: TextStyle(fontSize: 18.sp, color: Colors.white),),
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 60.h,
                alignment: Alignment.centerRight,
                color: AppColors.primaryColor,
                child: SizedBox(
                  width: 200.w,
                  child: TextField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.white
                    ),
                    cursorColor: Colors.blue,

                    decoration: InputDecoration(
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide: const BorderSide(color: Colors.white)
                      ),
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.r),
                      borderSide: const BorderSide(color: Colors.white)
                  ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.r),
                          borderSide: const BorderSide(color: Colors.white)
                      ),
                      suffixIcon: IconButton(onPressed: (){
                        nameFocusNode.requestFocus();
                      }, icon: Icon(Icons.edit, size: 13.h, color: Colors.white,))
                    ),
                  ),
                )
              ),
              SizedBox(height: 20.h,),
              Expanded(child: ListView(
                padding: EdgeInsets.all(20.r),
                children: [
                  SizedBox(height: 15.h,),
                  Text("Email ID", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                  SizedBox(height: 10.h,),
                  CustomTextField(
                    textEditingController: emailController,

                  ),
                  SizedBox(height: 15.h,),
                  Text("Date of Birth", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
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
                        // context.router.replace(const DashboardRoute());
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
              ))
            ],
          ),
          Positioned(
              top: 25,
              left: 50,
              child: InkWell(
                onTap: () async{
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
                          ],
                        )
                    ),
                  );
                  debugPrint(res.toString());
                  if (res != null) {
                    await pickImage(fromGallery: res);
                  } else {
                    // Messages.flushBarMessage(
                    //     context, "Select an option to continue");
                  }
                },
                child: Stack(
                  children: [
                    Column(
                      children: [
                        xFileList.isNotEmpty ? CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(
                            File(xFileList[0]!.path),
                          ),
                        ) : CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage("${AppUrls.image}images/files/${widget.user.patientImages}"),
                        ),
                        SizedBox(height: 13.h,),
                      ],
                    ),
                    Positioned(
                        top: 8,
                        right: 1,
                        bottom: -13,
                        child: CircleAvatar(backgroundColor: Colors.white,child: Icon(Icons.edit, size: 15.h,),),),
                  ],
                ),
              ),
          ),
        ],
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