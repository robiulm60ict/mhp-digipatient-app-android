import 'package:digi_patient/model/my_record_model/procedure_mHFGD_model.dart';
import 'package:digi_patient/view/home_item_pages/my_record_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/my_record_view_model/my_record_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/shimmer.dart';

class SelfMedicalHistoryFGDView extends StatefulWidget {
  const SelfMedicalHistoryFGDView({Key? key}) : super(key: key);

  @override
  State<SelfMedicalHistoryFGDView> createState() =>
      _SelfMedicalHistoryFGDViewState();
}

class _SelfMedicalHistoryFGDViewState extends State<SelfMedicalHistoryFGDView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyRecordViewModel>().getMedicalHistoryFromGreatDoc(context);
      context.read<MyRecordViewModel>().getProcedureFromGreatDoc(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sMhFGD = Provider.of<MyRecordViewModel>(context, listen: false);

    return Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          title: Text("My medical history from GreatDoc",
              style: Style.alltext_appbar),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                showMedicalHistoryFromGreatDocSearchView(context,
                    showPastHistory: sMhFGD.showPastHistory);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: ()async{
            context.read<MyRecordViewModel>().getMedicalHistoryFromGreatDoc(context);
            context.read<MyRecordViewModel>().getProcedureFromGreatDoc(context);
          },
          child: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Expanded(
                        child: Card(
                      elevation: sMhFGD.showPastHistory ? 5 : 0,
                      child: InkWell(
                        onTap: () {
                          sMhFGD.past();
                          setState(() {});
                        },
                        child: SizedBox(
                            height: 60.h,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: sMhFGD.showPastHistory
                                    ? AppColors.primaryColor
                                    : Colors.white,
                              )),
                              child: Center(
                                  child: Text("Past History",
                                      textAlign: TextAlign.center)),
                            )),
                      ),
                    )),
                    Expanded(
                        child: Card(
                      elevation: !sMhFGD.showPastHistory ? 5 : 0,
                      child: InkWell(
                        onTap: () {
                          setState(() {});
                          sMhFGD.procedure();
                        },
                        child: SizedBox(
                            height: 60.h,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: !sMhFGD.showPastHistory
                                    ? AppColors.primaryColor
                                    : Colors.white,
                              )),
                              child: const Center(
                                  child: Text("Procedure",
                                      textAlign: TextAlign.center)),
                            )),
                      ),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Visibility(
                  visible: sMhFGD.showPastHistory,
                  replacement:  Consumer<MyRecordViewModel>(builder: (context, data, child) {
                    if (data.procedureList.isEmpty) {
                      return data.isProcedureLoading == true
                          ? ListView.builder(
                        itemCount: 6,
                        // scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: bannerShimmereffect(
                                90.toDouble(), 385.toDouble()),
                          );
                        },
                      )
                          : noDataFounForList("Currently you have no records");
                    } else {
                      return ListView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          itemCount: sMhFGD.procedureList.length,
                          itemBuilder: (context, index) {
                            AllProcedure procedure = sMhFGD.procedureList[index];
                            final date = sMhFGD.getDate("${procedure.createdAt}");
                            final time =
                            sMhFGD.getTime("${procedure.createdAt}", context);
                            return Card(
                              child: ListTile(
                                title: Text(
                                  "${procedure.procedureName}",
                                  style: Style.alltext_default_balck,
                                ),
                                subtitle: Text(
                                  date,
                                  style: Style.alltext_default_balck,
                                ),
                                trailing: Text(
                                  time,
                                  style: Style.alltext_default_balck,
                                ),
                              ),
                            );
                          });
                    }
                  }),


                  child: Consumer<MyRecordViewModel>(builder: (context, data, child) {
                    if (data.medicalHistoryFromGreatDocPastList.isEmpty) {
                      return data.isMedicalHistoryFromGreatDocLoading == true
                          ? ListView.builder(
                        itemCount: 6,
                        // scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: bannerShimmereffect(
                                90.toDouble(), 385.toDouble()),
                          );
                        },
                      )
                          : noDataFounForList("Currently you have no records");
                    } else {
                      return ListView.builder(
                          itemCount:
                          sMhFGD.medicalHistoryFromGreatDocPastList.length,
                          padding: EdgeInsets.all(8.r),
                          itemBuilder: (context, index) {
                            final history =
                            sMhFGD.medicalHistoryFromGreatDocPastList[index];
                            final time =
                            sMhFGD.getTime("${history.date}", context);
                            final date = sMhFGD.getDate("${history.date}");
                            return Card(
                                child: ListTile(
                                  title: Text(
                                    "${history.condition}",
                                    style: Style.alltext_default_balck,
                                  ),
                                  subtitle: Text(
                                    date,
                                    style: Style.alltext_default_balck,
                                  ),
                                  trailing:
                                  Text(time, style: Style.alltext_default_balck),
                                ));
                          });
                    }
                  }),




                ),
              ),
            ],
          ),
        ));
  }
}
