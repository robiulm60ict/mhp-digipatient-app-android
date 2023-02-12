// import 'dart:io';
// import 'package:auto_route/auto_route.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../resources/colors.dart';
// import '../resources/constants.dart';
// import '../utils/message.dart';
//
//
// class SelectGenderView extends StatefulWidget {
//   const SelectGenderView({Key? key}) : super(key: key);
//
//   @override
//   State<SelectGenderView> createState() => _SelectGenderViewState();
// }
//
// class _SelectGenderViewState extends State<SelectGenderView> {
//   final ImagePicker _picker = ImagePicker();
//   // List<img.Image?> fileImage = [];
//   List<XFile?> xFileList = [];
//   // Pick an image
//
//   pickImage({required bool fromGallery}) async {
//     final XFile? image = await _picker.pickImage(
//         source: fromGallery ? ImageSource.gallery : ImageSource.camera);
//     if (image != null) {
//       // saveImage(image);
//       xFileList.clear();
//       xFileList.add(image);
//       setState(() {});
//     } else {
//       xFileList.clear();
//       setState(() {});
//       Messages.flushBarMessage(
//           context, fromGallery ? "Select an Image" : "Take a Photo");
//     }
//
//     // Capture a photo
//     // final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
//     // if(photo != null){
//     //   // saveImage(photo);
//     //   xFileList.clear();
//     //   xFileList.add(photo);
//     //   setState(() {
//     //
//     //   });
//     // }else{
//     //   Message.flushBarMessage(context, "Something Went wrong Try Again");
//     // }
//   }
//
//   // saveImage(XFile xFile) async {
//   //   final path = xFile.path;
//   //   final bytes = await File(path).readAsBytes();
//   //   final img.Image? image = img.decodeImage(bytes);
//   //   fileImage.clear();
//   //   fileImage.add(image);
//   //   setState(() {});
//   // }
//
//   Gender _gender = Gender.male;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(kPadding.r),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 width: double.infinity,
//               ),
//               Text(
//                 "Your’re Almost \nDone",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 25.sp,
//                     fontWeight: FontWeight.w700,
//                     color: AppColors.primaryColor),
//               ),
//               SizedBox(
//                 height: kPadding.h,
//               ),
//               InkWell(
//                 onTap: () async {
//                   final res = await showDialog(
//                     context: context,
//                     builder: (context) => AlertDialog(
//                       shape: OutlineInputBorder(borderRadius: BorderRadius.circular(kPadding.r),),
//                       actionsPadding: EdgeInsets.only(left: kPadding.w, right: kPadding.w, top: kPadding.h, bottom: kPadding * 2.h),
//                       alignment: Alignment.center,
//                       title: Text(
//                         "Chose Option",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.w700,
//                             color: AppColors.primaryColor),
//                       ),
//                       actions: [
//                         CustomElevatedButton(
//                             notExpandedWidth: 100,
//                             isExpanded: false,
//                             title: "From Gallery",
//                             onPressed: () {
//                               context.router.pop(true);
//                             }),
//                         SizedBox(
//                           width: kPadding.w,
//                         ),
//                         CustomElevatedButton(
//                             notExpandedWidth: 100,
//                             isExpanded: false,
//                             title: "Take Photo",
//                             onPressed: () {
//                               context.router.pop(false);
//                             }),
//                       ],
//                     ),
//                   );
//                   if (res != null) {
//                     await pickImage(fromGallery: res);
//                   } else {
//                     Messages.flushBarMessage(
//                         context, "Select an option to continue");
//                   }
//                 },
//                 child: Stack(
//                   alignment: Alignment.bottomRight,
//                   children: [
//                     CircleAvatar(
//                       radius: 35.h,
//                       backgroundImage: xFileList.isEmpty
//                           ? const AssetImage(Assets.imagesAvatar)
//                           : null,
//                       child: xFileList.isNotEmpty
//                           ? Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                     image: FileImage(
//                                       File(xFileList[0]!.path),
//                                     ),
//                                     fit: BoxFit.fill),
//                               ),
//                             )
//                           : const SizedBox.shrink(),
//                     ),
//                     Positioned(
//                       right: 4,
//                       child: Icon(
//                         Icons.camera_alt_outlined,
//                         size: 18.h,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: kPadding.h,
//               ),
//               Text(
//                 xFileList.isEmpty ? "Upload your profile picture" : "",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w400,
//                     color: AppColors.blackColor),
//               ),
//               SizedBox(
//                 height: 50.h,
//               ),
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile<Gender>(
//                       activeColor: AppColors.primaryColor,
//                       title: Text(
//                         'Male',
//                         style: genderTextStyle(),
//                       ),
//                       value: Gender.male,
//                       groupValue: _gender,
//                       onChanged: (Gender? value) {
//                         setState(() {
//                           _gender = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<Gender>(
//                       activeColor: AppColors.primaryColor,
//                       title: Text(
//                         'Female',
//                         style: genderTextStyle(),
//                       ),
//                       value: Gender.female,
//                       groupValue: _gender,
//                       onChanged: (Gender? value) {
//                         setState(() {
//                           _gender = value!;
//                         });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<Gender>(
//                       activeColor: AppColors.primaryColor,
//                       title: Text(
//                         'Others',
//                         style: genderTextStyle(),
//                       ),
//                       value: Gender.other,
//                       groupValue: _gender,
//                       onChanged: (Gender? value) {
//                         setState(() {
//                           _gender = value!;
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 40.h,
//               ),
//               CustomElevatedButton(
//                 isExpanded: false,
//                 title: "Save",
//                 onPressed: () {
//                   debugPrint(_gender.name);
//                   if (xFileList.isNotEmpty) {
//                     context.router.replace(const DashboardRoute());
//                   } else {
//                     Messages.flushBarMessage(
//                         context, "Please Upload your image");
//                   }
//                 },
//                 backgroundColor: AppColors.primaryColor,
//                 textColor: Colors.white,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// enum Gender { male, female, other, none }
//
// TextStyle genderTextStyle() {
//   return TextStyle(
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w400,
//     color: const Color(0xFF606060),
//   );
// }
