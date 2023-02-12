// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mhp_patient/resources/constants.dart';
// import 'package:mhp_patient/widgets/custom_gridview.dart';
//
// import '../routes/routes.gr.dart';
// import '../widgets/see_all.dart';
//
// class FavouritesView extends StatelessWidget {
//   const FavouritesView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Favourites", ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(kPadding.r),
//         child: Column(
//           children: [
//           SeeAll(
//                 visible: true,
//                 title: "Top Doctors",
//                 onPressed: () {
//                   context.router.push(SeeAllRoute(isDoctorView: true),);
//                 }),
//             SizedBox(height: kPadding.h,),
//             const Expanded(child: CustomGridView(visibleImage: true,),),
//             SizedBox(height: kPadding.h,),
//             SeeAll(
//                 visible: true,
//                 title: "Top Hospital",
//                 onPressed: () {
//                   context.router.push(SeeAllRoute(isDoctorView: false),);
//                 }),
//             // SizedBox(height: kPadding.h,),
//             const Expanded(child: CustomGridView(visibleImage: false,),),
//             SizedBox(height: kPadding + 10.h,)
//           ],
//         ),
//       ),
//     );
//   }
// }
