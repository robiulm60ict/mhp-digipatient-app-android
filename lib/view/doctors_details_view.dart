// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mhp_patient/resources/colors.dart';
// import 'package:mhp_patient/resources/constants.dart';
// import 'package:mhp_patient/routes/routes.gr.dart';
// import 'package:mhp_patient/widgets/custom_elivated_button.dart';
// import 'package:mhp_patient/widgets/custom_ratingbar.dart';
//
// import '../generated/assets.dart';
//
// class DoctorDetailsView extends StatelessWidget {
//   const DoctorDetailsView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const AutoLeadingButton(color: Color(0xFF646464)),
//         centerTitle: true,
//         title: Text(
//           "Doctors Details",
//           style: TextStyle(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w700,
//               color: const Color(0xFF646464)),
//         ),
//         actions: [
//           const Icon(
//             Icons.favorite,
//             color: Colors.red,
//           ),
//           SizedBox(
//             width: kPadding.w,
//           ),
//           const Icon(
//             Icons.flag,
//             color: Colors.grey,
//           ),
//           SizedBox(
//             width: kPadding.w,
//           ),
//         ],
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(kPadding.r),
//         children: [
//           Container(
//             padding: EdgeInsets.all(kPadding.r),
//             height: 172.h,
//             decoration: BoxDecoration(
//                 color: const Color(0xFFF8F8F8),
//                 borderRadius: BorderRadius.circular(10.r)),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       flex: 3,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             "Dr. Lincoln Donin",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFF646464)),
//                           ),
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Heart Specialist",
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                   color: const Color(0xFF8A8A8A)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       width: kPadding.w,
//                     ),
//                     CircleAvatar(
//                       radius: 28.h,
//                       backgroundImage: const AssetImage(Assets.imagesUser),
//                       // child: Image.asset("assets/images/user.jpg",),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       padding: EdgeInsets.all(10.r),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFCFCFC),
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "Experience",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xFF8A8A8A)),
//                           ),
//                           Text(
//                             "10yrs+",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFFFFB319)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(10.r),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFCFCFC),
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                       child: Column(
//                         children: [
//                           Text(
//                             "Patients",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xFF8A8A8A)),
//                           ),
//                           Text(
//                             "1000+",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFFEF894E)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(10.r),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFFCFCFC),
//                         borderRadius: BorderRadius.circular(10.r),
//                       ),
//                       child: Column(
//                         // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text(
//                             "Data",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: const Color(0xFF8A8A8A)),
//                           ),
//                           Text(
//                             "1000+",
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w700,
//                                 color: const Color(0xFF4DB9C1)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: kPadding.h,
//           ),
//           Container(
//             padding: EdgeInsets.all(kPadding.r),
//             // height: 107.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 color: const Color(0xFFF8F8F8)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Speciality",
//                   style: TextStyle(
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xFF646464),),
//                 ),
//                 SizedBox(height: 10.h,),
//                 // TextButton.icon(
//                 //   clipBehavior: Clip.none,
//                 //   onPressed: (){
//                 // }, icon: Icon(Icons.circle, size: 12.h, color: Colors.blue,), label: Text("MBBS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A) ),),),
//               SizedBox(
//                 height: 70.h,
//                 child: SingleChildScrollView(
//                   child: Wrap(
//                     spacing: kPadding.w,
//                     children: [
//                       TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 11.h,), label: Text("MBBS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),),),
//                       TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 11.h,), label: Text("BDS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),),),
//                       TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 11.h,), label: Text("BAMS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),),),
//                       TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 11.h,), label: Text("BUMS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),),),
//                       TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 11.h,), label: Text("BHMS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),),),
//                       TextButton.icon(onPressed: (){}, icon: Icon(Icons.check_circle, color: AppColors.primaryColor, size: 11.h,), label: Text("BYNS", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),),),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//               ],
//             ),
//           ),
//           SizedBox(height: kPadding.h,),
//           Container(
//             padding: EdgeInsets.all(kPadding.r),
//             decoration: BoxDecoration(
//               color: const Color(0xFFFCFCFC),
//               borderRadius: BorderRadius.circular(10.r),
//             ),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "About Doctor",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.w500,
//                           color: const Color(0xFF6A6A6A),),
//                     ),
//                     const Spacer(),
//                     ratingBar(onRatingUpdate: (rating) {
//
//                     }, disableRating: true),
//                   ],
//                 ),
//                 SizedBox(height: 10.h,),
//                 Text(
//                   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
//
//                   style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w400,
//                       color: const Color(0xFF8A8A8A)),
//                 ),
//                 SizedBox(height: 10.h,),
//                 Row(
//                   children: [
//                     CustomElevatedButton(title: "Request For Appointment", onPressed: (){
//                       context.router.push(const AppointmentRoute());
//                     }, backgroundColor: const Color(0xFF7FC14D), textColor: Colors.white,),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
