// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<ProfileModelView>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: EdgeInsets.all(4.0.r),
//           child: const CircleAvatar(
//             backgroundImage: AssetImage('assets/images/user.jpg'),
//           ),
//         ),
//         title: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "MD. Habibur Rahman",
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w700,
//                   color: const Color(0xFF646464)),
//             ),
//             Text(
//               "01774142172",
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.w400,
//                   color: const Color(0xFF646464)),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Logout",
//                 style: TextStyle(
//                   fontSize: 12.sp,
//                 ),
//               )),
//           SizedBox(
//             width: kPadding.w,
//           ),
//         ],
//       ),
//       body: ListView(
//         // mainAxisAlignment: MainAxisAlignment.center,
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         padding: EdgeInsets.all(kPadding.r),
//
//         children: [
//           CustomElevatedButton(
//             title: "My Profile",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomElevatedButton(
//             title: "Change Password",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 15.h,
//           ),
//           Text(
//             "Legal Support",
//             style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700),
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           CustomElevatedButton(
//             title: "Terms & Conditions",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomElevatedButton(
//             title: "Privacy Policy",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomElevatedButton(
//             title: "Payment Terms",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomElevatedButton(
//             title: "FAQ",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomElevatedButton(
//             title: "About us",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//           SizedBox(
//             height: 5.h,
//           ),
//           CustomElevatedButton(
//             title: "Contact us",
//             onPressed: () {},
//             isExpanded: false,
//             textColor: const Color(0xFF646464),
//           ),
//         ],
//       ),
//     );
//   }
// }
