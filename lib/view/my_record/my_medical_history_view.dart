import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../view_model/my_record_view_model/my_record_view_model.dart';
import '../../widgets/back_button.dart';

class MyMedicalHistoryView extends StatefulWidget {
  const MyMedicalHistoryView({Key? key}) : super(key: key);

  @override
  State<MyMedicalHistoryView> createState() => _MyMedicalHistoryViewState();
}

class _MyMedicalHistoryViewState extends State<MyMedicalHistoryView> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      getMedicalHistory();
    });

  }

  getMedicalHistory(){
    context.read<MyRecordViewModel>().getMedicalHistoryFromGreatDoc(context);
  }

  @override
  Widget build(BuildContext context) {
    final sMhFGD = Provider.of<MyRecordViewModel>(context);

    return  RefreshIndicator(
      onRefresh: () async{
        getMedicalHistory();
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          title: Text("My Medical History", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
context.router.push(const AddMedicalHistoryRoute());
        }, child: const Icon(Icons.add, color: Colors.white,)),
        body: sMhFGD.isMedicalHistoryFromGreatDocLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
            itemCount: sMhFGD.medicalHistoryFromGreatDocPastList.length,
            padding: EdgeInsets.all(8.r),
            itemBuilder: (context, index) {
              final history = sMhFGD.medicalHistoryFromGreatDocPastList[index];
              final time = sMhFGD.getTime("${history.date}", context);
              final date = sMhFGD.getDate("${history.date}");
              return Card(
                child: ListTile(

                    title: Text("${history.condition}"),
                    subtitle: Text(date),
                    trailing: Text(time)
                ),
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
            }),
      ),
    );
  }
}

