// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
// import 'package:mhp_patient/resources/colors.dart';
// import 'package:mhp_patient/resources/constants.dart';
// import 'package:mhp_patient/routes/routes.gr.dart';
// import 'package:mhp_patient/view_model/confirm_appointment_view_model.dart';
// import 'package:mhp_patient/widgets/custom_appbar_auto_leading_icon.dart';
// import 'package:mhp_patient/widgets/custom_elivated_button.dart';
// import 'package:mhp_patient/widgets/custom_outline_input_border.dart';
// import 'package:provider/provider.dart';
//
// import '../generated/assets.dart';
//
// class AppointmentView extends StatefulWidget {
//   const AppointmentView({Key? key}) : super(key: key);
//
//   @override
//   State<AppointmentView> createState() => _AppointmentViewState();
// }
//
// class _AppointmentViewState extends State<AppointmentView> {
//   bool existingHnSelected = true;
//   bool isOfflineSelected = true;
//   String selectedDate = DateTime.now().toString();
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<ConfirmAppointmentViewModel>(context);
//     return Scaffold(
//       floatingActionButton: ElevatedButton(onPressed: (){}, child: Text("Confirm Appointment", style: TextStyle(fontSize: 15.sp, ),),),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       appBar: AppBar(
//         leading: const CustomAutoLeadingIcon(),
//         centerTitle: true,
//         title: const Text("Appointment", style: TextStyle(),),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: kPadding.w, vertical: kPadding.h),
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       "Dr. Lincoln Donin",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: 18.sp,
//                           fontWeight: FontWeight.w700,
//                           color: const Color(0xFF646464)),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Heart Specialist",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                             color: const Color(0xFF8A8A8A)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: kPadding.w,
//               ),
//               CircleAvatar(
//                 radius: 28.h,
//                 backgroundImage: const AssetImage(Assets.imagesUser),
//                 // child: Image.asset("assets/images/user.jpg",),
//               ),
//             ],
//           ),
//           SizedBox(height: kPadding.h,),
//           SizedBox(
//             // width: MediaQuery.of(context).size.width,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Card(
//                     elevation: 5,
//                     shape: customOutlineInputBorder(borderRadius: 5),
//                     child: CheckboxListTile(
//                       controlAffinity: ListTileControlAffinity.leading,
//                       activeColor: AppColors.primaryColor,
//                       title: Text("Existing HN", style: TextStyle(fontSize: 15.sp,),),
//                       value: existingHnSelected, onChanged: (value) {
//                       if(value != null){
//                         existingHnSelected = value;
//                         setState(() {
//
//                         });
//                       }
//
//                     },),
//                   ),
//                 ),
//                 SizedBox(width: kPadding.w,),
//                 Expanded(
//                   child: SizedBox(
//                     height: 40.h,
//                     child: ElevatedButton.icon(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                         ),
//                         onPressed: () {
//
//                     }, icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black,), label: Text("Pick Family", style: TextStyle(fontSize: 15.sp, color: Colors.black),)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: kPadding.h,),
//           InkWell(
//             onTap: (){
//               provider.selectDate(context);
//             },
//             child: Card(
//               elevation: 5,
//               shape: customOutlineInputBorder(
//                 borderRadius: 5
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // IconButton(onPressed: (){
//                     //   provider.selectDate(context);
//                     // }, icon:
//                     const Icon(Icons.calendar_month, color: Colors.grey,),
//                     SizedBox(width: 8.w,),
//                     Text(provider.selectedDate, style:  TextStyle(fontSize: 15.sp, ),)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10.h,),
//           InkWell(
//             onTap: (){
//               context.router.push(const AnatomyRoute2());
//             },
//             child: Card(
//               elevation: 5,
//               shape: customOutlineInputBorder(
//                   borderRadius: 5
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const CircleAvatar(backgroundImage: AssetImage(Assets.imagesDiseas),),
//                     SizedBox(width: 8.w,),
//                      Text("Select Diseases", style: TextStyle(fontSize: 15.sp),)
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: kPadding.h,),
//           Text("Available Time", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),),
//           SizedBox(height: kPadding.h,),
//           SizedBox(
//             height: 150.h,
//             child: GridView.builder(
//               itemCount: provider.availableTimeList.length,
//               gridDelegate: FlutterzillaFixedGridView(
//               crossAxisCount: 2,
//               crossAxisSpacing: 10.w,
//               mainAxisSpacing: 10.h,
//               height: 45.h
//             ), itemBuilder: (context, index) => ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: provider.availableTimeList[index].isSelected ? AppColors.primaryColor : Colors.white,
//               ),
//                 onPressed: provider.availableTimeList[index].isDisable ? null : (){
//                 provider.selectAvailableTime(index: index);
//                 }, child: Text(provider.availableTimeList[index].time, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700, color: provider.availableTimeList[index].isSelected ? Colors.white : Colors.grey),)),)
//           ),
//           SizedBox(height: kPadding.h,),
//           Text("Preferred Channel", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp),),
//         SizedBox(height: 10.h,),
//           Row(
//             children: [
//               CustomElevatedButton(title: "Offline", onPressed: (){
//                 isOfflineSelected = true;
//                 setState(() {
//
//                 });
//               }, backgroundColor: isOfflineSelected ? AppColors.primaryColor : Colors.white),
//               SizedBox(width: 10.w,),
//               CustomElevatedButton(
//                 backgroundColor: isOfflineSelected ? Colors.white : AppColors.primaryColor ,
//                 title: "Online", onPressed: (){
//                 isOfflineSelected = false;
//                 setState(() {
//
//                 });
//               },),
//             ],
//           ),
//           // SizedBox(height: 10.h,),
//           // ElevatedButton(onPressed: () {
//           //
//           // }, child: Text("Confirm Appointment", style: TextStyle(fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w500),),),
//
//         ],
//       ),
//     );
//   }
// }
//
