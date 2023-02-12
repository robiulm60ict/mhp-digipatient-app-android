// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mhp_patient/resources/constants.dart';
// import 'package:mhp_patient/view/make_appointments_view.dart';
// import 'package:mhp_patient/view/my_appointments_view.dart';
// import 'package:mhp_patient/widgets/custom_appbar_auto_leading_icon.dart';
//
// import '../resources/colors.dart';
//
// class ChoseAppointmentsView extends StatefulWidget {
//   const ChoseAppointmentsView({Key? key}) : super(key: key);
//
//   @override
//   State<ChoseAppointmentsView> createState() => _ChoseAppointmentsViewState();
// }
//
// class _ChoseAppointmentsViewState extends State<ChoseAppointmentsView> with SingleTickerProviderStateMixin {
//   late TabController controller;
//   int tabControllerLength = 2;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: tabControllerLength, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabControllerLength,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           leading: const CustomAutoLeadingIcon(),
//           title: const Text("Appointments", style: TextStyle(),),
//         ),
//         body: Column(
//           children: [
//             TabBar(
//                 controller: controller,
//                 indicatorColor: AppColors.primaryColor,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 labelColor: AppColors.primaryColor,
//                 unselectedLabelColor: Colors.grey,
//                 indicatorWeight: 3.w,
//                 onTap: (value) {
//
//
//                 },
//                 tabs: const [
//                   Tab(icon: Icon(Icons.insert_chart_outlined_sharp), text: "Make Appointment",),
//                   Tab(icon: Icon(Icons.calendar_month), text: "My Appointment",),
//               // Text("Make Appointment"),
//               // Text("My Appointment"),
//             ]),
//             SizedBox(height: kPadding.h,),
//             Expanded(
//               child: TabBarView(
//                   controller: controller,
//                   children: [
//                 // MakeAppointmentsView(),
//                 // MyAppointmentsView(),
//                     Card(color: Colors.red,),
//                     Card(color: Colors.yellow,),
//               ]),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
