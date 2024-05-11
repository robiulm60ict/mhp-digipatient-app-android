import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image/image.dart' as img;

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/message.dart';
import '../../utils/user.dart';
import '../../utils/utils.dart';
import '../../view_model/my_medicine_view_model/my_medicine_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/lodding_widget.dart';

class UploadReportView extends StatefulWidget {
  UploadReportView({
    super.key,
  });

  @override
  State<UploadReportView> createState() => _UploadReportViewState();
}

class _UploadReportViewState extends State<UploadReportView> {
  // List<XFile>? selectedImages = [];
  //
  // Future<void> loadAssets() async {
  //   try {
  //     final List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
  //
  //     if (pickedImages != null && pickedImages.isNotEmpty) {
  //       setState(() {
  //         selectedImages!.addAll(pickedImages);
  //         imgageSelectedtrue();
  //       });
  //     }
  //   } catch (e) {
  //     print('Error picking images: $e');
  //   }
  // }
  //
  // Future<void> pickImageFromCamera() async {
  //   final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (imageFile != null) {
  //     setState(() {
  //       selectedImages!.add(XFile(imageFile.path));
  //       imgageSelectedtrue();
  //     });
  //   }
  // }

  // List<XFile>? selectedImages = [];
  //
  //
  // Future<void> loadAssets() async {
  //   try {
  //     final List<XFile>? pickedImages = await ImagePicker().pickMultiImage();
  //
  //     if (pickedImages != null && pickedImages.isNotEmpty) {
  //       for (var pickedImage in pickedImages) {
  //         // Resize the image before adding it to the list
  //         final resizedImage = await compressImage(pickedImage.path);
  //         setState(() {
  //           selectedImages!.add(resizedImage);
  //           imgageSelectedtrue();
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     print('Error picking images: $e');
  //   }
  // }
  //
  // Future<void> pickImageFromCamera() async {
  //   final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (imageFile != null) {
  //     // Resize the image before adding it to the list
  //     final resizedImage = await compressImage(imageFile.path);
  //     setState(() {
  //       selectedImages!.add(resizedImage);
  //       imgageSelectedtrue();
  //     });
  //   }
  // }
  //
  // Future<XFile> compressImage(String imagePath) async {
  //   final Uint8List imageBytes = await File(imagePath).readAsBytes();
  //
  //   // Compress the image data using FlutterImageCompress
  //   final Uint8List compressedImageBytes = await FlutterImageCompress.compressWithList(
  //     imageBytes,
  //     minHeight: 1920,
  //     minWidth: 1080,
  //     quality: 90,
  //   );
  //
  //   // Get the directory for temporary files
  //   final tempDir = await getTemporaryDirectory();
  //   final tempPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  //
  //   // Write the compressed image data to the temporary file
  //   await File(tempPath).writeAsBytes(compressedImageBytes);
  //
  //   // Return an XFile representing the temporary file
  //   return XFile(tempPath);
  // }
  List<XFile>? selectedImages = [];

  Future<void> loadAssets() async {
    try {
      final List<XFile>? pickedImages = await ImagePicker().pickMultiImage();

      if (pickedImages != null && pickedImages.isNotEmpty) {
        for (var pickedImage in pickedImages) {
          // Resize the image before adding it to the list
          final resizedImage = await compressImage(pickedImage.path);
          setState(() {
            selectedImages!.add(resizedImage);
            imgageSelectedtrue();
          });
        }
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<void> pickImageFromCamera() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      // Resize the image before adding it to the list
      final resizedImage = await compressImage(imageFile.path);
      setState(() {
        selectedImages!.add(resizedImage);
        imgageSelectedtrue();
      });
    }
  }

  bool isCompressing = false;

  Future<XFile> compressImage(String imagePath) async {
    setState(() {
      isCompressing =
          true; // Compression process started, show loading indicator
    });

    try {
      final File imageFile = File(imagePath);

      // Read the image as bytes
      final Uint8List imageBytes = await imageFile.readAsBytes();

      // Print the size of the original image
      print('Original image size: ${imageBytes.length} bytes');

      // Attempt to decode the image
      img.Image? image = img.decodeImage(imageBytes);

      if (image == null) {
        throw Exception('Failed to decode image.');
      }

      // Resize the image if needed
      final double maxSize = 1024.0; // Change the max size as needed
      if (image.width > maxSize || image.height > maxSize) {
        image = img.copyResize(image,
            width: maxSize.toInt(), height: maxSize.toInt());
      }

      final Uint8List resizedImageBytes =
          Uint8List.fromList(img.encodeJpg(image));

      // Print the size of the resized image
      print('Resized image size: ${resizedImageBytes.length} bytes');

      // Compress the image data using FlutterImageCompress
      final Uint8List compressedImageBytes =
          await FlutterImageCompress.compressWithList(
        resizedImageBytes,
        // minHeight: 1920,
        // minHeight: 1080,
        // minWidth: 1080,
        quality: 70,
      );

      // Get the directory for temporary files
      final tempDir = await getTemporaryDirectory();
      final tempPath =
          '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Write the compressed image data to the temporary file
      await File(tempPath).writeAsBytes(compressedImageBytes);

      // Return an XFile representing the temporary file
      return XFile(tempPath);
    } catch (e) {
      print('Error compressing image: $e');
      // Handle compression error
      return Future.error('Compression failed: $e');
    } finally {
      setState(() {
        isCompressing =
            false; // Compression process completed, hide loading indicator
      });
    }
  }

//   bool isCompressing = false;
//   Future<XFile> compressImage(String imagePath) async {
//     setState(() {
//       isCompressing = true; // Compression process started, show loading indicator
//     });
//
//     final File imageFile = File(imagePath);
//
//     // Read the image as bytes
//     final Uint8List imageBytes = await imageFile.readAsBytes();
//
//     // Print the size of the original image
//     print('Original image size: ${imageBytes.length} bytes');
//
//     // Attempt to decode the image
//     img.Image? image = img.decodeImage(imageBytes);
//
//     if (image == null) {
//       throw Exception('Failed to decode image.');
//     }
//
//     // Resize the image if needed
//     final double maxSize = 1024.0; // Change the max size as needed
//     if (image.width > maxSize || image.height > maxSize) {
//       image = img.copyResize(image,
//           width: maxSize.toInt(), height: maxSize.toInt());
//     }
//
//     final Uint8List resizedImageBytes =
//         Uint8List.fromList(img.encodeJpg(image));
//
// // Print the size of the resized image
//     print('Resized image size: ${resizedImageBytes.length} bytes');
//
// // Compress the image data using FlutterImageCompress
//     final Uint8List compressedImageBytes =
//         await FlutterImageCompress.compressWithList(
//       resizedImageBytes,
//       minHeight: 1920,
//       minWidth: 1080,
//       quality: 70,
//     );
//
//     // Get the directory for temporary files
//     final tempDir = await getTemporaryDirectory();
//     final tempPath =
//         '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
//
//     // Write the compressed image data to the temporary file
//     await File(tempPath).writeAsBytes(compressedImageBytes);
//
//     // Return an XFile representing the temporary file
//     return XFile(tempPath);
//   }

  bool isvisiblefile = false;
  bool isvisiblecamra = false;

  imgageSelectedtrue() {
    isvisiblefile = true;
  }

  camraSelectedtrue() {
    isvisiblecamra = true;
  }

  void removefile(file) {
    setState(() {
      selectedImages!.remove(file);
    });
  }

  String? typereportName;

  TextEditingController reportName = TextEditingController();

  // TextEditingController typereportName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final report = Provider.of<MyMedicineViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        centerTitle: true,
        title: Text(
          "Upload Report",
          style: Style.alltext_appbar,
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: 150.h,
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFFFF), //E9F2F2
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Style.distan_size10,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Style.distan_size2,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("Upload your document Photos",
                                        textAlign: TextAlign.start,
                                        style: Style.alltext_default_balck),
                                  ),
                                  Style.distan_size5,
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("JPG,JPEG,PNG",
                                        style: Style.alltext_default_balck),
                                  ),
                                ],
                              ),
                            ),
                            Style.distan_size2,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.r),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Center(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            pickImageFromCamera();
                                          },
                                          icon: Icon(
                                            Icons.camera_alt,
                                            size: 30,
                                            color: Colors.green,
                                          ),
                                          label: Text(
                                            "Camera",
                                            style:
                                                Style.alltext_default_primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 3,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.r),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Center(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              loadAssets();
                                            });
                                          },
                                          icon: Icon(
                                            Icons.image,
                                            size: 30,
                                            color: Colors.green,
                                          ),
                                          label: Text(
                                            "Gallery",
                                            style:
                                                Style.alltext_default_primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Style.distan_size10,
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          "Note : Upload and save your prescription and report here."),
                      Style.distan_size2,
                      Text("For Prescription: doctor name_ date"),
                      Style.distan_size2,
                      Text("For Report: lab name_ test name_ date"),
                    ],
                  ),
                  Style.distan_size10,
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: CustomTextField(
                      textEditingController: reportName,
                      prefix: Icon(
                        Icons.document_scanner_outlined,
                        color: AppColors.primaryColor,
                      ),
                      hintText: "Name_DD-MM-YYY",
                    ),
                  ),
                  Style.distan_size10,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16, right: 16),
                  //   child: CustomTextField(
                  //     textEditingController: typereportName,
                  //     prefix: Icon(
                  //       Icons.dashboard_sharp,
                  //       color: AppColors.primaryColor,
                  //     ),
                  //     hintText: "Type Of Report",
                  //   ),
                  // ),
                  // Style.distan_size10,

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                      hint: const Text('Select type report'),
                      value: typereportName,
                      onChanged: (newValue) {
                        setState(() {
                          typereportName = newValue;
                          print(typereportName);
                        });
                      },
                      items: [
                        'Prescription',
                        'Pathology Report',
                        'Radiology Report',
                        'Others'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 5),
                    child: Visibility(
                      visible: isvisiblefile,
                      child: Container(
                          //height:selectedfile.length==1? 75: 150,

                          child: ListView.builder(
                              itemCount: selectedImages!.length,
                              scrollDirection: Axis.vertical,
                              physics: ScrollPhysics(),
                              shrinkWrap: true,
                              // ignore: missing_return
                              itemBuilder: (context, index) {
                                var uploadedfile = selectedImages![index];
                                return Container(
                                    height: 55,
                                    margin: EdgeInsets.only(bottom: 4),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      //E9F2F2
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/icons/prescription.png",
                                              color: Colors.white,
                                              // height: 30,
                                              width: 30.w,
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            SizedBox(
                                              width: 120.w,
                                              child: Text(
                                                "${uploadedfile.name}",
                                                maxLines: 1,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ImageViewAsset(
                                                    image: uploadedfile,
                                                  ),
                                                ),
                                              );

                                              // setState(() =>
                                              //     selectedImages!.removeAt(index));
                                            },
                                            child: const Icon(
                                              Icons.remove_red_eye,
                                              size: 35,
                                              color: Colors.white,
                                            )),
                                        TextButton(
                                            onPressed: () {
                                              setState(() => selectedImages!
                                                  .removeAt(index));
                                            },
                                            child: Icon(
                                              Icons.delete_forever,
                                              size: 35,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ));
                              })),
                    ),
                  ),
                  Style.distan_size20,
                ],
              ),
            ),
          ),
          if (isCompressing)
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100.h,
                ),
                const LoaderWidget(),
              ],
            ),
          // AlertDialog(
          //
          //   // backgroundColor: Colors.transparent,
          //   content: Container(
          //     width: 100, // Adjust width as needed
          //     height: 100, // Adjust height as needed
          //     child: const Column(
          //       children: [
          //         Text("Please Wait..."),
          //         Center(
          //           child: CircularProgressIndicator(color: Colors.green), // Loading indicator
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: report.isPrescriptionRxUplodLoading == true
          ? Center(child: CircularProgressIndicator())
          : BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: MaterialButton(
                    minWidth: 200.w,
                    height: 50.h,
                    color: Colors.green,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      if (reportName.text.isEmpty) {
                        Messages.snackBar(
                          context,
                          "DoctorName / TabName con not be empty !",
                        );
                      } else if (typereportName.toString() == "null") {
                        Messages.snackBar(
                          context,
                          "Type of report con not be empty !",
                        );
                      }else if (selectedImages!.isEmpty) {
                        Messages.snackBar(
                          context,
                          "Image con not be empty !",
                        );
                      } else {
                        int? id = prefs.getInt(UserP.id);
                        Map<String, String> body = {
                          'patient_id': id.toString(),
                          'name': reportName.text,
                          'type_of_report': typereportName.toString(),
                        };

                        print(body);
                        //
                        report.uploadRx(context, body, selectedImages);
                      }

                      setState(() {});
                    },
                    child: Text("Save")),
              ),
            ),
    );
  }
}

class ImageViewAsset extends StatelessWidget {
  ImageViewAsset({super.key, required this.image});

  var image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          leadingWidth: leadingWidth,
          leading: const CustomBackButton(),
          title: Text("Prescription Image", style: Style.alltext_default_white),
          centerTitle: true,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.file(File(image.path))),
      ),
    );
  }
}
