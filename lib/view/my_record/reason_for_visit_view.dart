import 'package:digi_patient/model/my_record_model/reason_for_visit_model.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

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
        appBar: AppBar(
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          title: Text(
            "Reason For Visit",
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor),
          ),
          centerTitle: true,
        ),
        body: myRecord.isReasonForVisitLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: myRecord.reasonForVisitList.length,
                padding: EdgeInsets.all(20.r),
                itemBuilder: (context, index) {
                  AllReasons reason = myRecord.reasonForVisitList[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        "${reason.resonName}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "${reason.resonForName}",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      trailing: Text(myRecord.getDate(reason.date)),
                    ),
                  );
                }));
  }
}
