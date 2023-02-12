// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../generated/assets.dart';
// import '../resources/constants.dart';
// import '../utils/popup_dialogue.dart';
//
//
// class MakeAppointmentsView extends StatefulWidget {
//   const MakeAppointmentsView({Key? key}) : super(key: key);
//
//   @override
//   State<MakeAppointmentsView> createState() => _MakeAppointmentsViewState();
// }
//
// class _MakeAppointmentsViewState extends State<MakeAppointmentsView> {
//   bool addDoctor = true;
//   @override
//   void initState() {
//     super.initState();
//     // Provider.of<MakeAppointmentViewModel>(context).showSelectedItem = true;
//   }
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchTextController = TextEditingController();
//     // var provider = Provider.of<MakeAppointmentViewModel>(context);
//     // var dateProvider = Provider.of<SignUpModel>(context);
//     // List<DoctorDetailsModel> docDetails = provider.docDetails;
//
//     return Scaffold(
//       // backgroundColor: Colors.white,
//       appBar: AppBar(
//         // backgroundColor: Colors.white,
//         // leading: const CustomAutoLeadingIcon(),
//         centerTitle: true,
//         title: const Text("Make Appointment"),
//       ),
//       body: ListView(padding: EdgeInsets.all(kPadding.r), children: [
//
//         Visibility(
//           visible: provider.showSelectedItem,
//           replacement: Card(
//             child: ListTile(
//               onTap: (){
//                 notificationPopup(context, doctorName: provider.selectedDocName);
//               },
//               leading:  CircleAvatar(
//                 backgroundImage: AssetImage(Assets.avatar),
//               ),
//               title: Text(provider.selectedDocName, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, ),),
//               subtitle: Text(
//                 "${provider.selectedDocSpecialistAt}\n${provider.selectedDocHospital}", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, ),),
//               trailing: TextButton(onPressed: (){
//                 provider.deleteDoctor();
//               }, child: Text("Add New Doctor", style: TextStyle(fontSize: 10.sp),),)
//           ),
//         ),
//           child: SizedBox(
//             height: 200.h,
//             child: SearchableList<DoctorDetailsModel>(
//               loadingWidget: Center(
//                 child: CircularProgressIndicator(
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//               searchTextController: searchTextController,
//               initialList: provider.docDetails,
//               builder: (DoctorDetailsModel doc) =>
//                   DocItem(doc: doc, searchTextController: searchTextController),
//               filter: (value) => provider.docDetails
//                   .where(
//                     (element) =>
//                         element.doctorName.toLowerCase().contains(value) ||
//                         element.specialistAt.toLowerCase().contains(value),
//                   )
//                   .toList(),
//               emptyWidget: const EmptyView(),
//               inputDecoration: InputDecoration(
//                   contentPadding: EdgeInsets.only(
//                       left: 6.w, right: 6.w, top: 0, bottom: 16.h),
//                   // labelText: "Search Doctor",
//                   hintText: "Search Doctor",
//                   // prefix: CircleAvatar(backgroundImage: AssetImage(Assets.imagesUser),),
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: InputBorder.none
//                   // focusedBorder: OutlineInputBorder(
//                   //   borderSide:  BorderSide(
//                   //     color: Colors.blue,
//                   //     width: 1.0.w,
//                   //   ),
//                   //   borderRadius: BorderRadius.circular(10.0.r),
//                   // ),
//                   ),
//             ),
//           ),),
//         SizedBox(height: kPadding.h,),
//         Card(
//           child: ListTile(
//             onTap: (){
//               provider.selectDate(context);
//             },
//               title: Text(provider.selectedDate, textAlign: TextAlign.center, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),),
//           trailing: const Icon(Icons.arrow_drop_down_outlined, color: Colors.grey,),
//           ),
//         ),
//         SizedBox(height: kPadding.h,),
//         Card(child: ListTile(
//           onTap: (){
//             // TODO: Set The Routing Properly
//             Navigator.push(context, MaterialPageRoute(builder: (context) => const AnatomyPage(),),);
//           },
//           title: Text("Select Disease", textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.sp),),)),
//
//         ElevatedButton(onPressed: (){
//           context.router.push(const AnatomyRoute2());
//         }, child: const Text("Human Anatomy")),
//       ],
//       ),
//     );
//   }
// }
//
// class EmptyView extends StatelessWidget {
//   const EmptyView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         "No Data 🧐	",
//         style: TextStyle(
//             fontSize: 16.sp, fontWeight: FontWeight.w700, color: Colors.red),
//       ),
//     );
//   }
// }
//
// class DocItem extends StatelessWidget {
//   final DoctorDetailsModel doc;
//   final TextEditingController searchTextController;
//
//   const DocItem({
//     Key? key,
//     required this.doc,
//     required this.searchTextController,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<MakeAppointmentViewModel>(context);
//     // return Container(
//     //   height: 60.h,
//     //   padding: EdgeInsets.symmetric(horizontal: 8.0.w),
//     //   decoration: BoxDecoration(
//     //     color: Colors.grey[200],
//     //     borderRadius: BorderRadius.circular(10.r),
//     //   ),
//     //   child: Row(
//     //     children: [
//     //       SizedBox(
//     //         width: 10.w,
//     //       ),
//     //       const CircleAvatar(backgroundImage: AssetImage(Assets.imagesUser),),
//     //       // Icon(
//     //       //   Icons.star,
//     //       //   color: Colors.yellow[700],
//     //       // ),
//     //        SizedBox(
//     //         width: 10.w,
//     //       ),
//     //       Column(
//     //         crossAxisAlignment: CrossAxisAlignment.start,
//     //         mainAxisAlignment: MainAxisAlignment.center,
//     //         children: [
//     //           Text(
//     //             doc.doctorName,
//     //             style: TextStyle(
//     //               color: AppColors.primaryColor,
//     //               fontWeight: FontWeight.w600,
//     //               fontSize: 12.sp,
//     //             ),
//     //           ),
//     //           Text(
//     //             doc.specialistAt,
//     //             style: TextStyle(
//     //               color: AppColors.primaryColor,
//     //               fontWeight: FontWeight.w500,
//     //               fontSize: 11.sp,
//     //             ),
//     //           ),
//     //           Text(
//     //             doc.hospitalName,
//     //             style: TextStyle(
//     //               color: AppColors.primaryColor,
//     //               fontWeight: FontWeight.w400,
//     //               fontSize: 10.sp,
//     //             ),
//     //           ),
//     //         ],
//     //       ),
//     //     ],
//     //   ),
//     // );
//     return Card(
//       child: ListTile(
//         onTap: () {
//           // provider.selectDoctor(index);
//           // searchTextController.text = doc.doctorName;
//           provider.selectDoctor(doc);
//         },
//         leading: const CircleAvatar(
//           backgroundImage: AssetImage(Assets.imagesUser),
//         ),
//         title: Text(doc.doctorName, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, ),),
//         subtitle: Text(
//           "${doc.specialistAt}\n${doc.hospitalName}", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, ),),
//         // trailing: Checkbox(
//         //   activeColor: AppColors.primaryColor,
//         //   value: provider.docDetails[index].isSelected,
//         //   onChanged: (value) {
//         //     setState(() {});
//         //     provider.selectDoctor(index);},
//         // ),
//       ),
//     );
//   }
// }
