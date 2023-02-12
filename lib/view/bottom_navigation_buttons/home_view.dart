// // import 'package:auto_route/auto_route.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:mhp_patient/generated/assets.dart';
// // import 'package:mhp_patient/routes/routes.gr.dart';
// // import 'package:mhp_patient/widgets/custom_dropdown_button.dart';
// // import 'package:mhp_patient/widgets/custom_gridview.dart';
// // import 'package:mhp_patient/widgets/see_all.dart';
// // import 'package:mhp_patient/widgets/small_text_field.dart';
// // import '/resources/constants.dart';
// // import '/resources/status/home_page_status.dart';
// // import '/view_model/home_page_model.dart';
// // import 'package:provider/provider.dart';
// //
// // class HomeView extends StatefulWidget {
// //   const HomeView({Key? key}) : super(key: key);
// //
// //   @override
// //   State<HomeView> createState() => _HomeViewState();
// // }
// //
// // class _HomeViewState extends State<HomeView> {
// //   final TextEditingController _searchController = TextEditingController();
// //   String dropdownValue = "All";
// //   String specialistValue = "Specialist";
// //
// //   @override
// //   void dispose() {
// //     super.dispose();
// //     _searchController.dispose();
// //   }
// //
// //   bool isWeekDaySelected = false;
// //   Appointment appointment = Appointment.all;
// //   Specialist specialist = Specialist.specialist;
// //   @override
// //   void initState() {
// //     super.initState();
// //     // context.read<HomePageModel>().setVisibleAll(val: true);
// //     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
// //       final pr = Provider.of<HomePageModel>(context, listen: false);
// //       pr.setVisibleAll(val: true);
// //     });
// //     // context.read<HomePageModel>().getWeekData();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var homeModel = Provider.of<HomePageModel>(context);
// //     return Scaffold(
// //       appBar: AppBar(
// //         toolbarHeight: 81.h,
// //         centerTitle: true,
// //         title: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Align(
// //               alignment: Alignment.centerLeft,
// //               child: Text(
// //                 "Hello",
// //                 maxLines: 1,
// //                 overflow: TextOverflow.ellipsis,
// //                 style: TextStyle(
// //                     fontSize: 14.sp,
// //                     fontWeight: FontWeight.w400,
// //                     color: const Color(0xFF8A8A8A)),
// //               ),
// //             ),
// //             Text(
// //               "Habibur Rahman",
// //               style: TextStyle(
// //                   fontSize: 18.sp,
// //                   fontWeight: FontWeight.w700,
// //                   color: const Color(0xFF646464)),
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           CircleAvatar(
// //             radius: 28.h,
// //             backgroundImage: const AssetImage(Assets.imagesUser),
// //             // child: Image.asset("assets/images/user.jpg",),
// //           ),
// //           SizedBox(
// //             width: kPadding.w,
// //           ),
// //         ],
// //       ),
// //       body: ListView(
// //         padding: EdgeInsets.all(kPadding.w),
// //         children: [
// //           Row(
// //             children: [
// //               Expanded(
// //                 flex: 2,
// //                 child: SmallTextField(
// //                   controller: _searchController,
// //                   textAlign: TextAlign.start,
// //                   hintText: "Search Here",
// //                   includePrefixIcon: true,
// //                   textInputType: TextInputType.text,
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: kPadding.w,
// //               ),
// //               Expanded(
// //                 child: CustomDropDownButton(
// //
// //                   dropdownValue: dropdownValue,
// //                   items: appointmentTypeList,
// //                   onChange: (val) {
// //                     if (val != null) {
// //                       dropdownValue = val.toString();
// //                       if (dropdownValue == "Hospital") {
// //                         homeModel.setVisibleHospital(val: true);
// //                         appointment = Appointment.hospital;
// //                       } else if (dropdownValue == "Doctor") {
// //                         homeModel.setVisibleDoctors(val: true);
// //                         appointment = Appointment.doctor;
// //                       } else if (dropdownValue == "All") {
// //                         homeModel.setVisibleAll(val: true);
// //                         appointment = Appointment.all;
// //                       }
// //                       setState(() {});
// //                     }
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //           appointment == Appointment.hospital ? const SizedBox.shrink() : SizedBox(
// //             height: kPadding.h,
// //           ),
// //           CustomDropDownButton(
// //             visible: appointment == Appointment.hospital ? false : true,
// //             dropdownValue: specialistValue,
// //             items: specialistTypeList,
// //             onChange: (val) {
// //               if (val != null) {
// //                 specialistValue = val.toString();
// //                 if (specialistValue == "Specialist") {
// //                   specialist = Specialist.specialist;
// //                 } else if (specialistValue == "Cardiologists") {
// //                   specialist = Specialist.cardiologists;
// //                 } else if (specialistValue == "Dermatologists") {
// //                   specialist = Specialist.dermatologists;
// //                 } else if (specialistValue == "HeartSurgeon") {
// //                   specialist = Specialist.heartSurgeon;
// //                 } else if (specialistValue == "Ophthalmologists") {
// //                   specialist = Specialist.ophthalmologists;
// //                 }
// //                 setState(() {});
// //               }
// //             },
// //           ),
// //           homeModel.visibleDoctors ? SizedBox(
// //             height: kPadding.h,
// //           ) : const SizedBox.shrink(),
// //           SeeAll(
// //               visible: homeModel.visibleDoctors,
// //               title: "Top Doctors",
// //               onPressed: () {
// //                 context.router.push(SeeAllRoute(isDoctorView: true));
// //               }),
// //           SizedBox(
// //             height: kPadding.h,
// //           ),
// //           Visibility(
// //             visible: homeModel.visibleDoctors,
// //             child: SizedBox(
// //               height: 230.h,
// //               child: const CustomGridView(visibleImage: true, ),
// //             ),
// //           ),
// //           homeModel.visibleHospital ? SizedBox(
// //             height: kPadding.h,
// //           ) : const SizedBox.shrink(),
// //           SeeAll(
// //               visible: homeModel.visibleHospital,
// //               title: "Top Hospital",
// //               onPressed: () {
// //                 context.router.push(SeeAllRoute(isDoctorView: false));
// //               }),
// //           SizedBox(
// //             height: kPadding.h,
// //           ),
// //           Visibility(
// //             visible: homeModel.visibleHospital,
// //             child: SizedBox(
// //               height: 230.h,
// //               child: const CustomGridView(),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // List<DropdownMenuItem> appointmentTypeList = [
// //   DropdownMenuItem(
// //     value: "All",
// //     child: Text(
// //       "All",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// //   DropdownMenuItem(
// //     value: "Doctor",
// //     child: Text(
// //       "Doctor",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// //   DropdownMenuItem(
// //     value: "Hospital",
// //     child: Text(
// //       "Hospital",
// //       style: TextStyle(
// //         fontSize: 12.sp,
// //         fontWeight: FontWeight.w400,
// //         color: const Color(0xFF8A8A8A),
// //       ),
// //     ),
// //   ),
// // ];
// //
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
// //
// // // final List<String> items = [
// // //   'Hospital Appointment',
// // //   'Item2',
// // //   'Item3',
// // //   'Item4',
// // //   'Item5 ',
// // //   'Item6',
// // //   'Item7',
// // //   'Item8',
// // // ];
// // // String? selectedValue;
//
// import 'package:auto_route/auto_route.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../generated/assets.dart';
// import '../resources/constants.dart';
//
//
//
// class HomeView extends StatelessWidget {
//   const HomeView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final homeService = Provider.of<HomePageService>(context);
//     // double screenWidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 120.h,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.r), bottomRight: Radius.circular(30.r),),
//             ),
//             // child: Stack(
//             //   alignment: Alignment.bottomCenter,
//             //   children: [
//             //     Row(
//             //       children: [
//             //         // Container(
//             //         //   width: 100.w,
//             //         //   padding: EdgeInsets.all(5.r),
//             //         //   height: double.infinity,
//             //         //   decoration: BoxDecoration(
//             //         //     color: Colors.greenAccent,
//             //         //     borderRadius: BorderRadius.only(topRight: Radius.circular(20.w), bottomRight: Radius.circular(20.w), bottomLeft: Radius.circular(30.r)),
//             //         //   ),
//             //         //   child: Column(
//             //         //     mainAxisSize: MainAxisSize.min,
//             //         //     crossAxisAlignment: CrossAxisAlignment.start,
//             //         //     mainAxisAlignment: MainAxisAlignment.center,
//             //         //     children: [
//             //         //       Text("Hello", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300, color: Colors.grey),),
//             //         //       Row(
//             //         //         children: [
//             //         //           Expanded(child: Text("Habibur Rahman", overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.left, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.black),),),
//             //         //         ],
//             //         //       ),
//             //         //     ],
//             //         //   ),
//             //         // ),
//             //         // const Spacer(),
//             //         Expanded(
//             //           child: Column(
//             //             crossAxisAlignment: CrossAxisAlignment.start,
//             //             children: [
//             //               Text("Hello",style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),),
//             //               Text("Md. Habibur Rahman", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),),
//             //           Text("Welcome to Digi Health Plus", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A),),),
//             //             ],
//             //           ),
//             //         ),
//             //         Expanded(
//             //           // width: 100.w,
//             //           child: CarouselSlider.builder(
//             //             itemCount: 5,
//             //             itemBuilder: (context, index, realIndex) => Image.asset(
//             //               height: 80.h,
//             //               width: 100.w,
//             //               Assets.imagesLogo, fit: BoxFit.fill,),
//             //             options: CarouselOptions(
//             //               autoPlay: true,
//             //
//             //           ),),
//             //         ),
//             //         SizedBox(width: kPadding.w,),
//             //         // Padding(
//             //         //   padding: EdgeInsets.all(8.0.r),
//             //         //   child: Column(
//             //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //         //     crossAxisAlignment: CrossAxisAlignment.end,
//             //         //     children: [
//             //         //       Align(
//             //         //         alignment: Alignment.centerRight,
//             //         //         child: Expanded(
//             //         //           // width: 100.w,
//             //         //           child:
//             //         //           CarouselSlider.builder(
//             //         //             itemCount: 5,
//             //         //             itemBuilder: (context, index, realIndex) => Image.asset(
//             //         //             height: 80.h,
//             //         //             width: 100.w,
//             //         //             Assets.imagesLogo, fit: BoxFit.fill,), options: CarouselOptions(autoPlay: true,
//             //         //           ),),
//             //         //         ),
//             //         //       ),
//             //         //       // Expanded(
//             //         //       //   child: Row(
//             //         //       //     // mainAxisAlignment: MainAxisAlignment.end,
//             //         //       //     children: [
//             //         //       //       // const Expanded(
//             //         //       //       //     child: SizedBox()),
//             //         //       //       // SizedBox(
//             //         //       //       //   width: 100.w,
//             //         //       //       // ),
//             //         //       //       // Spacer(),
//             //         //       //       SizedBox(
//             //         //       //         width: 100.w,
//             //         //       //         child:
//             //         //       //       CarouselSlider.builder(itemCount: 5, itemBuilder: (context, index, realIndex) => Image.asset(
//             //         //       //         height: 80.h,
//             //         //       //         width: 100.w,
//             //         //       //         Assets.imagesLogo, fit: BoxFit.fill,), options: CarouselOptions(autoPlay: true,
//             //         //       //       ),),
//             //         //       //       ),
//             //         //       //     ],
//             //         //       //   ),
//             //         //       // ),
//             //         //       Text('Welcome to Digi Patient', overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.left, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300, color: Colors.black),),
//             //         //     ],
//             //         //   ),
//             //         // ),
//             //       ],
//             //     ),
//             //     // Padding(
//             //     //   padding: EdgeInsets.all(6.0.r),
//             //     //   child: Text("Welcome to Digi Health Plus", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
//             //     // )
//             //   ],
//             // ),
//             child: Row(
//               children: [
//                 // Container(
//                 //   width: 100.w,
//                 //   padding: EdgeInsets.all(5.r),
//                 //   height: double.infinity,
//                 //   decoration: BoxDecoration(
//                 //     color: Colors.greenAccent,
//                 //     borderRadius: BorderRadius.only(topRight: Radius.circular(20.w), bottomRight: Radius.circular(20.w), bottomLeft: Radius.circular(30.r)),
//                 //   ),
//                 //   child: Column(
//                 //     mainAxisSize: MainAxisSize.min,
//                 //     crossAxisAlignment: CrossAxisAlignment.start,
//                 //     mainAxisAlignment: MainAxisAlignment.center,
//                 //     children: [
//                 //       Text("Hello", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300, color: Colors.grey),),
//                 //       Row(
//                 //         children: [
//                 //           Expanded(child: Text("Habibur Rahman", overflow: TextOverflow.ellipsis, maxLines: 2, textAlign: TextAlign.left, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: Colors.black),),),
//                 //         ],
//                 //       ),
//                 //     ],
//                 //   ),
//                 // ),
//                 // const Spacer(),
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding:  EdgeInsets.only(left: kPadding.w),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Hello",style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),),
//                         Text("Md. Habibur Rahman", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),),
//                         Text("Welcome to Digi Health Plus", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A),),),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   // width: 100.w,
//                   child: CarouselSlider.builder(
//                     itemCount: 5,
//                     itemBuilder: (context, index, realIndex) => Image.asset(
//                       height: 80.h,
//                       width: 100.w,
//                       Assets.imagesLogo, fit: BoxFit.fill,),
//                     options: CarouselOptions(
//                       autoPlay: true,
//
//                     ),),
//                 ),
//                 SizedBox(width: kPadding.w,),
//
//               ],
//             ),
//           ),
//         ),
//
//         body: Column(
//           children: [
//             // CircleAvatar(
//             //   radius: 35.h,
//             //   backgroundColor: Colors.transparent,
//             //   child: Image.asset(Assets.imagesLogoBlack, fit: BoxFit.fill,),),
//             SizedBox(height: 10.h,),
//             Container(
//               margin: EdgeInsets.symmetric(horizontal: kPadding.w),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r)
//               ),
//               height: 80.h,
//               child: Card(
//                 elevation: 7,
//                 shape: customOutlineInputBorder(),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: const Color(0xFFF0F3F6),
//                       child: IconButton(onPressed: (){
//                         context.router.push(const CommunicationInterfaceRoute());
//                       }, icon: Icon(Icons.add_call, size: 15.h, color: AppColors.primaryColor,),),),
//                     CircleAvatar(
//                       backgroundColor: const Color(0xFFF0F3F6),
//                       child: IconButton(onPressed: (){
//                         context.router.push(VideoCallRoute());
//                       }, icon: Icon(Icons.video_call, size: 15.h, color: AppColors.primaryColor,),),),
//                     CircleAvatar(
//                       backgroundColor: const Color(0xFFF0F3F6),
//                       child: IconButton(onPressed: (){
//                         // context.router.push(const ChatRoute());
//                         context.router.push(const ChatRoute());
//                       }, icon: Icon(Icons.message, size: 15.h, color: AppColors.primaryColor,),),),
//               //       Column(
//               //         mainAxisSize: MainAxisSize.min,
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //   CircleAvatar(
//               //   backgroundColor: const Color(0xFFF0F3F6),
//               //     child: IconButton(onPressed: (){}, icon: Icon(Icons.add_call, size: 15.h, color: AppColors.primaryColor,),),),
//               // SizedBox(height: 6.h,),
//               //           Text("Call", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp),),
//               //         ],
//               //       ),
//               //       Column(
//               //         mainAxisSize: MainAxisSize.min,
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //   CircleAvatar(
//               //   backgroundColor: AppColors.primaryColor,
//               //     child: IconButton(onPressed: (){
//               //       context.router.push(VideoCallRoute());
//               //     }, icon: Icon(Icons.video_call, size: 15.h, color: Colors.white,),),),
//               // SizedBox(height: 6.h,),
//               //           Text("Video", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp),),
//               //         ]),
//               //       Column(
//               //         mainAxisSize: MainAxisSize.min,
//               //         mainAxisAlignment: MainAxisAlignment.center,
//               //         children: [
//               //   CircleAvatar(
//               //   backgroundColor: Colors.blue,
//               //     child: IconButton(onPressed: (){}, icon: Icon(Icons.chat, size: 15.h, color: Colors.white,),),),
//               // SizedBox(height: 6.h,),
//               //           Text("Chat", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11.sp),),
//               //         ]),
//                     // CircleAvatar(
//                     //   backgroundColor: AppColors.primaryColor,
//                     //   child: IconButton(onPressed: (){
//                     //
//                     //   }, icon: Icon(Icons.video_call, size: 15.h, color: Colors.white,),),),
//                     // CircleAvatar(
//                     //   backgroundColor: Colors.blue,
//                     //   child: IconButton(onPressed: (){}, icon: Icon(Icons.chat, size: 15.h, color: Colors.white,),),),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 6.h,),
//             Padding(
//               padding: EdgeInsets.only(left: kPadding.w),
//               child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text("What do you need ?", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black),)),
//             ),
//             SizedBox(height: 6.h,),
//             Expanded(
//               flex: 2,
//               child: GridView.builder(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: kPadding.w, vertical: 10.h),
//                 itemCount: homeDataList.length,
//                 gridDelegate: FlutterzillaFixedGridView(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 5.w,
//                     crossAxisSpacing: 5.h,
//                     height: 94.h),
//                 itemBuilder: (context, index) => InkWell(
//                   onTap: () {
//                     homeService.homePageRouteTo(context, index: index);
//                   },
//                   child: Card(
//                     elevation: 5,
//                     shape: customOutlineInputBorder(),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircleAvatar(backgroundImage: AssetImage(homeDataList[index].imageUrl,)),
//                         // Image.asset(
//                         //   height: 50.h,
//                         //   width: 50.w,
//                         //   fit: BoxFit.fill,
//                         //   homeDataList[index].imageUrl,
//                         // ),
//                         SizedBox(
//                           height: 8.h,
//                         ),
//                         Text(
//                           homeDataList[index].name,
//                           style: TextStyle(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w400,
//                               color: Colors.black,),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: kPadding.h,),
//             SizedBox(
//               // height: 100.h,
//               // width: double.infinity,
//               child: CarouselSlider.builder(
//                 itemCount: 5,
//                 itemBuilder: (context, index, realIndex) =>
//               //       Container(
//               //
//               //   // margin: EdgeInsets.symmetric(horizontal: 8.w),
//               //   //   width: MediaQuery.of(context).size.width - kPadding,
//               //   decoration: BoxDecoration(
//               //     color: Colors.white,
//               //     // borderRadius: BorderRadius.circular(10.r)
//               //   ),
//               // ),
//                 Card(child: Center(child: Text("Page: $index"),),
//                 ),
//                 options: CarouselOptions(
//                 autoPlay: true,
//                 height: 100.h,
//                 viewportFraction: 1,
//                 // disableCenter: false,
//               ),
//               ),
//             ),
//             SizedBox(height: kPadding.h,),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class HomeDataModel {
//   String imageUrl;
//   String name;
//   Color textColor;
//   HomeDataModel({required this.name, required this.imageUrl, this.textColor = Colors.black});
// }
//
// List<HomeDataModel> homeDataList = [
//   HomeDataModel(name: "My Doctor", imageUrl: 'assets/icons/my-doc.png'),
//   HomeDataModel(
//       name: "My Record",
//       imageUrl: Assets.iconsMedicalRecord,
//     textColor: Colors.black,
//   ),
//   HomeDataModel(
//       name: "My Lab",
//       imageUrl: Assets.iconsLab,
//     textColor: Colors.redAccent,
//   ),
//   HomeDataModel(
//       name: "Appointments",
//       imageUrl: Assets.iconsAppointment,
//     textColor: Colors.yellow,
//   ),
//   HomeDataModel(
//       name: "Resources",
//       imageUrl: Assets.iconsHospitalAdmission, textColor: Colors.yellow,),
//   HomeDataModel(
//       name: "Invoice & Payment", imageUrl: Assets.iconsInvoice,textColor: Colors.yellow,),
//   HomeDataModel(name: "My Medicine", imageUrl: Assets.iconsMedicine,textColor: Colors.yellow,),
//   HomeDataModel(name: "Services", imageUrl: Assets.iconsService,textColor: Colors.yellow,),
// ];
//

import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view_model/home_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/drawer_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = (size.width / 3) * 2;
    // width = width + width;
    debugPrint(size.width.toString());
    final provider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      // drawer: InkWell(onTap: (){
      //   print("Drawer");
      // }, child: Image.asset(Assets.drawer, height: 100, width: 100,),),
      drawer: Drawer(
        width: (size.width / 3) * 2 .w ,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(70.w)),
          borderSide: BorderSide.none,
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
          shrinkWrap: true,
          children: [
            Row(
              children: [
                const CustomBackButton(margin: 0, padding: 8,),
                Expanded(child: Text("Menu", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),)),
              ],
            ),
            SizedBox(height: 50.h,),
            DrawerListTile(iconData: Icons.person, title: "Profile", onTap: (){},),
            SizedBox(height: 6.h,),
            DrawerListTile(iconData: Icons.calendar_view_day, title: "Appointment", onTap: (){},),
            SizedBox(height: 6.h,),
            DrawerListTile(iconData: Icons.favorite_border, title: "Favourite", onTap: (){},),
            SizedBox(height: 6.h,),
            DrawerListTile(iconData: Icons.payment, title: "Payment & Invoice", onTap: (){},),
            SizedBox(height: 6.h,),
            DrawerListTile(iconData: Icons.fact_check_outlined, title: "Faq", onTap: (){},),
            SizedBox(height: 6.h,),
            DrawerListTile(iconData: Icons.privacy_tip, title: "Privacy & Policy", onTap: (){},),
            SizedBox(height: 6.h,),
            Card(
              color: AppColors.primaryColor,
              child: ListTile(
                onTap: (){},
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.logout, size: 15.h, color: AppColors.primaryColor,),
                ),
                title: Text("Logout", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
            SizedBox(height: 5.h),
            Text("V 2.0.0(200)", textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFFAAAAAA)),)
          ],
        ),
      ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) {
            return InkWell(onTap: (){
              Scaffold.of(context).openDrawer();
            }, child: Image.asset(Assets.drawer, height: 100, width: 100,),);
          }
        ),
        actions: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 15,),
              Badge(
                position: BadgePosition.topEnd(top: 3, end: 6),
                  badgeContent: const Text("6", style: TextStyle(color: Colors.white),),
                  child: IconButton(onPressed: (){
                    context.router.push(const NotificationsRoute());
                  }, icon: Icon(Icons.notification_important, color: AppColors.primaryColor,))),
            ],
          ),
        SizedBox(width: 8.w,),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          Container(
            height: 153.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Assets.welcomeBackground))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello!", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22.sp, color: AppColors.primaryColor ),),
                SizedBox(height: 8.h,),
                Text("Habibur Rahman", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp, color: const Color(0xFF454545)),),
                Text("Welcome to Macro Health Plus", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle( fontSize: 14.sp, color: const Color(0xFF7A7A7A),),),
              ],
            ),
          ),
          SizedBox(height: 15.h,),
          // SizedBox(
          //     height: 100.h,
          //     child: Image.asset('assets/images/macro-health-plus.png', height: 100.h, width: 300.w,)),
          Container(
            height: 31.h,
            // width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.macroHealthPlus))
            ),
          ),
          SizedBox(height: 15.h,),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.h)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      backgroundColor:  const Color(0xFFF0F3F6),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.call, size: 18.h, color: AppColors.primaryColor,))),
                  CircleAvatar(
                      backgroundColor:  const Color(0xFFF0F3F6),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.video_call, size: 18.h, color: AppColors.primaryColor,))),
                  CircleAvatar(
                      backgroundColor:  const Color(0xFFF0F3F6),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.message, size: 18.h, color: AppColors.primaryColor,))),
                ],
              ),
            ),
          ),
          SizedBox(height: 18.h,),
          Text("What do you need?", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
          SizedBox(height: 18.h,),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,
          //   mainAxisSpacing: 5.h,
          //   crossAxisSpacing: 10.w,
          //   mainAxisExtent: 130
          //
          //   // maxCrossAxisExtent: 200,
          //   // childAspectRatio: 3/1,
          //   // crossAxisSpacing: 5.h,
          //   // mainAxisSpacing: 5.w,
          // ),
              gridDelegate: const FlutterzillaFixedGridView(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 10,
                  height: 120
              ),
              itemCount: provider.homeItemsList.length,
              itemBuilder: (BuildContext context, index){
            // return Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(12.r)
            //   ),
            // );
            //     return Card(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12.r)
            //           ),
            //       child: ListTile(
            //         onTap: (){},
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(12.r),
            //         ),
            //         leading: const CircleAvatar(),
            //         title: Text("My Doctor", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),),
            //       ),
            //     );
                return InkWell(
                  onTap: provider.homeItemsRouteTo(index),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Container(
                      //   margin: EdgeInsets.only(bottom: 4.h),
                      //   height: 70.h,
                      //   // padding: EdgeInsets.all(18.r),
                      //   decoration: BoxDecoration(
                      //     color: AppColors.primaryColor,
                      //     borderRadius: BorderRadius.circular(12.r),
                      //     image: const DecorationImage(
                      //       // fit: BoxFit.fill,
                      //       image: AssetImage(Assets.myDoctor),),
                      //   ),
                      // ),
                      SizedBox(
                        height: 70.h,
                        width: double.infinity,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0.r),
                            child: Image.asset(provider.homeItemsList[index].image,),
                          ),
                        ),
                      ),

                      Text(provider.homeItemsList[index].title, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),)
                    ],
                  ),
                );
          }),
          SizedBox(height: 30.h,),
        ],
      ),
    );
  }
}
