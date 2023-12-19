import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {

  Directory? tempDir = await getExternalStorageDirectory();

  if (tempDir == null) {
    print('External storage directory not available');
    return;
  }

  // Define the file path for the PDF file.
  String filePath = '${tempDir.path}/$fileName.pdf';

  try {
    // Create the PDF file and write the bytes to it.
    File tempFile = File(filePath);
    File f = await tempFile.writeAsBytes(bytes, flush: true);
    print(f.toString());
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
