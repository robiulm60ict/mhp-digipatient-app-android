import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  Directory? tempDir = await getDownloadsDirectory();

  if (tempDir == null) {
    print('External storage directory not available');
    return;
  }

  // Define the file path for the PDF file.
  String filePath = '${tempDir.path}/$fileName';

  try {
    // Create the PDF file and write the bytes to it.
    File tempFile = File(filePath);
    File f = await tempFile.writeAsBytes(bytes, flush: true);
    print(f.toString());
    print('File saved to: ${f.path}');
    // Open the PDF file with its associated app.
    final result = await OpenFile.open(filePath);

    if (result.type == ResultType.done) {
      print('File opened successfully');
    } else {
      print('Error opening file: ${result.message}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// Future<void> saveAndLaunchFilee(List<int> bytes, String fileName, BuildContext context) async {
//   Directory? tempDir = await getApplicationDocumentsDirectory();
//
//   if (tempDir == null) {
//     print('External storage directory not available');
//     return;
//   }
//
//   // Define the file path for the PDF file.
//   String filePath = '${tempDir.path}/$fileName';
//
//   try {
//     // Create the PDF file and write the bytes to it.
//     File tempFile = File(filePath);
//     File f = await tempFile.writeAsBytes(bytes, flush: true);
//     print('File saved to: ${f.path}');
//
//     // Open the PDF file using the default viewer app.
//     final bool result = await launch(filePath);
//
//     if (!result) {
//       print('Error opening file: Could not launch $filePath');
//       // Inform the user that a PDF viewer app is required
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('PDF Viewer Required'),
//             content: Text('Please install a PDF viewer app to open the file.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   } catch (e) {
//     print('Error: $e');
//     // Handle other exceptions
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('An error occurred while opening the file.'),
//       ),
//     );
//   }
// }
