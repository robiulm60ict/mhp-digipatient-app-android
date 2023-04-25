import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/my_record_model/medical_history_from_great_doc_model.dart';
import 'package:digi_patient/model/user_detail_model/user_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:digi_patient/view_model/user_view_model/user_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/my_record_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';

import '../../resources/app_url.dart';

class MyRecordView extends StatefulWidget {
  const MyRecordView({Key? key}) : super(key: key);

  @override
  State<MyRecordView> createState() => _MyRecordViewState();

}

class _MyRecordViewState extends State<MyRecordView> {
  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().getUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);
    final user = Provider.of<UserViewModel>(context).user;

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text("My Record", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
           Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.h,
                      backgroundImage: NetworkImage("${AppUrls.image}images/files/${user?.patientImages}"),
                    ), SizedBox(width: 8.w,),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${user?.patientFirstName} ${user?.patientMiddleName} ${user?.patientLastName}", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
                          SizedBox(height: 2.h,),
                          Text("${user?.patientHnNumber}",  maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),),
                          SizedBox(height: 5.h,),
                          Wrap(
                          children: [
                            Icon(Icons.male, size: 13.h, color: const Color(0xFF8A8A8A),),
                            Text("Gender:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
                            Text("${user?.patientBirthSex?.birthSexName}", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),),
                            SizedBox(width: 8.w,),
                            Icon(Icons.bloodtype, size: 13.h, color: const Color(0xFF8A8A8A),),
                            Text("Blood:", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF8A8A8A)),),
                            Text("O+", style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A)),),
                          ],
                        )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          SizedBox(height: 30.h,),

          MyRecordListTile(title: 'Vital', iconData: Icons.heart_broken, iconColor: Colors.red, onTap: (){
            context.router.push(const VitalsRoute());
          }),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'My medical History', iconData: Icons.medical_information, ),
          SizedBox(height: 5.h,),
           MyRecordListTile(title: 'Self Medical History from Great Doc', iconData: Icons.medication_liquid_sharp, onTap: () {
            context.router.push(const SelfMedicalHistoryFGDRoute());
            // TODO: If searching is needed then uncomment this
            //  showMedicalHistoryFromGreatDocSearchView(context);
          },),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'Reason For Visit', iconData: Icons.read_more,),
          SizedBox(height: 5.h,),
          const MyRecordListTile(title: 'My Report', iconData: Icons.report, iconColor: Colors.blue,),
          SizedBox(height: 5.h,),
        ],
      ),
    );
  }
}

showMedicalHistoryFromGreatDocSearchView(BuildContext context){
  final mHFgdVM = Provider.of<MyRecordViewModel>(context, listen: false);
  mHFgdVM.getMedicalHistoryFromGreatDoc(context);
  if(mHFgdVM.isMedicalHistoryFromGreatDocLoading){

  }
  return showSearch(
      context: context,
      delegate: SearchPage<PastHistory>(
      items: mHFgdVM.medicalHistoryFromGreatDocPastList,
      searchLabel: 'Search History',
      suggestion: const Center(
      child: Text('Filter History by doctor name, date'),
  ),
  failure: const Center(
  child: Text('No history found :('),
  ),
  filter: (history) => [
  history.doctor?.drGivenName,
    history.date
  ],
  builder: (history) =>Card(
    child: Row(
      children: [
        SizedBox(width: 5.w,),
        SizedBox(
            width: 40.w,
            child: Text(mHFgdVM.getDate(history.date), maxLines: 3, overflow: TextOverflow.ellipsis,)),
        Expanded(
          child: ListTile(
              onTap: (){
                context.router.push(MedicalDocumentsRoute(history: history));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage("${AppUrls.docImage}${history.doctor?.drImages}"),
              ),
              title: Text("${history.doctor?.drGivenName}"),
              subtitle: Text("${history.description}"),
              trailing: Text(mHFgdVM.getTime(history.date))
          ),
        ),
      ],
    ),
  ),
  ),
  );
}