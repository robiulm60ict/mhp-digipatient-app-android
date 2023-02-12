
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';


class Pdf {

  // Future<Uint8List> generateTablePdf({pw.PageOrientation pageOrientation = pw.PageOrientation.portrait, PdfPageFormat pdfPageFormat = PdfPageFormat.a4}) async{
  //
  //   //TODO: Add fonts here
  //   // final font = await rootBundle.load(Assets.fontsRobotoRegular);
  //   // final ttf = Font.ttf(font);
  //   pw.TextStyle textStyle = pw.TextStyle(font: ttf,  fontSize: 10.sp,);
  //   final image = pw.Image(
  //     await imageFromAssetBundle(Assets.imagesLogo),
  //     fit: pw.BoxFit.fill,
  //     width: 90,
  //     height: 50,
  //   );
  //   List<pw.Widget> widgets = [];
  //   widgets.add(
  //       pw.Container(
  //         alignment: pw.Alignment.center,
  //               padding: pw.EdgeInsets.symmetric(horizontal: 10.w),
  //               child: image
  //             ),
  //     // pw.Row(
  //     //   mainAxisAlignment: pw.MainAxisAlignment.center,
  //     //   children: [
  //     //     pw.Center(child: pw.Text("D-Legal", style: pw.TextStyle(fontSize: 15.sp, ))),
  //     //     pw.Container(
  //     //       padding: pw.EdgeInsets.symmetric(horizontal: 10.w),
  //     //       child: image
  //     //     ),
  //     //   ]
  //     // )
  //   );
  //
  //   widgets.add(pw.SizedBox(height: 10.h),);
  //   for(var i = 0; i<30; i++){
  //     widgets.add(pw.Table(
  //         defaultColumnWidth: pw.FixedColumnWidth(50.w),
  //         border: pw.TableBorder.all(color: PdfColors.black, width: 0.1),
  //         children: [
  //           pw.TableRow(
  //             decoration: const pw.BoxDecoration(border: pw.TableBorder(horizontalInside: pw.BorderSide(color: PdfColors.black))),
  //             children: [
  //               pw.Text((i+1).toString(), textAlign: pw.TextAlign.center, style: textStyle),
  //               pw.Text("Habib", style: textStyle),
  //               pw.Text("Hasan", style: textStyle),
  //               pw.Text("Zilany", style: textStyle),
  //               pw.Text("Empty1", style: textStyle),
  //               pw.Text("Empty2", style: textStyle),
  //             ],),
  //           pw.TableRow(
  //             children: [
  //               pw.Text(""),
  //               pw.Text("10"),
  //               pw.Text("20"),
  //               pw.Text("30"),
  //             ],),
  //           pw.TableRow(
  //             children: [
  //               pw.Text(""),
  //               pw.Text("True"),
  //               pw.Text("False"),
  //               pw.Text(""),
  //               pw.Text(""),
  //               pw.Text("False"),
  //             ],),
  //         ]
  //     ));
  //     widgets.add(pw.SizedBox(height: 10.h));
  //   }
  //   final pdf = pw.Document();
  //   // ByteData bytes = await rootBundle.load('assets/avatar.png');
  //   // Uint8List logobytes = bytes.buffer.asUint8List();
  //   // final logoImage = PdfImage.file(pdf.document, bytes: bytes);
  //   pdf.addPage(pw.MultiPage(
  //     pageFormat: pdfPageFormat,
  //     orientation: pageOrientation,
  //     build: (context) => widgets
  //   ),
  //   );
  //
  //   // final output = await getTemporaryDirectory();
  //   // path = "${output.path}/example.pdf";
  //   // debugPrint("Path: $path");
  //   // final file = File(path);
  //   // // final file = File("example.pdf");
  //   // await file.writeAsBytes(await pdf.save());
  //   return pdf.save();
  // }
  // previewPdf(BuildContext context){
  //   context.router.push(const PdfRoute());
  // }
  // printPdf() async{
  //   await Printing.layoutPdf(onLayout: (format) async => generateTablePdf(),);
  // }
  //
  // sharePdf() async{
  //   await Printing.sharePdf(bytes: await generateTablePdf(), filename: 'dlegal-test-v:-0.0.1.pdf');
  //
  // }
}



