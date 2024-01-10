import 'package:digi_patient/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/my_record_view_model/my_record_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';
import 'add_medical_history_view.dart';

class MyMedicalHistoryView extends StatefulWidget {
  const MyMedicalHistoryView({Key? key}) : super(key: key);

  @override
  State<MyMedicalHistoryView> createState() => _MyMedicalHistoryViewState();
}

class _MyMedicalHistoryViewState extends State<MyMedicalHistoryView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getMedicalHistory();
    });
  }

  getMedicalHistory() {
    context.read<MyRecordViewModel>().getMedicalHistoryFromGreatDoc(context);
  }

  @override
  Widget build(BuildContext context) {
    final sMhFGD = Provider.of<MyRecordViewModel>(context,listen: false);

    return RefreshIndicator(
      onRefresh: () async {
        getMedicalHistory();
      },
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,

          title: Text(
            "My Medical History",
            style: Style.alltext_appbar
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddMedicalHistoryView()));

              //  context.router.push(const AddMedicalHistoryRoute());
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: Consumer<MyRecordViewModel>(builder: (context, data, child) {
          if (data.medicalHistoryFromGreatDocPastList.isEmpty) {
            return data.isMedicalHistoryFromGreatDocLoading == true
                ? ListView.builder(
              itemCount: 6,
              // scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: bannerShimmereffect(
                      90.toDouble(), 385.toDouble()),
                );
              },
            )
                : noDataFounForList("No Medical History");
          } else {
            return ListView.builder(
                itemCount: sMhFGD.medicalHistoryFromGreatDocPastList.length,
                padding: EdgeInsets.all(8.r),
                itemBuilder: (context, index) {
                  final history =
                  sMhFGD.medicalHistoryFromGreatDocPastList[index];
                  final time = sMhFGD.getTime("${history.date}", context);
                  final date = sMhFGD.getDate("${history.date}");
                  return Card(
                    child: ListTile(
                        title: Text("${history.condition}",style: Style.alltext_default_balck_blod,),
                        subtitle: Text(date,style: Style.alltext_default_balck,),
                        trailing: Text(time,style: Style.alltext_default_balck,)),
                    // child: Row(
                    //   children: [
                    //     SizedBox(width: 5.w,),
                    //     SizedBox(
                    //         width: 40.w,
                    //         child: Text(date, maxLines: 3, overflow: TextOverflow.ellipsis,)),
                    //     Expanded(
                    //       child: ListTile(
                    //           onTap: (){
                    //             // context.router.push(MedicalDocumentsRoute(history: history));
                    //           },
                    //           // leading: CircleAvatar(
                    //           //   backgroundImage: NetworkImage("${AppUrls.docImage}${history.doctor?.drImages}"),
                    //           // ),
                    //           title: Text("${history.condition}"),
                    //           subtitle: Text("${history.description}"),
                    //           trailing: Text(time)
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  );
                });
          }
        }),

        // sMhFGD.medicalHistoryFromGreatDocPastList.isEmpty
        //     ?
        // sMhFGD.isMedicalHistoryFromGreatDocLoading
        //     ?
        // Center(
        //   child: ListView.builder(
        //     itemCount: 4,
        //     scrollDirection: Axis.vertical,
        //     physics: const ScrollPhysics(),
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: bannerShimmereffect(
        //             94.toDouble(), 385.toDouble()),
        //       );
        //     },
        //   ),
        // )
        //     : noDataFounForList("No Medical History")
        //     : ListView.builder(
        //         itemCount: sMhFGD.medicalHistoryFromGreatDocPastList.length,
        //         padding: EdgeInsets.all(8.r),
        //         itemBuilder: (context, index) {
        //           final history =
        //               sMhFGD.medicalHistoryFromGreatDocPastList[index];
        //           final time = sMhFGD.getTime("${history.date}", context);
        //           final date = sMhFGD.getDate("${history.date}");
        //           return Card(
        //             child: ListTile(
        //                 title: Text("${history.condition}",style: Style.alltext_default_balck_blod,),
        //                 subtitle: Text(date,style: Style.alltext_default_balck,),
        //                 trailing: Text(time,style: Style.alltext_default_balck,)),
        //             // child: Row(
        //             //   children: [
        //             //     SizedBox(width: 5.w,),
        //             //     SizedBox(
        //             //         width: 40.w,
        //             //         child: Text(date, maxLines: 3, overflow: TextOverflow.ellipsis,)),
        //             //     Expanded(
        //             //       child: ListTile(
        //             //           onTap: (){
        //             //             // context.router.push(MedicalDocumentsRoute(history: history));
        //             //           },
        //             //           // leading: CircleAvatar(
        //             //           //   backgroundImage: NetworkImage("${AppUrls.docImage}${history.doctor?.drImages}"),
        //             //           // ),
        //             //           title: Text("${history.condition}"),
        //             //           subtitle: Text("${history.description}"),
        //             //           trailing: Text(time)
        //             //       ),
        //             //     ),
        //             //   ],
        //             // ),
        //           );
        //         }),
      ),
    );
  }
}
