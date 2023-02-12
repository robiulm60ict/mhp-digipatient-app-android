// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../resources/constants.dart';
//
//
// class SeeAllView extends StatelessWidget {
//   const SeeAllView({Key? key, required this.isDoctorView}) : super(key: key);
//   final bool isDoctorView;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const AutoLeadingButton(color: Color(0xFF646464),),
//         centerTitle: true,
//         title: Text(isDoctorView ? "Doctors" : "Hospitals", style: TextStyle(),),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(kPadding.r),
//         child: CustomGridView(visibleImage: isDoctorView,),
//       ),
//     );
//   }
// }
