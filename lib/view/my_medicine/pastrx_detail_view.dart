import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../resources/colors.dart';
import '../../../widgets/back_button.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/my_medicine_view_model/my_medicine_view_model.dart';
import '../../widgets/shimmer.dart';

class PastRXDetailView extends StatefulWidget {
  const PastRXDetailView(
      {Key? key,
      required this.title,
     })
      : super(key: key);
  final String title;

  @override
  State<PastRXDetailView> createState() => _RXDetailViewState();
}

class _RXDetailViewState extends State<PastRXDetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getRx();
    });
  }

  getRx() {

      context.read<MyMedicineViewModel>().getPastRx(context);

  }

  @override
  Widget build(BuildContext context) {
    final mmVm = Provider.of<MyMedicineViewModel>(context,listen: false);
    return RefreshIndicator(

      onRefresh: () async{
        context.read<MyMedicineViewModel>().getPastRx(context);

      },
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          leading: const CustomBackButton(),
          leadingWidth: leadingWidth,
          title: Text(
            widget.title,
            style: Style.alltext_appbar,
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Consumer<MyMedicineViewModel>(builder: (context, data, child) {
            if (data.pastRxList.isEmpty) {
              return data.isPastRxLoading == true
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
                  : noDataFounForList("Currently you have no records");
            } else {
              return   ListView.builder(
                  padding: EdgeInsets.all(15.r),
                  itemCount: mmVm.pastRxList.length,
                  itemBuilder: (context, index) {
                    final drugs = mmVm.pastRxList[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15.0.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Medicine ${index + 1}",
                                style:Style.alltext_default_balck_blod,
                              )),
                          Card(
                            color: Colors.white,
                            child: Table(
                              border: TableBorder.all(color: Colors.grey),
                              children: [
                                TableRow(children: [
                                  IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                "Drugs Name",
                                                style: Style.alltext_default_balck,
                                              )),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "${drugs.drugName}",
                                                style:Style.alltext_default_balck,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                "Dose",
                                                style: Style.alltext_default_balck,
                                              )),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "${drugs.dose}",
                                                style:Style.alltext_default_balck,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                "Frequency",
                                                style: Style.alltext_default_balck,
                                              )),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "${drugs.frequency}",
                                                style: Style.alltext_default_balck,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                "Food",
                                                style: Style.alltext_default_balck,
                                              )),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "${drugs.food}",
                                                style: Style.alltext_default_balck,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                TableRow(children: [
                                  IntrinsicHeight(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                                "Quantity",
                                                style: Style.alltext_default_balck,
                                              )),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const VerticalDivider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                "${drugs.quantity}",
                                                style:Style.alltext_default_balck,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                                //TODO: Add the trade name here
                                // TableRow(children: [
                                //   IntrinsicHeight(
                                //     child: Padding(
                                //       padding: const EdgeInsets.all(8.0),
                                //       child: Row(
                                //         children: [
                                //           Expanded(
                                //               child: Text(
                                //             "Trade Name",
                                //             style: TextStyle(
                                //                 fontSize: 12.sp,
                                //                 color: const Color(0xFF8A8A8A)),
                                //           )),
                                //           SizedBox(
                                //             width: 5.w,
                                //           ),
                                //           const VerticalDivider(
                                //             color: Colors.grey,
                                //           ),
                                //           SizedBox(
                                //             width: 5.w,
                                //           ),
                                //           Expanded(
                                //               flex: 3,
                                //               child: Text(
                                //                 "${drugs.}",
                                //                 style: TextStyle(
                                //                     fontSize: 12.sp,
                                //                     color: Color(0xFF3D3D3D)),
                                //               )),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ]),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            }
          }),
        ),



      ),
    );
  }
}
