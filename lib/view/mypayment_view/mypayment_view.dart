import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import '../../generated/assets.dart';
import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../view_model/mypayment/my_payment_view.dart';
import '../../widgets/shimmer.dart';

class MyPatientView extends StatefulWidget {
  const MyPatientView({super.key});

  @override
  State<MyPatientView> createState() => _MyPatientViewState();
}

class _MyPatientViewState extends State<MyPatientView> {
  @override
  void initState() {
    print("initstate");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MyPaymentViewModel>().getmypayment(context);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    final myRecord = Provider.of<MyPaymentViewModel>(context, listen: false);

    return SafeArea(
        child: RefreshIndicator(
      onRefresh: () async {
        myRecord.getmypayment(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          //automaticallyImplyLeading: false,

          centerTitle: true,
          title: Text(
            "My Payment",
            style: Style.alltext_default_white,
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 10),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<MyPaymentViewModel>(builder: (context, data, child) {
                  if (data.mypayment.isEmpty) {
                    return data.isDoctorLoading == true
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
                          )
                        : noDataFounForList("No Payment History");
                  } else {
                    return Column(
                      children: [
                        ListView.builder(
                            itemCount: data.mypayment.length,
                            scrollDirection: Axis.vertical,
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var item = data.mypayment[index];
                              return Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Card(
                                  elevation: 2,
                                  color: Colors.white,
                                  //shadowColor: Colors.black,
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 75.h,
                                            width: 70.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child:
                                                  item.doctor!.drImages != null
                                                      ? Image.network(
                                                          "${AppUrls.drprofile}${item.doctor!.drImages.toString()}",
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image.asset(
                                                          Assets.nodatafound),
                                            ),
                                          ),
                                          Style.widthdistan_size2,
                                          SizedBox(
                                            width: 210.w,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "${item.doctor!.fullName ?? ""}",
                                                    style: Style
                                                        .alltext_default_balck_blod),
                                                Style.distan_size2,

                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 70.w,
                                                      child: Text(
                                                        "Amount",
                                                        style: Style
                                                            .alltext_default_balck,
                                                      ),
                                                    ),
                                                    Text(": "),
                                                    SizedBox(
                                                      width: 130.w,
                                                      child: Text(
                                                          item.amount
                                                              .toString(),
                                                          style: Style
                                                              .alltext_default_balck),
                                                    ),
                                                  ],
                                                ),
                                                Style.distan_size2,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 70.w,
                                                      child: Text(
                                                        "Type ",
                                                        style: Style
                                                            .alltext_default_balck,
                                                      ),
                                                    ),
                                                    Text(": "),
                                                    SizedBox(
                                                      width: 130.w,
                                                      child: Text(
                                                          item.paymentType
                                                              .toString(),
                                                          style: Style
                                                              .alltext_default_balck),
                                                    ),
                                                  ],
                                                ),
                                                Style.distan_size2,
                                                item.paymentMethod.toString() !=
                                                        null
                                                    ? Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 70.w,
                                                            child: Text(
                                                              "Pay Method ",
                                                              style: Style
                                                                  .alltext_default_balck,
                                                            ),
                                                          ),
                                                          Text(": "),
                                                          SizedBox(
                                                            width: 130.w,
                                                            child: Text(
                                                                item.paymentMethod
                                                                    .toString(),
                                                                style: Style
                                                                    .alltext_default_balck),
                                                          ),
                                                        ],
                                                      )
                                                    : Container(),
                                                Style.distan_size2,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 70.w,
                                                      child: Text(
                                                        "Time",
                                                        style: Style
                                                            .alltext_default_balck,
                                                      ),
                                                    ),
                                                    Text(": "),
                                                    SizedBox(
                                                      width: 120.w,
                                                      child: Text(
                                                          "${DateFormat("hh:mm a").format(DateTime.parse(item.date.toString()))}",
                                                          style: Style
                                                              .alltext_default_balck),
                                                    ),
                                                  ],
                                                ),
                                                Style.distan_size2,
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 70.w,
                                                      child: Text(
                                                        "Date",
                                                        style: Style
                                                            .alltext_default_balck,
                                                      ),
                                                    ),
                                                    Text(": "),
                                                    SizedBox(
                                                      width: 120.w,
                                                      child: Text(
                                                          "${DateFormat("dd-MM-yyyy").format(DateTime.parse("${item.date.toString()}"))}",
                                                          style: Style
                                                              .alltext_default_balck),
                                                    ),
                                                  ],
                                                ),
                                                Style.distan_size2,
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
