import 'dart:convert';

import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../generated/assets.dart';
import '../../model/invoice_model/invoice_show_model.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/appointment_view_model/appointment_view_model.dart';
import '../../widgets/back_button.dart';
import 'ivoice/pdf_invoice_api.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  List<InvoiceShowModel> invoiceList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppointmentViewModel>().getInvoiceList(context);
    });
  }

  String getDate(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return "${dateObject.day}-${dateObject.month}-${dateObject.year}";
    } else {
      return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<AppointmentViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        centerTitle: true,
        title: Text(
          "Invoice and Payments",
          style: Style.alltext_appbar,
        ),
      ),
      body: invoice.isInvoiceLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: EdgeInsets.all(20.r),
              itemCount: invoice.invoiceList.length,
              itemBuilder: (context, index) {
                final item = invoice.invoiceList[index];
                return InkWell(
                    onTap: () async {
                      // await PdfInvoiceApi.pdf(
                      //   item,
                      //   "1-invoice",
                      // );
                    },
                    child: Padding(
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 75.h,
                                  width: 70.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: item.doctors!.drImages != null
                                        ? Image.network(
                                            "${AppUrls.drprofile}${item.doctors!.drImages.toString()}",
                                            fit: BoxFit.fill,
                                          )
                                        : Image.asset(Assets.dummy_image),
                                  ),
                                ),
                                Style.widthdistan_size2,
                                SizedBox(
                                  width: 210.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("${item.doctors!.fullName ?? ""}",
                                          style:
                                              Style.alltext_default_balck_blod),
                                      Style.distan_size2,
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 70.w,
                                            child: Text(
                                              "Amount",
                                              style:
                                                  Style.alltext_default_balck,
                                            ),
                                          ),
                                          Text(": "),
                                          SizedBox(
                                            width: 130.w,
                                            child: Text(item.amount.toString(),
                                                style: Style
                                                    .alltext_default_balck),
                                          ),
                                        ],
                                      ),
                                      Style.distan_size2,
                                      Style.distan_size2,
                                      item.paymentType.toString() != null
                                          ? Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
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
                                                      item.paymentType
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
                                              style:
                                                  Style.alltext_default_balck,
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
                                              style:
                                                  Style.alltext_default_balck,
                                            ),
                                          ),
                                          Text(": "),
                                          SizedBox(
                                            width: 120.w,
                                            child: Text(
                                                DateFormat("dd-MM-yyyy").format(
                                                    DateTime.parse(
                                                        item.date.toString())),
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
                    ));
              },
            ),
      // body: FutureBuilder(
      //   future: getInvoiceList(),
      //   builder: (context, snapshot) {
      //     if(snapshot.hasData){
      //       return ListView.builder(
      //               padding: EdgeInsets.all(20.r),
      //               itemCount: invoiceList.length,
      //               itemBuilder: (context, index) {
      //                 final iv = invoiceList[index];
      //                 return Card(
      //                   child: ListTile(
      //                     title: Text("${iv.amount}",),
      //                     subtitle: Text(getDate(iv.date.toString())),
      //                     trailing: Text("${iv.paymentType}"),
      //                   ),
      //                 );
      //               },);
      //     }else{
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),
    );
  }
}
