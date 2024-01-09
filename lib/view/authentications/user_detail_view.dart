import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../enum/gender_enum.dart';
import '../../model/auth_model/birth_sex_model.dart';
import '../../model/auth_model/blood_group_model.dart';
import '../../model/userprofile/userprofile_model.dart';
import '../../resources/app_url.dart';
import '../../resources/constants.dart';
import '../../utils/message.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_elivated_button.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({Key? key, required this.user}) : super(key: key);
  final PatientsDetails user;

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController fastnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  final ImagePicker _picker = ImagePicker();

  List<XFile?> xFileList = [];

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

  BloodGroups? bloodGroup;

  BirthSex? birthSex;

  String birth = '';

  selectBirthSexAndBloodGroup(
      {required String birthSexId, required String bloodGroupId}) {
    print("selectBirthSexAndBloodGroup $birthSexId");

    birthSex = context
        .read<AuthViewModel>()
        .birthSexListsingle
        .firstWhere((element) => element.birthSexName.toString() == birthSexId);

    print(
        "ssssssssssssssssssssssssssssssssssssssssss${birthSex!.birthSexName!.toString()}");
    bloodGroup = context
        .read<AuthViewModel>()
        .bloodGroupListsoingle
        ?.firstWhere(
            (element) => element.bloodGroupName.toString() == bloodGroupId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      context.read<AuthViewModel>().getBirthSex(context);
      context.read<AuthViewModel>().getBloodGroup(context);
    });
    addressController =
        TextEditingController(text: "${widget.user.patientAddress1}");
    fastnameController =
        TextEditingController(text: "${widget.user.patientFirstName}");
    lastnameController =
        TextEditingController(text: " ${widget.user.patientLastName}");
    emailController =
        TextEditingController(text: "${widget.user.patientEmail}");
    dateOfBirthController =
        TextEditingController(text: "${widget.user.patientDob}");

    Timer(const Duration(seconds: 3), () {
      selectBirthSexAndBloodGroup(
          birthSexId: "${widget.user.patientBirthSex?.birthSexName.toString()}",
          bloodGroupId: "${widget.user.bloodGroup?.bloodGroupName.toString()}");
    });
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
    final auth = Provider.of<AuthViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 18.sp, color: Colors.white),
        ),
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
                    child: Text(""),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                  child: ListView(
                padding: EdgeInsets.all(20.r),
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "First Name",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextField(
                    textEditingController: fastnameController,
                  ),
                  Text(
                    "Last Name",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextField(
                    textEditingController: lastnameController,
                  ),
                  Text(
                    "Email ID",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextField(
                    textEditingController: emailController,
                  ),
                  Text(
                    "Address ",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextField(
                    textEditingController: addressController,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Date of Birth",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextField(
                    // enable: false,
                    textEditingController: dateOfBirthController,
                    prefix: Icon(
                      Icons.date_range,
                      color: AppColors.primaryColor,
                    ),
                    hintText: "Date of Birth",
                    onTap: () async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(3033));
                      dateOfBirthController.text =
                          "${date?.day}-${date?.month}-${date?.year}";
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  auth.isBloodGroupLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 50.h,
                          width: double.infinity,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: DropdownButtonFormField<BloodGroups>(
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            hint: Text(
                              "Select Blood Group",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            items: auth.bloodGroupListsoingle!
                                .map((e) => DropdownMenuItem<BloodGroups>(
                                      value: e,
                                      child: Text(
                                        "${e.bloodGroupName}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            isExpanded: true,
                            value: bloodGroup,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  // bloodGroupId = "${value.id}";
                                  bloodGroup = value;
                                });
                              }
                            },
                          ),
                        ),

                  SizedBox(
                    height: 10.h,
                  ),
                  auth.isBirthSexLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          height: 50.h,
                          width: double.infinity,
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: DropdownButtonFormField<BirthSex>(
                            hint: Text(
                              "Select Gender",
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            decoration:
                                InputDecoration(border: InputBorder.none),
                            items: auth.birthSexListsingle
                                ?.map((e) => DropdownMenuItem<BirthSex>(
                                      value: e,
                                      child: Text(
                                        "${e.birthSexName}",
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            isExpanded: true,
                            value: birthSex,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  birth = "${value.birthSexName}";
                                  birthSex = value;
                                });
                              }
                            },
                          ),
                        ),

                  // CustomTextField(
                  //   prefix: Icon(Icons.lock, color: AppColors.primaryColor,),
                  //   hintText: "Password",
                  // ),

                  SizedBox(
                    height: 10.h,
                  ),
                  // Stack(
                  //   children: [
                  //     CustomElevatedButton(
                  //       isExpanded: false,
                  //       title: "Save",
                  //       onPressed: () {
                  //         debugPrint(_gender.name);
                  //         if (xFileList.isNotEmpty) {
                  //           // congratsDialogue(context, onTap: (){
                  //           // context.router.replace(const DashboardRoute());
                  //           // });
                  //
                  //         } else {
                  //           Messages.flushBarMessage(
                  //               context, "Please Upload your image");
                  //         }
                  //       },
                  //       backgroundColor: AppColors.primaryColor,
                  //       textColor: Colors.white,
                  //     ),
                  //     Positioned(
                  //         right: 0,
                  //         top: -7,
                  //         child: Card(child: Text("Upcoming", style: TextStyle(fontSize: 15.sp, color: Colors.red),),))
                  //   ],
                  // ),
                  CustomElevatedButton(
                    isExpanded: false,
                    title: "Save",
                    onPressed: () {
                      String dateString = '${dateOfBirthController.text.toString()}';
                      DateTime dateTime = DateFormat('dd-MM-yyyy').parse(dateString);
                      String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
                      print("ddd${formattedDate}");
                      debugPrint(_gender.name);
                      Map<String, String> body = {
                        'patient_hn_number': widget.user.patientHnNumber.toString(),
                        'patient_mobile_phone': widget.user.patientMobilePhone.toString(),
                        "app_token":
                        "6WXtdlLMiJqi8m8Z0LBqQKVhc7VwOLYv7VoGZ6pFOuaFW3ptWFjRDyLBdQ5QBLNO",
                        'patient_first_name': fastnameController.text,
                        'patient_birth_sex_id': "${birthSex?.id}",
                        'ptn_blood_group_id': "${bloodGroup?.id}",
                        'patient_dob': formattedDate,
                        //'image': MultipartFile(File(xFileList.first!.path).toString(), filename: ""),
                        'patient_email': emailController.text,
                        "patient_last_name": fastnameController.text,
                        "patient_address1": addressController.text,
                      };
                      print(body);
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
              onTap: () async {
                final res = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(kPadding.r),
                      ),
                      actionsPadding: EdgeInsets.only(
                          left: kPadding.w,
                          right: kPadding.w,
                          top: kPadding.h,
                          bottom: kPadding * 2.h),
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
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: kPadding.h,
                          ),
                          ElevatedButton(
                              child: const Text("From Gallery"),
                              onPressed: () {
                                pickImage(fromGallery: true);
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          ElevatedButton(
                              child: const Text("Take Photo"),
                              onPressed: () {
                                pickImage(fromGallery: false);
                                Navigator.pop(context);
                              }),
                        ],
                      )),
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
                      xFileList.isNotEmpty
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(
                                File(xFileList[0]!.path),
                              ),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                  "${AppUrls.image}${widget.user.patientImages}"),
                            ),
                      SizedBox(
                        height: 13.h,
                      ),
                    ],
                  ),
                  Positioned(
                    top: 8,
                    right: 1,
                    bottom: -13,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        size: 15.h,
                      ),
                    ),
                  ),
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
