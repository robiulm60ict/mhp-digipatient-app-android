import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/view/home_item_pages/my_record_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../view_model/my_record_view_model/my_record_view_model.dart';
import '../../widgets/back_button.dart';

class SelfMedicalHistoryFGDView extends StatefulWidget {
  const SelfMedicalHistoryFGDView({Key? key}) : super(key: key);

  @override
  State<SelfMedicalHistoryFGDView> createState() => _SelfMedicalHistoryFGDViewState();
}

class _SelfMedicalHistoryFGDViewState extends State<SelfMedicalHistoryFGDView> {
  @override
  void initState() {
    super.initState();
    context.read<MyRecordViewModel>().getMedicalHistoryFromGreatDoc(context);
  }
  @override
  Widget build(BuildContext context) {
    final sMhFGD = Provider.of<MyRecordViewModel>(context);

    return  Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("Self Medical History From Great Doc", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            showMedicalHistoryFromGreatDocSearchView(context);
          }, icon: const Icon(Icons.search, color: Colors.black,),),
        ],
      ),
      body: sMhFGD.isMedicalHistoryFromGreatDocLoading ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: sMhFGD.medicalHistoryFromGreatDocPastList.length,
        padding: EdgeInsets.all(8.r),
        itemBuilder: (context, index) {
          final history = sMhFGD.medicalHistoryFromGreatDocPastList[index];
          final time = sMhFGD.getTime("${history.date}");
          final date = sMhFGD.getDate("${history.date}");
          return Card(
            child: Row(
              children: [
                SizedBox(width: 5.w,),
                SizedBox(
                    width: 40.w,
                    child: Text("${date}", maxLines: 3, overflow: TextOverflow.ellipsis,)),
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
                    trailing: Text("${time}")
                  ),
                ),
              ],
            ),
          );
        })
    );
  }
}
