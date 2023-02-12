// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mhp_patient/generated/assets.dart';
// import 'package:mhp_patient/resources/colors.dart';
// import 'package:mhp_patient/resources/status/home_page_status.dart';
// import 'package:mhp_patient/view_model/doctor_category_view_model.dart';
// import 'package:mhp_patient/widgets/category.dart';
// import 'package:mhp_patient/widgets/custom_appbar_auto_leading_icon.dart';
// import 'package:mhp_patient/widgets/custom_elivated_button.dart';
// import 'package:provider/provider.dart';
//
// import '../resources/constants.dart';
// import '../widgets/custom_dropdown_button.dart';
// import '../widgets/custom_outline_input_border.dart';
// import '../widgets/small_text_field.dart';
//
// class DoctorCategoryView extends StatefulWidget {
//   const DoctorCategoryView({Key? key}) : super(key: key);
//
//   @override
//   State<DoctorCategoryView> createState() => _DoctorCategoryViewState();
// }
//
// class _DoctorCategoryViewState extends State<DoctorCategoryView> {
//   final TextEditingController _searchController = TextEditingController();
//   String dropdownValue = "Doctor";
//   // Specialist specialist = Specialist.specialist;
//   Appointment appointment = Appointment.doctor;
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<DoctorCategoryViewModel>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: const CustomAutoLeadingIcon(),
//         centerTitle: true,
//         title: const Text("MY Doctors", style: TextStyle(),),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(kPadding.r),
//         child: Column(
//           children: [
//           Row(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: Card(
//                     elevation: 5,
//                     child: SmallTextField(
//                       controller: _searchController,
//                       textAlign: TextAlign.start,
//                       hintText: "Search Here",
//                       includePrefixIcon: true,
//                       textInputType: TextInputType.text,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: kPadding.w,
//                 ),
//         // Expanded(
//         //   child: CustomDropDownButton(
//         //         visible: true,
//         //         dropdownValue: specialistValue,
//         //         items: specialistTypeList,
//         //         onChange: (val) {
//         //           if (val != null) {
//         //             specialistValue = val.toString();
//         //             if (specialistValue == "Specialist") {
//         //               specialist = Specialist.specialist;
//         //             } else if (specialistValue == "Cardiologists") {
//         //               specialist = Specialist.cardiologists;
//         //             } else if (specialistValue == "Dermatologists") {
//         //               specialist = Specialist.dermatologists;
//         //             } else if (specialistValue == "HeartSurgeon") {
//         //               specialist = Specialist.heartSurgeon;
//         //             } else if (specialistValue == "Ophthalmologists") {
//         //               specialist = Specialist.ophthalmologists;
//         //             }
//         //             setState(() {});
//         //           }
//         //         },
//         //       ),
//         // ),
//                 Expanded(
//                   child: CustomDropDownButton(
//                     iconSize: 30,
//                     elevation: 5,
//                     dropdownValue: dropdownValue,
//                     items: appointmentTypeList,
//                     onChange: (val) {
//                       if (val != null) {
//                         dropdownValue = val.toString();
//                         if (dropdownValue == "Hospital") {
//                           // homeModel.setVisibleHospital(val: true);
//                           appointment = Appointment.hospital;
//                         } else if (dropdownValue == "Doctor") {
//                           // homeModel.setVisibleDoctors(val: true);
//                           appointment = Appointment.doctor;
//                         } else if (dropdownValue == "All") {
//                           // homeModel.setVisibleAll(val: true);
//                           appointment = Appointment.all;
//                         }
//                         setState(() {});
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: kPadding.h,),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text("Favourite List", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
//             ),
//             SizedBox(
//                 height: 60.h,
//                 // width: MediaQuery.of(context).size.width,
//                 child: ListView.builder(
//                   itemCount: 10,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) => SizedBox(
//                     width: MediaQuery.of(context).size.width - kPadding*2,
//                     child: Card(
//                       shape: customOutlineInputBorder(),
//                     child: ListTile(leading: const CircleAvatar(
//                       backgroundImage: AssetImage(Assets.imagesAvatar),
//                     ),
//                     title: Text("Dr. Ali Rahman", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: const Color(0xFF646464)),),
//                     subtitle: Text("Heart Surgeon\nSquare Hospital, Labaid...", style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400, color: const Color(0xFF8A8A8A),),
//                     ),
//                 ),),
//                   ),),),
//             SizedBox(height: kPadding.h,),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text("Specialist", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),),
//             ),
//              Expanded(child: CustomCategory(horizontalPadding: 0,dataList: provider.doctorCategoryList,),),
//             SizedBox(height: kPadding.h,),
//             Row(
//               children: [
//                 CustomElevatedButton(title: "My History", onPressed: (){}, backgroundColor: AppColors.primaryColor, textColor: Colors.white,),
//                 SizedBox(width: 12.w,),
//                 CustomElevatedButton(title: "Medical Record", onPressed: (){}, backgroundColor: AppColors.primaryColor, textColor: Colors.white,),
//               ],
//             ),
//             SizedBox(height: kPadding.h,),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // List<DropdownMenuItem> specialistTypeList = [
// //   DropdownMenuItem(
// //     value: "Specialist",
// //     child: Text(
// //       "Specialist",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// //   DropdownMenuItem(
// //     value: "Heart Surgeon",
// //     child: Text(
// //       "Heart Surgeon",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// //   DropdownMenuItem(
// //     value: "Dermatologists",
// //     child: Text(
// //       "Dermatologists",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// //   DropdownMenuItem(
// //     value: "Cardiologists",
// //     child: Text(
// //       "Cardiologists",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// //   DropdownMenuItem(
// //     value: "Ophthalmologists",
// //     child: Text(
// //       "Ophthalmologists",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// // ];
//
// List<DropdownMenuItem> appointmentTypeList = [
//   DropdownMenuItem(
//     value: "All",
//     child: Text(
//       "All",
//       style: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w400,
//         color: const Color(0xFF8A8A8A),
//       ),
//     ),
//   ),
//   DropdownMenuItem(
//     value: "Doctor",
//     child: Text(
//       "Doctor",
//       style: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w400,
//         color: const Color(0xFF8A8A8A),
//       ),
//     ),
//   ),
//   DropdownMenuItem(
//     value: "Hospital",
//     child: Text(
//       "Hospital",
//       style: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w400,
//         color: const Color(0xFF8A8A8A),
//       ),
//     ),
//   ),
// ];
