// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import '../resources/colors.dart';
//
// class MyAppointmentsView extends StatefulWidget {
//   const MyAppointmentsView({Key? key, this.bottomHeight = 0}) : super(key: key);
//   final double bottomHeight;
//
//   @override
//   State<MyAppointmentsView> createState() => _MyAppointmentsViewState();
// }
//
// class _MyAppointmentsViewState extends State<MyAppointmentsView> with SingleTickerProviderStateMixin{
//
//   // ScrollController upComingController = ScrollController();
//   // ScrollController completeController = ScrollController();
//   // ScrollController cancelController = ScrollController();
//
//   late TabController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 3, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }
//   // Schedule schedule = Schedule.upcoming;
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<AppointmentViewModel>(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: const AutoLeadingButton(
//           color: Colors.black,
//         ),
//         centerTitle: true,
//         title: const Text(
//           "Schedule",
//           style: TextStyle(),
//         ),
//       ),
//       body: DefaultTabController(
//         length: 3,
//         child: Column(
//         children: [
//           TabBar(
//             controller: controller,
//             indicatorColor: AppColors.primaryColor,
//             indicatorSize: TabBarIndicatorSize.label,
//             labelColor: AppColors.primaryColor,
//             unselectedLabelColor: Colors.grey,
//             indicatorWeight: 3.w,
//             onTap: (value) {
//
//
//             },
//             tabs: const [
//               Tab(icon: Icon(Icons.upcoming), text: "Upcoming",),
//               Tab(icon: Icon(Icons.check_circle), text: "Completed",),
//               Tab(icon: Icon(Icons.cancel), text: "Canceled",),
//               // Tab(icon: Icon(Icons.upcoming, color: controller.index == 0 ? AppColors.primaryColor : Colors.grey),child: Text("Upcoming", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: index == 0 ? AppColors.primaryColor : Colors.grey),), ),
//               // Tab(icon: Icon(Icons.check_circle, color: index == 1 ? AppColors.primaryColor : Colors.grey),child: Text("Completed", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: index == 1 ? AppColors.primaryColor : Colors.grey),), ),
//               // Tab(icon: Icon(Icons.cancel, color: index == 2 ? AppColors.primaryColor : Colors.grey),child: Text("Canceled", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: index == 2 ? AppColors.primaryColor : Colors.grey),), ),
//               // Tab(icon: Icon(Icons.check_circle, color: index == 1 ? AppColors.primaryColor : Colors.grey), text: "Completed"),
//               // Tab(icon: Icon(Icons.cancel, color: index == 2 ? AppColors.primaryColor : Colors.grey), text: "Canceled"),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: controller,
//                 children:  [
//                   const  AppointmentItems(appointmentModelList: [], insideBorderColor: Colors.blue, outsideBorderColor: Colors.blue,),
//                   AppointmentItems(appointmentModelList: [], insideBorderColor: AppColors.primaryColor, outsideBorderColor: AppColors.primaryColor,),
//                   const AppointmentItems(appointmentModelList: [], insideBorderColor: Colors.red, outsideBorderColor: Colors.red,),
//                 ],
//             ),
//           ),
//           SizedBox(height: widget.bottomHeight.h,),
//         ],
//       ),
//       ),
//     );
//   }
// }
