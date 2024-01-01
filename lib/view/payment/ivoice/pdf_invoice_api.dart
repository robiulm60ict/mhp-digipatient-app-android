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
      required Shift,
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
        SizedBox(height: 8),

        // Center(child: Text("Invoice")),
        Center(
            child: Text("${appointmentList.appointmentType.toString()} Invoice",
                style: TextStyle(fontSize: 14))),
        SizedBox(height: 12),
        Column(children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            SizedBox(width: 100.w, child: Text("Dr Name")),
            Text(": "),
            SizedBox(
                width: 150.w,
                child: Text(
                    "${doctor.doctors!.title!.titleName.toString()} ${doctor.doctors!.fullName.toString()}"))
          ]),
          SizedBox(height: 2),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            SizedBox(width: 100.w, child: Text("Designation")),
            Text(": "),
            SizedBox(
                width: 150.w,
                child: Text(
                    doctor.doctors!.department!.departmentsName.toString())),
          ]),
          SizedBox(height: 2),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 100.w, child: Text("HospitalName")),
                Text(": "),
                SizedBox(
                    width: 150.w,
                    child: Text(
                      "${doctor.doctors?.usualProvider != null ? doctor.doctors?.usualProvider?.usualProviderName.toString() : ""}",
                    )),
              ]),
          SizedBox(height: 2),
        ]),

        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.r),
                      topRight: Radius.circular(5.r))),
              child: Padding(
                padding: EdgeInsets.all(0.r),
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
                            "Invoice Number",
                          ),
                          Text(
                            appointmentList.inoviceNumber.toString(),
                          ),
                        ]),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Date",
                          ),
                          Text(
                            appointmentDate.toString().split(" ").first,
                          ),
                        ]),
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
                            "Appointment Shift",
                          ),
                          Text(
                            Shift,
                          ),
                        ]),
                    SizedBox(
                      height: 8.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        pw.Table.fromTextArray(
          context: context,
          cellAlignment: Alignment.center,
          data: <List<String>>[
            <String>['SL', 'Description ', 'Amount'],
            <String>['1', ' Consultancy Fees', ' $amount'],
          ],
        ),
        // Container(
        //   //   height: 40.h,
        //   padding: EdgeInsets.symmetric(horizontal: 10.w),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "Consultancy Fees",
        //       ),
        //       Text(
        //         amount,
        //       ),
        //     ],
        //   ),
        // ),
        // Divider(),
        Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(""),
              Text(
                "Total Fees",
              ),
              Text(
                "              $amount",

              ),
            ],
          ),
        ),
        Divider(),

        //  Text("Provided By : Online"),
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
