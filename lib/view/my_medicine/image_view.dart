import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/app_url.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import 'package:http/http.dart' as http;

class ImageView extends StatefulWidget {
  ImageView({super.key, required this.image});

  var image;

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  // Uint8List? _imageBytes;
  //
  // Future<String> getExternalStorageDirectoryPath() async {
  //   final directory = await getExternalStorageDirectory();
  //   return directory!.path;
  // }
  //
  // Future<void> _downloadImage() async {
  //   // Replace the URL with your API endpoint that serves the image
  //   final response = await http.get(Uri.parse(widget.image));
  //
  //   if (response.statusCode == 200) {
  //     final tempDirectory = await getTemporaryDirectory();
  //     final imagePath = '${tempDirectory.path}/image.jpg';
  //     final File imageFile = File(imagePath);
  //
  //     // Write the image bytes to the file in the cache directory
  //     await imageFile.writeAsBytes(response.bodyBytes);
  //
  //     // Get the external storage directory path
  //     final externalStoragePath = await getExternalStorageDirectoryPath();
  //     final newImagePath = '$externalStoragePath/image.jpg';
  //
  //     // Copy the image file from the cache directory to the external storage directory
  //     await imageFile.copy(newImagePath);
  //
  //     setState(() {
  //       _imageBytes = response.bodyBytes;
  //     });
  //
  //     print(newImagePath);
  //     // Show a toast or snackbar to indicate that the image has been saved
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Image saved to $newImagePath'),
  //     ));
  //   } else {
  //     throw Exception('Failed to load image');
  //   }
  // }
  Uint8List? _imageBytes;

  Future<String> getExternalStorageDirectoryPath() async {
    final directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  Future<void> _downloadImage() async {
    // Replace the URL with your API endpoint that serves the image
    final response = await http.get(Uri.parse(widget.image));

    if (response.statusCode == 200) {
      final tempDirectory = await getTemporaryDirectory();
      final imagePath = '${tempDirectory.path}/image.jpg';
      final File imageFile = File(imagePath);

      // Write the image bytes to the file in the cache directory
      await imageFile.writeAsBytes(response.bodyBytes);

      // Get the external storage directory path
      final externalStoragePath = await getExternalStorageDirectoryPath();
      final newImagePath = '$externalStoragePath/image.jpg';

      // Copy the image file from the cache directory to the external storage directory
      await imageFile.copy(newImagePath);

      // Save the image to the gallery
      await GallerySaver.saveImage(newImagePath);

      setState(() {
        _imageBytes = response.bodyBytes;
      });

      // Show a toast or snackbar to indicate that the image has been saved
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Image saved to and added to gallery'),
      ));
    } else {
      throw Exception('Failed to load image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        bottomNavigationBar:  BottomAppBar(
          color: Colors.green,elevation: 0,

          child: MaterialButton( onPressed: () {
            _downloadImage();
          },
          child: Text("Download Prescription",style: Style.alltext_appbar,),),
        ),
        // appBar: AppBar(
        //   backgroundColor: AppColors.primary_color,
        //   title: Text("Prescription Image", style: Style.alltext_appbar),
        //   centerTitle: true,
        // ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: PhotoView(
            imageProvider: NetworkImage(
              "${widget.image}",
            ),
          ),
        ),
      ),
    );
  }
}
