import 'package:digi_patient/model/my_record_model/reason_for_visit_model.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';

class ReasonForVisitView extends StatefulWidget {
  const ReasonForVisitView({Key? key}) : super(key: key);

  @override
  State<ReasonForVisitView> createState() => _ReasonForVisitViewState();
}

class _ReasonForVisitViewState extends State<ReasonForVisitView> {
  @override
  void initState() {
    super.initState();
    context.read<MyRecordViewModel>().getReasonForVisit(context);
  }

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.page_background_color,
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,

        title: Text("Reason For Visit", style: Style.alltext_appbar),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Consumer<MyRecordViewModel>(builder: (context, data, child) {
          if (data.reasonForVisitList.isEmpty) {
            return data.isReasonForVisitLoading == true
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
                : noDataFounForList("No History");
          } else {
            return ListView.builder(
                itemCount: data.reasonForVisitList.length,
                padding: EdgeInsets.all(20.r),
                itemBuilder: (context, index) {
                  var reason = data.reasonForVisitList[index];
                  return Card(
                    child: ListTile(
                      title: Text("${reason.resonName}",
                          style: Style.alltext_default_balck_blod),
                      subtitle: Text("${reason.resonForName}",
                          style: Style.alltext_default_balck),
                      trailing: Text(
                        myRecord.getDate(reason.date.toString()),
                        style: Style.alltext_default_balck,
                      ),
                    ),
                  );
                });
          }
        }),
      ),

    );
  }
}
