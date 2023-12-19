import 'dart:io';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../../model/book_appointment_model/book_appointment_model.dart';
import '../../../model/invoice_model/invoice_show_model.dart';
import '../../../model/myDoctorList/mydoctorList.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../utils/utils.dart';
import '../../../widgets/payment_user_detail.dart';
import '../../../widgets/single_invoice_row.dart';
import 'mobile.dart';

class PdfInvoiceApi {
  static Future pdf(InvoiceShowModel invoice, pdfName) async {
    print("$invoice,,,$pdfName");
    final Document pdf = Document(deflate: zlib.encode);
    print('cliked');

    pdf.addPage(MultiPage(
      build: (context) => [
        Center(child: Text("MHP")),
        SizedBox(height: 5),
        Center(child: Text("Location : House 35 East Rampura,Dhaka 1210")),
        SizedBox(height: 2),

        Center(child: Text("Tel :01681688541")),
        SizedBox(height: 2),

        Center(child: Text("Vat Reg No : 534565")),
        SizedBox(height: 2),

        Center(child: Text("Invoice")),

        //     Divider(),
        //
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           SizedBox(width: 100, child: Text("SubTotal :")),
        //           SizedBox(width: 50, child: Text(
        //               double.parse( invoice.subTotal.toString()).toStringAsFixed(2)
        //
        //              , textAlign: TextAlign.end)),
        //         ]),
        //
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           SizedBox(width: 100, child: Text("Special Discount :")),
        //           SizedBox(width: 50, child: Text(
        // double.parse( invoice.specialDiscount.toString()).toStringAsFixed(2)
        //               , textAlign: TextAlign.end)),
        //         ]),
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           SizedBox(width: 100, child: Text("Discount Amount :")),
        //           SizedBox(width: 50, child: Text(
        // double.parse( invoice.discountAmount.toString()).toStringAsFixed(2)
        //              , textAlign: TextAlign.end)),
        //         ]),
        //
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           SizedBox(width: 100, child: Text("Return Amount :")),
        //           SizedBox(width: 50, child: Text(
        // double.parse( invoice.returnAmount.toString()).toStringAsFixed(2)
        //
        // , textAlign: TextAlign.end)),
        //         ]),
        //     Divider(),
        //     Row(
        //         crossAxisAlignment: CrossAxisAlignment.end,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           SizedBox(width: 100, child: Text("Bill Total :")),
        //           SizedBox(width: 50, child: Text(totalamount(double.parse(invoice.subTotal.toString()),double.parse(invoice.specialDiscount.toString())).toStringAsFixed(2), textAlign: TextAlign.end)),
        //         ]),
        //
        Text("Provided By : Mhp"),
        SizedBox(height: 10),
        // Text("Terms & Condition"),
        // Text("১. ক্যাশ মেমো ছাড়া ওষুধ ফেরত নেওয়া হয় না ।"),
        // Text("২. বিক্রিত ওষুধ ৭ দিন পর ফেরত নেওয়া হয় না ।"),
        // Text("৩. ইনসুলিন ও বিদেশী ওষুধ ফেরত নেওয়া হয় না ।"),
        // Text("৪. বিক্রিত ওষুধ এর টাকা ফেরত দেওয়া হয় না ।"),
        // Text("৫. কাটা ছেড়া ও ফ্রিজের বিক্রিত ওষুধ ফেরত নেওয়া হয় না ।"),
        Center(
          child: Text("Technology Partner Zaimah Technologies Ltd",
              textAlign: TextAlign.center),
        ),
        SizedBox(height: 10),
        Center(
          child: Text("Thank You", textAlign: TextAlign.center),
        ),

        //    buildTotal(invoice, couponDiscount, totalPrice),
      ],
      // footer: (context) => buildFooter(invoice),
    ));
    List<int> bytes = await pdf.save();
    return saveAndLaunchFile(bytes, invoice.id.toString());
  }

  static Future pdfsingle(
      {required appointmentDate,
      required doctorId,
      required patientId,
      required amount,
      required appointmentType,
      required Datum doctor,
      required paymentMethod,
      required paymentnumber,
      required trinscationNo,
      required BookAppointmentModel appointmentList,
      D}) async {
    final Document pdf = Document(deflate: zlib.encode);
    print('cliked');

    pdf.addPage(MultiPage(
      build: (context) => [
        Center(child: Text("MHP ")),
        SizedBox(height: 5),
        Center(child: Text("Location : House 35 East Rampura,Dhaka 1210")),
        SizedBox(height: 2),

        Center(child: Text("Tel :01681688541")),
        SizedBox(height: 2),

        Center(child: Text("Vat Reg No : 534565")),
        SizedBox(height: 2),

        Center(child: Text("Invoice")),

        Column(children: [
          Row(children: [
            SizedBox(width: 100.w, child: Text("Dr Name")),
            Text(": "),
            SizedBox(
                width: 150.w, child: Text(doctor.doctors!.fullName.toString()))
          ]),
          Row(children: [
            SizedBox(width: 100.w, child: Text("Designation")),
            Text(": "),
            SizedBox(
                width: 150.w,
                child: Text(
                    doctor.doctors!.department!.departmentsName.toString())),
          ]),
          Row(children: [
            SizedBox(width: 100.w, child: Text("HospitalName")),
            Text(": "),
            SizedBox(
                width: 150.w,
                child: Text(
                  "${doctor.doctors?.usualProvider != null ? doctor.doctors?.usualProvider?.usualProviderName.toString() : ""}",
                )),
          ]),
          // Row(children: [
          //   SizedBox(width: 100.w, child: Text("Date")),
          //   Text(": "),
          //   SizedBox(
          //       width: 150.w,
          //       child: Text(
          //         appointmentDate,
          //       )),
          // ]),
        ]),

        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r))),
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Number",
                          ),
                          Text(
                            paymentnumber,
                          ),
                        ]),
                    SizedBox(
                      height: 8.h,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transaction Number",
                          ),
                          Text(
                            appointmentList.transactionNo.toString(),
                          ),
                        ]),

                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Payment Method",
                          ),
                          Text(
                            paymentMethod,
                          ),
                        ]),

                    SizedBox(
                      height: 8.h,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Invoice Number",
                          ),
                          Text(
                            appointmentList.inoviceNumber.toString(),
                          ),
                        ]),

                    SizedBox(
                      height: 3.h,
                    ), Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Appointment Type",
                          ),
                          Text(
                            appointmentType,
                          ),
                        ]),

                    SizedBox(
                      height: 3.h,
                    ),

                    // Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children:
                    //     [
                    //       Text("Invoice Number", ),
                    //       Text(appointmentList.inoviceNumber.toString(),),
                    //     ]
                    // ),
                    // SingleInvoiceRow(
                    //   lTitle: "Patient HnNumber",
                    //   rTitle:
                    //   "${userVM.user?.patientHnNumber}",
                    // ),

                    SizedBox(
                      height: 3.h,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                          ),
                          Text(
                            appointmentDate.toString(),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   child: Padding(
            //     padding: EdgeInsets.all(15.r),
            //     child: Column(
            //       children: [
            //         SingleInvoiceRow(
            //             lTitle: "Patient Name :",
            //             rTitle:
            //             "${userVM.user?.patientFirstName} ${userVM.user?.patientLastName}"),
            //         SingleInvoiceRow(
            //             lTitle: "Mobile Number :",
            //             rTitle: "${userVM.user?.patientMobilePhone}"),
            //         SingleInvoiceRow(
            //             lTitle: "Address :",
            //             rTitle: "${userVM.user?.patientAddress1}"),
            //         SingleInvoiceRow(
            //             lTitle: "Payment Method :",
            //             rTitle: "${widget.paymentMethod}"),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
        Divider(),

        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "COST",
              ),
              Text(
                "Charge",
              ),
            ],
          ),
        ),
        // SingleInvoiceRow(
        //     lTitle: "Total Charge", rTitle: widget.amount),
        // const SingleInvoiceRow(
        //     lTitle: "Discount", rTitle: "0.00"),
        // const SingleInvoiceRow(lTitle: "Due ", rTitle: "0.00"),
        // const SingleInvoiceRow(
        //     l
        //     Title: "VAT/TAX", rTitle: "0.00"),

        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Charge",
              ),
              Text(
                amount,
              ),
            ],
          ),
        ),
        Divider(),

        Text("Provided By : Online"),
        SizedBox(height: 10),
        // Text("Terms & Condition"),
        // Text("১. ক্যাশ মেমো ছাড়া ওষুধ ফেরত নেওয়া হয় না ।"),
        // Text("২. বিক্রিত ওষুধ ৭ দিন পর ফেরত নেওয়া হয় না ।"),
        // Text("৩. ইনসুলিন ও বিদেশী ওষুধ ফেরত নেওয়া হয় না ।"),
        // Text("৪. বিক্রিত ওষুধ এর টাকা ফেরত দেওয়া হয় না ।"),
        // Text("৫. কাটা ছেড়া ও ফ্রিজের বিক্রিত ওষুধ ফেরত নেওয়া হয় না ।"),
        Center(
          child: Text("Technology Partner Zaimah Technologies Ltd",
              textAlign: TextAlign.center),
        ),
        SizedBox(height: 10),
        Center(
          child: Text("Thank You", textAlign: TextAlign.center),
        ),

        //    buildTotal(invoice, couponDiscount, totalPrice),
      ],
      // footer: (context) => buildFooter(invoice),
    ));
    List<int> bytes = await pdf.save();
    return saveAndLaunchFile(bytes, appointmentList.id.toString());
  }

  static double totalamount(double total, double special) {
    return total - special;
  }

  // static Widget buildTotal(Invoice invoice, coupon, totalprice) {
  //   final netTotal = invoice.items
  //       .map((item) => item.unitPrice * item.quantity)
  //       .reduce((item1, item2) => item1 + item2);
  //   // final vatPercent = invoice.items.first.vat;
  //   // final vat = netTotal * vatPercent;
  //   // final total = netTotal + vat;
  //   return Container(
  //     alignment: Alignment.centerRight,
  //     child: Row(
  //       children: [
  //         Spacer(flex: 6),
  //         Expanded(
  //           flex: 4,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               //coupon discount
  //               buildText(
  //                 title: 'Coupon discount',
  //                 titleStyle: const TextStyle(
  //                   fontSize: 11,
  //                 ),
  //                 value: coupon.toString(),
  //                 unite: true,
  //               ),
  //               pw.SizedBox(height: 5),
  //
  //               //delivery charge
  //               totalprice >= 500
  //                   ? buildText(
  //                       title: 'Delivery charge',
  //                       titleStyle: const TextStyle(
  //                         fontSize: 11,
  //                       ),
  //                       value: '0',
  //                       unite: true,
  //                     )
  //                   : buildText(
  //                       title: 'Delivery charge',
  //                       titleStyle: const TextStyle(
  //                         fontSize: 11,
  //                       ),
  //                       value: OthersHelper().deliveryCharge.toString(),
  //                       unite: true,
  //                     ),
  //
  //               //net total
  //               pw.SizedBox(height: 5),
  //               totalprice >= 500
  //                   ? buildText(
  //                       title: 'Net total',
  //                       // value: netTotal.toStringAsFixed(0),
  //                       value: (totalprice).toStringAsFixed(0),
  //                       unite: true,
  //                     )
  //                   : buildText(
  //                       //if delivery charge is less than 500 then add delivery charge 60 tk
  //                       title: 'Net total',
  //                       // value: netTotal.toStringAsFixed(0),
  //                       value: (totalprice + OthersHelper().deliveryCharge)
  //                           .toStringAsFixed(0),
  //                       unite: true,
  //                     ),
  //               // buildText(
  //               //   title: 'Vat ${vatPercent * 100} %',
  //               //   value: Utils.formatPrice(vat),
  //               //   unite: true,
  //               // ),
  //               // Divider(),
  //
  //               SizedBox(height: 2 * PdfPageFormat.mm),
  //               // Container(height: 1, color: PdfColors.grey400),  //border
  //               // SizedBox(height: 0.5 * PdfPageFormat.mm),
  //               // Container(height: 1, color: PdfColors.grey400), //border
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // static Widget buildFooter(Invoice invoice) => Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Divider(),
  //         SizedBox(height: 2 * PdfPageFormat.mm),
  //         buildSimpleText(title: 'Address', value: invoice.supplier.address),
  //         SizedBox(height: 1 * PdfPageFormat.mm),
  //         buildSimpleText(title: 'Paypal', value: invoice.supplier.paymentInfo),
  //       ],
  //     );

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
