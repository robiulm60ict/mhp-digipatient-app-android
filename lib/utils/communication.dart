// import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:flutter_sms/flutter_sms.dart';
//
// class NativeCommunication{
//   static Future<bool?> call(String number) async{
//     //set the number here
//     bool? res = await FlutterPhoneDirectCaller.callNumber(number);
//     return res;
//   }
//
//   static sendSMSTo(String message, List<String> recipients) async {
//     String result = await sendSMS( recipients: recipients, message: message)
//         .catchError((onError) {
//       print(" Error: $onError");
//     });
//     debugPrint("Sms Result = $result");
//   }
//
//   static sendEmail({required String emailBody, required String emailSubject, required List<String> emailRecipients }) async{
//     final Email email = Email(
//       body: emailBody,
//       subject: emailSubject,
//       recipients: emailRecipients,
//       cc: [],
//       bcc: ['habiburrahman.devoloper@gmail.com'],
//       // attachmentPaths: ['/path/to/attachment.zip'],
//       isHTML: false,
//     );
//     try{
//       await FlutterEmailSender.send(email);
//     }catch (e){
//       debugPrint(e.toString());
//       // Message.flushBarMessage(context, msg)
//     }
//
//
//
//     // debugPrint(res.toString());
//   }
//
// }
//
// Future<void> displayTextInputDialog(BuildContext context, TextEditingController textEditingController) async {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Enter Mobile Number'),
//           content: TextField(
//             keyboardType: TextInputType.number,
//             controller: textEditingController,
//             decoration: const InputDecoration(hintText: ""),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 recipients.add(textEditingController.text);
//                 Navigator.of(context).pop();
//               },
//             ),
//
//           ],
//         );
//       });
// }
//
// List<String> recipients = ["01774142172"];