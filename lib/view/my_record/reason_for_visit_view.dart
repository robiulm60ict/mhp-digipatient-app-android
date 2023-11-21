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
    final myRecord = Provider.of<MyRecordViewModel>(context);
    return Scaffold(
      backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          title: Text(
              "Reason For Visit",
              style: Style.alltext_appbar
          ),
          centerTitle: true,
        ),
        body:
        myRecord.reasonForVisitList.isEmpty
            ? myRecord.isReasonForVisitLoading
            ? Center(
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.vertical,
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: bannerShimmereffect(
                    94.toDouble(), 385.toDouble()),
              );
            },
          ),
        ):   noDataFounForList("No History")
            : ListView.builder(
            itemCount: myRecord.reasonForVisitList.length,
            padding: EdgeInsets.all(20.r),
            itemBuilder: (context, index) {
              AllReason reason = myRecord.reasonForVisitList[index];
              return Card(
                child: ListTile(
                  title: Text(
                      "${reason.resonName}",
                      style: Style.alltext_default_balck_blod
                  ),
                  subtitle: Text(
                      "${reason.resonForName}",
                      style: Style.alltext_default_balck
                  ),
                  trailing: Text(myRecord.getDate(reason.date.toString()),
                    style: Style.alltext_default_balck,),
                ),
              );
            }));
  }
}
