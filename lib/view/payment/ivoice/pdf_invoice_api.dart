import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../../../model/myDoctorList/mydoctorList.dart';
import '../../../model/my_medicine_model/prescription_greatdoc.dart';
import 'mobile.dart';

class PdfInvoiceApi {
  static Future pdf(pdfName, PrescriptionListGreatDoc doc, context) async {
    print(",,,$pdfName");
    final Document pdf = Document();
    print('cliked');

    // Load the Bengali font
    // Uint8List fontData = await File('assets/fonts/kalpurush.ttf').readAsBytes();
    // var data = fontData.buffer.asByteData();
    // var ttf = Font.ttf(data);

    final fontData = await rootBundle.load("assets/fonts/kalpurush.ttf");
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());
    final Uint8List imageData =
        (await rootBundle.load("assets/images/rx (2).png"))
            .buffer
            .asUint8List();

    // final utf8Bytes = utf8.encode(
    //     "দিন পর GreatDoc অ্যাপ এ ফলোআপ / চেম্বারে ব্যাবস্থাপ্ত্র সহ সরাসরি আসবেন");
    // final utf8String = utf8.decode(utf8Bytes);
    var advice = doc.advice.toString();

    List<String> characters = advice.split(',');
    List<String> reason_for_visit = doc.reasonForVisit.toString().split(',');
    List<String> investigation = doc.investigation.toString().split(',');
    List<String> reason = [];
    for (var i in reason_for_visit) {
      reason.add(i);
    }

    print(reason);
    Map<String, int> calculateAge(String birthDateString) {
      final now = DateTime.now();
      final birthDate = DateFormat('yyyy-MM-dd').parse(birthDateString);

      int years = now.year - birthDate.year;
      int months = now.month - birthDate.month;
      int days = now.day - birthDate.day;

      if (months < 0 || (months == 0 && days < 0)) {
        years--;
        months += 12;
      }

      if (days < 0) {
        final previousMonthDate =
            DateTime(now.year, now.month - 1, birthDate.day);
        days = now.difference(previousMonthDate).inDays;
      }

      return {'years': years, 'months': months, 'days': days};
    }

    final age = calculateAge(
        doc.patient!.patientDob.toString().split(" ").first.toString());


    pdf.addPage(pw.MultiPage(
      build: (context) => [

        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  width: 230.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        pw.Text(
                            "${doc.doctor!.title!.titleName.toString()} ${doc.doctor!.fullName!.toString()}",
                            style: pw.TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        pw.SizedBox(height: 2.h),
                        doc!.doctor!.academic!.isNotEmpty
                            ? Row(
                                children: List.generate(
                                    doc!.doctor!.academic!.length, (index) {
                                var data = doc!.doctor!.academic![index];
                                return Center(
                                  //  width: Get.size.width*0.26,
                                  child: Text(
                                    "${data.degreeId}${doc!.doctor!.academic!.last == data ? "" : ", "}",
                                    maxLines: 3,
                                  ),
                                );
                              }))
                            : Container(),
                        pw.SizedBox(height: 2.h),
                        pw.Text(
                          doc.doctor!.specialist!.specialistsName.toString(),
                        ),
                        pw.SizedBox(height: 2.h),
                        // pw.Text(
                        //   doc!.doctor!.workExperience!.last.company.toString(),
                        // ),
                        pw.SizedBox(height: 2.h),
                        pw.Text(
                          "BMDC Reg No: ${doc.doctor!.drBmdcRegNo.toString() != "null" ? doc.doctor!.drBmdcRegNo.toString() : ""}",
                        ),
                      ])),
              SizedBox(
                  width: 230.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        pw.SizedBox(
                          child: pw.Text(
                              "${doc.doctor!.usualProvider!.usualProviderName.toString()}",
                              style: pw.TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                        pw.SizedBox(height: 2.h),
                        pw.Text(
                          "${doc.doctor!.drAddressLine1?.toString()}",
                        ),
                        pw.SizedBox(height: 2.h),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: pw.Text(
                                  "Serial Number: ",
                                ),
                              ),
                              Column(children: [
                                pw.Text(
                                  "${doc.doctor!.usualProvider!.mobile.toString()}",
                                ),
                                pw.SizedBox(height: 2.h),
                                pw.Text(
                                  "${doc.doctor!.usualProvider!.phone.toString()}",
                                ),
                              ])
                            ]),
                      ])),
            ]),
        Divider(),
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Text("Patient Name: "),
                Text(doc.patient!.fullName.toString()),
              ]),
              Row(children: [
                Text("Gender : "),
                Text(doc.patient!.patientBirthSex!.birthSexName.toString()),
              ]),
              Row(children: [
                Text("Age : "),
                Text('${age['years']} Y ${age['months']} M ${age['days']} D'),
              ]),
              Text("Weight: N/A"),
            ]),
        Divider(),
        Row(children: [
          Container(
              width: 150.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Chief Complaints:",
                      style: pw.TextStyle(font: ttf, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    for (var i = 0; i < reason.length; i++)
                      reason[i].trim() != "null"
                          ? pw.Text(
                              '${i + 1}. ${reason[i].trim()}',
                              style: pw.TextStyle(font: ttf, fontSize: 12),
                            )
                          : pw.Text(""),
                    SizedBox(height: 50),
                    pw.Text(
                      "Investigation:",
                      style: pw.TextStyle(font: ttf, fontSize: 14),
                    ),
                    SizedBox(height: 10),
                    for (var i = 0; i < investigation.length; i++)
                      investigation[i].trim() != "null"
                          ? pw.Text(
                              '${i + 1}. ${investigation[i].trim()}',
                              style: pw.TextStyle(font: ttf, fontSize: 12),
                            )
                          : pw.Text(""),
                  ])),
          Container(
            width: 250.w,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  pw.SizedBox(
                    width: 25.w,
                    height: 25.h,
                    child: pw.Image(pw.MemoryImage(imageData)),
                  ),
                  SizedBox(height: 10),
                  pw.Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: ListView.builder(
                      itemCount: doc.details!.length,
                      itemBuilder: (context, index) {
                        var details = doc.details![index];
                        return Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                              pw.Text(
                                "${index + 1}. ${details.rx!.drugGenericName.toString()}",
                                style: pw.TextStyle(font: ttf, fontSize: 14),
                              ),
                              pw.SizedBox(height: 5.h),
                              pw.Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: pw.Text(
                                  " ${details.rx!.drugName.toString()}",
                                  style: pw.TextStyle(font: ttf, fontSize: 12),
                                ),
                              ),
                              pw.SizedBox(height: 5.h),
                              pw.Padding(
                                padding: EdgeInsets.only(left: 12),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      pw.Text(
                                        "${details.rx!.frequency.toString()}  ${details.rx!.route.toString()}  ${details.rx!.food.toString()}",
                                        style: pw.TextStyle(
                                            font: ttf, fontSize: 12),
                                      ),
                                      pw.Text(
                                          " ${details.rx!.quantity.toString()}"),
                                    ]),
                              ),
                              pw.SizedBox(height: 5.h),
                            ]));
                      },
                    ),
                  ),
                  SizedBox(height: 40),
                  pw.Text(
                    "Advices:",
                    style: pw.TextStyle(font: ttf, fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  for (var i = 0; i < characters.length; i++)
                    characters[i].trim() != "null"
                        ? pw.Text(
                            '${i + 1}. ${characters[i].trim()}',
                            style: pw.TextStyle(font: ttf, fontSize: 12),
                          )
                        : pw.Text(""),
                ]),
          ),
        ]),
        pw.SizedBox(child: Divider(color: PdfColors.grey), width: 100),
        pw.Text(
          "${doc.doctor!.title!.titleName.toString()} ${doc.doctor!.fullName.toString()}",
          style: pw.TextStyle(font: ttf, fontSize: 14),
        ),
        Divider(),
        pw.Text(

            ".......... দিন পর GreatDoc অ্যাপ এ ফলোআপ / চেম্বারে ব্যাবস্থাপ্ত্র সহ সরাসরি আসবেন",

          style: pw.TextStyle(font: ttf, fontSize: 16),
        )
      ],
    ));

    List<int>   bytes = await pdf.save();
    return saveAndLaunchFile(bytes, "${doc.doctor!.fullName} prescription.pdf");
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
      required invoice,
      D}) async {
    final Document pdf = Document(deflate: zlib.encode);
    print('cliked');

    pdf.addPage(MultiPage(
      build: (context) => [
        Center(
            child: Text("Invoice Print Copy ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        SizedBox(height: 5),
        // Center(child: Text("Location : House 35 East Rampura,Dhaka 1210")),
        // SizedBox(height: 2),
        //
        // Center(child: Text("Tel :01681688541")),
        // SizedBox(height: 2),
        //
        // Center(child: Text("Vat Reg No : 534565")),
        // SizedBox(height: 8),

        // Center(child: Text("Invoice")),
        Center(
            child: Text("${invoice} Invoice Number",
                style: TextStyle(fontSize: 12))),
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
                    child: Text(doctor.doctors!.department!.departmentsName
                        .toString())),
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
                      height: 4.h,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 100.w, child: Text("Invoice Number")),
                          Text(": "),
                          SizedBox(
                              width: 150.w,
                              child: Text(
                                invoice.toString(),
                              )),
                        ]),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 100.w, child: Text("Date")),
                          Text(": "),
                          SizedBox(
                              width: 150.w,
                              child: Text(
                                DateFormat("dd-MM-yyyy").format(
                                    DateTime.parse(appointmentDate.toString())),
                              )),
                        ]),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                "Payment Number",
                              )),
                          Text(": "),
                          SizedBox(width: 150.w, child: Text(paymentnumber)),
                        ]),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                "Payment Method",
                              )),
                          Text(": "),
                          SizedBox(width: 150.w, child: Text(paymentMethod)),
                        ]),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 100.w,
                              child: Text(
                                "Appointment Shift",
                              )),
                          Text(": "),
                          SizedBox(width: 150.w, child: Text(Shift)),
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
        // Center(
        //   child: Text("Technology Partner Zaimah Technologies Ltd",
        //       textAlign: TextAlign.center),
        // ),
        SizedBox(height: 10),
        Center(
          child: Text("Thank You", textAlign: TextAlign.center),
        ),

        //    buildTotal(invoice, couponDiscount, totalPrice),
      ],
      // footer: (context) => buildFooter(invoice),
    ));
    List<int> bytes = await pdf.save();
    return saveAndLaunchFile(bytes, invoice.toString());
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
