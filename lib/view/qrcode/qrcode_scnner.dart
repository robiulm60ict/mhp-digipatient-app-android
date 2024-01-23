// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// import '../../view_model/qr_code_dr_profile_view_model/profile_view_model.dart';
//
// class QRCodeScanner extends StatefulWidget {
//   const QRCodeScanner({super.key});
//
//   @override
//   State<QRCodeScanner> createState() => _QRCodeScannerState();
// }
//
// class _QRCodeScannerState extends State<QRCodeScanner> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//
//   //Barcode? result;
//   String result = "";
//   QRViewController? controller;
//
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }
//
//   void onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData.code!;
//         resultData(result);
//       });
//     });
//   }
//
//   resultData(result) {
//
//     print("resultdataaaaaaaaaaaaaaaaaaaaaaaa");
//     context.read<DrProfileViewModel>().getProfileData(context,result.toString());
//     controller!.dispose();
//     // Navigator.pushNamed(context, RoutesName.dashbord);
//   }
//
//   // @override
//   // void initState() {
//   //   setState(() {
//   //     WidgetsBinding.instance.addPostFrameCallback((_) {
//   //       context.read<DrProfileViewModel>().getProfileData(context);
//   //     });
//   //   });
//
//
//   //   // TODO: implement initState
//   //   super.initState();
//   // }
//
//   @override
//   void didUpdateWidget(covariant QRCodeScanner oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final appointments = Provider.of<DrProfileViewModel>(context);
//
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           child: Column(
//             children: [
//               // Expanded(child: Text("data",style: TextStyle(fontSize: 44),)),
//               // Expanded(
//               //   child: ListView.builder(
//               //       itemCount: appointments.profileList.length,
//               //       shrinkWrap: true,
//               //       itemBuilder: (context, index) {
//               //         var data = appointments.profileList[index];
//               //         return Text(data.id.toString());
//               //       }),
//               // ),
//               Expanded(
//                 flex: 6,
//                 child: QRView(
//                   key: qrKey,
//                   onQRViewCreated: onQRViewCreated,
//                 ),
//               ),
//               // Expanded(
//               //   flex: 1,
//               //   child: Center(
//               //     child: (result != null)
//               //         ? Text('Data: ${result!}')
//               //         : Text('Scan a code'),
//               //   ),
//               // ),
//               // Expanded(
//               //     flex: 1,
//               //     child: Center(
//               //       child: TextButton(
//               //         onPressed: () {
//               //           if (result.isNotEmpty) {
//               //             Clipboard.setData(ClipboardData(text: result));
//               //             ScaffoldMessenger.of(context).showSnackBar(
//               //                 SnackBar(content: Text("Copied to Clipboard")));
//               //           }
//               //         },
//               //         child: Text("Copy"),
//               //       ),
//               //     ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
