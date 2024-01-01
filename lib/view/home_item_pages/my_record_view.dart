import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/model/my_record_model/medical_history_from_great_doc_model.dart';
import 'package:digi_patient/model/my_record_model/procedure_mHFGD_model.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:digi_patient/routes/routes.gr.dart';
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
import '../authentications/user_detail_view.dart';
import '../my_record/my_medical_history_view.dart';
import '../my_record/my_report_view.dart';
import '../my_record/reason_for_visit_view.dart';
import '../my_record/self_medical_history_from_great_doc_view.dart';
import '../my_record/vital_view.dart';

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
    final user = Provider.of<UserViewModel>(context).user;
    final userr = Provider.of<UserViewModel>(context);
    // final vital = Provider.of<MyRecordViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,

        title: Text(
          "My Records",
          style: Style.alltext_appbar,
        ),
        // actions: [
        //   IconButton(onPressed: (){
        //        // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailView()));
        //
        //   }, icon: Icon(Icons.edit))
        // ],
      ),
      body: ListView(
        padding: EdgeInsets.all(15.r),
        children: [
          InkWell(
            onTap: () {
              if (user == null) {
                debugPrint("Reload page ");
              } else {
                //context.router.push(UserDetailRoute(user: user!));
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25.h,
                      backgroundImage: NetworkImage(
                          "${AppUrls.image}${user?.patientImages}"),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${user?.patientFirstName} ${user?.patientLastName}".toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Style.alltext_default_balck_blod,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            "${user?.patientHnNumber}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Style.alltext_default_balck,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Wrap(
                            children: [
                              Icon(
                                Icons.male,
                                size: 13.h,
                                color: const Color(0xFF8A8A8A),
                              ),
                              Text(
                                "Gender:",
                                style:Style.alltext_default_balck,
                              ),
                              Text(
                                "${user?.patientBirthSex?.birthSexName}",
                                style:Style.alltext_default_balck,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Icon(
                                Icons.bloodtype,
                                size: 13.h,
                                color: const Color(0xFF8A8A8A),
                              ),
                              Text(
                                "Blood:",
                                style:Style.alltext_default_balck,
                              ),
                              Text(
                                "${user!.bloodGroup!.bloodGroupName}",
                                style: Style.alltext_default_balck,
                              ),
                            ],
                          ), SizedBox(
                            height: 3.h,
                          ),
                          Wrap(
                            children: [
                              Icon(
                                Icons.date_range,
                                size: 13.h,
                                color: const Color(0xFF8A8A8A),
                              ),
                              Text(
                                "Dob:",
                                style:Style.alltext_default_balck,
                              ),
                              Text(
                                "${user?.patientDob.toString()}",
                                style:Style.alltext_default_balck,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          MyRecordListTile(
              title: 'Vitals',
              iconData: Icons.heart_broken,
              iconColor: Colors.red,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VitalsView()));

                //   context.router.push(const VitalsRoute());
              }),
          SizedBox(
            height: 5.h,
          ),
          MyRecordListTile(
            title: 'My Medical History',
            iconData: Icons.medical_information,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMedicalHistoryView()));
              //context.router.push(const MyMedicalHistoryRoute());
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          MyRecordListTile(
            title: 'Medical History from Great Doc',
            iconData: Icons.medication_liquid_sharp,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelfMedicalHistoryFGDView()));
             // context.router.push(const SelfMedicalHistoryFGDRoute());
              // TODO: If searching is needed then uncomment this
              //  showMedicalHistoryFromGreatDocSearchView(context);
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          MyRecordListTile(
            title: 'Reason For Visit',
            iconData: Icons.read_more,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ReasonForVisitView()));
              // context.router.push(const ReasonForVisitRoute());
            },
          ),
          SizedBox(
            height: 5.h,
          ),
           MyRecordListTile(
            title: 'My Report',
            iconData: Icons.report,
            iconColor: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyReportView()));
              // context.router.push(const ReasonForVisitRoute());
            },
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}

showMedicalHistoryFromGreatDocSearchView(BuildContext context,
    {required bool showPastHistory}) {
  final mHFgdVM = Provider.of<MyRecordViewModel>(context, listen: false);
  // mHFgdVM.getMedicalHistoryFromGreatDoc(context);
  if (mHFgdVM.isMedicalHistoryFromGreatDocLoading) {
  } else {
    if (showPastHistory) {
      return showSearch(
        context: context,
        delegate: SearchPage<PastHistory>(
          barTheme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: AppColors.primaryColor)),
          items: mHFgdVM.medicalHistoryFromGreatDocPastList,
          searchLabel: 'Search Past History',
          suggestion: const Center(
            child: Text('Filter Past History by name or date'),
          ),
          failure: const Center(
            child: Text('No history found :('),
          ),
          filter: (history) => [history.condition, history.date],
          builder: (history) => Padding(
            padding: EdgeInsets.all(4.0.r),
            child: Card(
              child: ListTile(
                  title: Text("${history.condition}"),
                  subtitle: Text(mHFgdVM.getDate(history.date)),
                  trailing: Text(mHFgdVM.getTime(history.date, context))),
            ),
          ),
        ),
      );
    } else {
      return showSearch(
        context: context,
        delegate: SearchPage<AllProcedure>(
          barTheme: ThemeData(
              appBarTheme:
                  AppBarTheme(backgroundColor: AppColors.primaryColor)),
          items: mHFgdVM.procedureList,
          searchLabel: 'Search Procedures',
          suggestion: const Center(
            child: Text('Filter Procedures by doctor name or date'),
          ),
          failure: const Center(
            child: Text('No Procedure found :('),
          ),
          filter: (procedure) => [procedure.procedureName, procedure.createdAt.toString()],
          builder: (procedure) => Padding(
            padding: EdgeInsets.all(4.0.r),
            child: Card(
              child: ListTile(
                  title: Text("${procedure.procedureName}"),
                  subtitle: Text(mHFgdVM.getDate(procedure.createdAt.toString())),
                  trailing:
                      Text(mHFgdVM.getTime(procedure.createdAt.toString(), context))),
            ),
          ),
        ),
      );
    }
  }
}
