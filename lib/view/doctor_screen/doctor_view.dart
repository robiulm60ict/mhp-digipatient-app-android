import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/view_model/doctor_screen_view_model/all_patient_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../resources/colors.dart';
import '../../utils/user.dart';
import '../../view_model/real_communication/video_call_view_model.dart';
import '../real_communication/data.dart';


class DoctorHomeView extends StatefulWidget {
  const DoctorHomeView({super.key});

  @override
  State<DoctorHomeView> createState() => _DoctorHomeViewState();
}

class _DoctorHomeViewState extends State<DoctorHomeView> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   // getAllPatients();
    // });

  }
  // getAllPatients(){
  //   context.read<DoctorScreenViewModel>().getAllPatientList(context);
  // }
  @override
  Widget build(BuildContext context) {
    var allPatients = Provider.of<DoctorScreenViewModel>(context).allPatientList.isNotEmpty ? Provider.of<DoctorScreenViewModel>(context).allPatientList.first.patients : [];
    final videoCall = Provider.of<VideoCallViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Doctor view"),
        automaticallyImplyLeading: false,
        actions: [
          TextButton(onPressed: ()async{
            final prefs = await SharedPreferences.getInstance();

            await prefs.setBool(UserP.isLoggedIn, false);

            context.router.replace(const SignInRoute());
          }, child: const Text("Log-Out"))
        ],
      ),
     body: Column(
       children: [
         ElevatedButton(onPressed: (){
           showSearch(context: context, delegate: SearchPage(
           barTheme: ThemeData(
               appBarTheme: AppBarTheme(
               backgroundColor: AppColors.primaryColor,
               iconTheme: const IconThemeData(color: Colors.black),
           ),
           ),
           onQueryUpdate: print,
           items: allPatients!,
           searchLabel: 'Search patients',
           suggestion: const Center(
           child: Text('Filter patients by name, hn number'),
           ),
           failure: const Center(
           child: Text('No patient found :('),
           ),
           filter: (patient) => [
             patient.patientFirstName,
           patient.patientLastName,
           patient.patientMiddleName,
           patient.patientHnNumber,
           // doctor.drFullName,
           // doctor.department?.departmentsName,
           // doctor.usualProvider?.usualProviderName,
           ],
           // sort: (a, b) => a.compareTo(b),
           builder: (patient) => Padding(
           padding: EdgeInsets.all(8.0.r),
           child: ListTile(
             title: Text(patient.patientFirstName.toString(),),
           subtitle: Text(patient.patientHnNumber.toString()),
             trailing: IconButton(onPressed: (){
               videoCall.getVideoCallToken(context, appId: appId, channelName: channelName, userId: channelName, fcmToken: "${patient.appToken}");

               // context.router.push(VideoCallingRTCRoute(token: ));
             }, icon: Icon(Icons.video_call, color: AppColors.primaryColor,)),
           )
           ),));
         }, child: const Text("All Patients",)),
         Expanded(child: ListView.builder(
           itemCount: allPatients!.length,
           itemBuilder: (context, index) {
             return ListTile(
               title: Text(allPatients[index].patientFirstName.toString(),),
               subtitle: Text(allPatients[index].patientHnNumber.toString()),
               trailing: IconButton(onPressed: (){
                 videoCall.getVideoCallToken(context, appId: appId, channelName: channelName, userId: channelName, fcmToken: "${allPatients[index].appToken}");
               }, icon: Icon(Icons.video_call, color: AppColors.primaryColor,)),
             );
           },),),
       ],
     ),
    );
  }
}

