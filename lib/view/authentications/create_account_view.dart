import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/auth_model/birth_sex_model.dart';
import 'package:digi_patient/model/auth_model/blood_group_model.dart';
import 'package:digi_patient/utils/datetime.dart';
import 'package:digi_patient/view_model/auth_view_model.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../resources/colors.dart';
import '../../resources/constants.dart';
import '../../resources/styles.dart';
import '../../routes/routes.gr.dart';
import '../../utils/message.dart';
import '../../widgets/custom_elivated_button.dart';
import '../../widgets/shimmer.dart';

class CreateAccountView extends StatefulWidget {
  CreateAccountView({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  String phoneNumber = "";

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
  TextEditingController address = TextEditingController();
  TextEditingController namefast = TextEditingController();
  TextEditingController namelast = TextEditingController();
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
      setBirthSexAndBloodGroup();
    });
  }

  setBirthSexAndBloodGroup() {
    if (!context.read<AuthViewModel>().isBloodGroupLoading &&
        !context.read<AuthViewModel>().isBirthSexLoading) {
      bloodGroup =
          context.read<AuthViewModel>().bloodGroupList.first.bloodGroup!.first;
      birthSex =
          context.read<AuthViewModel>().birthSexList.first.birthSex!.first;
    }
  }

  @override
  void dispose() {
    super.dispose();
    dateOfBirthController.dispose();
    password.dispose();
    email.dispose();
    namefast.dispose();
    namelast.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthViewModel>(builder: (context, auth, child) {
          if (auth.birthSexListItems.isEmpty || auth.bloodGroupList.isEmpty) {
            return auth.isBloodGroupLoading == true ||
                    auth.isBirthSexLoading == true
                ? Center(
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: bannerShimmereffect(
                              94.toDouble(), 385.toDouble()),
                        );
                      },
                    ),
                  )
                : noDataFounForList("No History");
          } else {
            return ListView(
              // // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              padding: EdgeInsets.all(kPadding.r),
              children: [
                Image.asset(
                  Assets.imagesLogoGreen,
                  height: 74.h,
                  width: 126.w,
                ),
                Text(
                  "Create Account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor),
                ),
                Style.distan_size10,
                Align(
                  alignment: Alignment.center,
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
                                      // context.router.pop(true);
                                    }),
                                SizedBox(
                                  height: 10.h,
                                ),
                                ElevatedButton(
                                    child: const Text("Take Photo"),
                                    onPressed: () {
                                      pickImage(fromGallery: false);
                                      Navigator.pop(context);
                                      // context.router.pop(false);
                                    }),
                                // CustomElevatedButton(
                                //     notExpandedWidth: 100,
                                //     isExpanded: false,
                                //     title: "Take Photo",
                                //     onPressed: () {
                                //       context.router.pop(false);
                                //     }),
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
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 35.h,
                          backgroundImage: xFileList.isEmpty
                              ? const AssetImage(Assets.imagesAvatar)
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
                Style.distan_size10,
                Text(
                  xFileList.isEmpty ? "Upload your profile picture" : "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackColor),
                ),
                Style.distan_size10,
                CustomTextField(
                  textEditingController: namefast,
                  prefix: Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Fast Name",
                ),
                Style.distan_size5,
                CustomTextField(
                  textEditingController: namelast,
                  prefix: Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Last Name",
                ),
                Style.distan_size5,
                CustomTextField(
                  // enable: false,
                  textEditingController: dateOfBirthController,
                  prefix: Icon(
                    Icons.date_range,
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Date of Birth",
                  onTap: () async {
                    // final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(3033));
                    DateTime? date = await PickDateTime()
                        .pickDateregister(context, initialDate: DateTime.now());
                    dateOfBirthController.text =
                        "${date?.month}-${date?.day}-${date?.year}";
                  },
                ),
                Style.distan_size5,
                auth.isBloodGroupLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 55.h,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: AppColors.primary_color),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButtonFormField<BloodGroup>(
                          elevation: 0,
                          decoration: InputDecoration(border: InputBorder.none),
                          padding: EdgeInsets.only(left: 8),
                          hint: Text(
                            "Select Blood Group",
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          items: auth.bloodGroupList.first.bloodGroup
                              ?.map((e) => DropdownMenuItem<BloodGroup>(
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
                Style.distan_size5,
                auth.isBirthSexLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 55.h,
                        width: double.infinity,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: AppColors.primary_color),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        child: DropdownButtonFormField<BirthSex>(
                          elevation: 0,
                          decoration: InputDecoration(border: InputBorder.none),
                          padding: EdgeInsets.only(left: 8),
                          hint: Text(
                            "Select Gender",
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          items: auth.birthSexList.first.birthSex
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
                                // bloodGroupId = "${value.id}";
                                birthSex = value;
                              });
                            }
                          },
                        ),
                      ),
                Style.distan_size5,
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: email,
                  prefix: Icon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Email",
                ),
                Style.distan_size5,
                CustomTextField(
                  textEditingController: address,
                  prefix: Icon(
                    Icons.location_city,
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Address",
                ),
                Style.distan_size5,
                CustomTextField(
                  textEditingController: password,
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
                        color:
                            obSecureText ? AppColors.primaryColor : Colors.grey,
                      )),
                ),
                Style.distan_size15,
                // auth.isRegistrationLoading == true
                //     ? Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                CustomElevatedButton(
                        isExpanded: false,
                        title: "Save",
                        onPressed: () async {
                          // debugPrint("------------------------------------------------\n\n\n\n\n\n");

                          if (xFileList.isEmpty) {
                            Messages.snackBar(
                                context, "Image con not be empty !");
                          }
                          if (namefast.text.isEmpty) {
                            Messages.snackBar(
                                context, "FastName con not be empty !");
                          } else if (namelast.text.isEmpty) {
                            Messages.snackBar(
                                context, "LastName con not be empty !");
                          } else if (dateOfBirthController.text.isEmpty) {
                            Messages.snackBar(
                                context, "Date of Birth con not be empty !");
                          }

                          // else if (bloodGroup == null) {
                          //   Messages.snackBar(
                          //       context, "Blood Group con not be empty !");
                          // }
                          else if (birthSex == null) {
                            Messages.snackBar(
                                context, "Gender con not be empty !");
                          }

                          // else if (email.text.isEmpty) {
                          //   Messages.snackBar(
                          //       context, "Email con not be empty !");
                          // }

                          else if (address.text.isEmpty) {
                            Messages.snackBar(
                                context, "Address con not be empty !");
                          } else if (password.text.length < 7) {
                            Messages.snackBar(
                                context, "Enter At least 8 Digit Password");
                          } else {
                            Map<String, String> body = {
                              'patient_mobile_phone': widget.phoneNumber,
                              "app_token":
                                  "6WXtdlLMiJqi8m8Z0LBqQKVhc7VwOLYv7VoGZ6pFOuaFW3ptWFjRDyLBdQ5QBLNO",
                              'patient_first_name': namefast.text,
                              'patient_birth_sex_id': "${birthSex?.id}",
                              'ptn_blood_group_id': "${bloodGroup?.id}",
                              'patient_dob': dateOfBirthController.text,
                              //'image': MultipartFile(File(xFileList.first!.path).toString(), filename: ""),
                              'password': password.text,
                              'patient_email': email.text,
                              "patient_last_name": namelast.text,
                              "patient_address1": address.text,
                            };
                            print(body);
                            //  await auth.signUpOriginal(context, body);
                            await auth.signUp(context, body,
                                File(xFileList.first!.path).path);
                            widget.phoneNumber = "";
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
                          }
                        },
                        backgroundColor: AppColors.primaryColor,
                        textColor: Colors.white,
                      ),
              ],
            );
          }
        }),
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
