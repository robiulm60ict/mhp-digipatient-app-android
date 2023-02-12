// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// class MyDoctorsView extends StatefulWidget {
//   const MyDoctorsView({Key? key}) : super(key: key);
//
//   @override
//   State<MyDoctorsView> createState() => _MyDoctorsViewState();
// }
//
// class _MyDoctorsViewState extends State<MyDoctorsView> {
//   TextEditingController controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const AutoLeadingButton(color: Colors.black),
//         centerTitle: true,
//         title: const Text("My Doctors"),
//       ),
//       // body: GridView.builder(
//       //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       //       crossAxisCount: 2,
//       //       mainAxisSpacing: 5.w,
//       //       crossAxisSpacing: 5.h,
//       //
//       //       ),
//       //   itemBuilder: (context, index) =>
//       //       SizedBox(
//       //         height: 100.h,
//       //
//       //       ),
//       // ),
//       body:  Column(
//         children: [
//           // Row(
//           //   children: [
//           //     Expanded(child: SmallTextField(controller: controller,)),
//           //   ],
//           // ),
//           Padding(
//             padding:  EdgeInsets.symmetric(horizontal: kPadding.w),
//             child: Card(
//                 elevation: 5,
//                 child: SmallTextField(controller: controller,textAlign: TextAlign.left, width: double.infinity, hintText: "Search",)),
//           ),
//           SizedBox(height: kPadding.h,),
//           const Expanded(child: CustomGridView(visibleImage: true, paddingAll: 25,)),
//         ],
//       ),
//     );
//   }
// }
