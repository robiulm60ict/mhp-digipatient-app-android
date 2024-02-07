import 'dart:io';

import 'package:digi_patient/view/home_item_pages/my_record_view.dart';
import 'package:digi_patient/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../generated/assets.dart';
import '../../../resources/app_url.dart';
import '../../../resources/styles.dart';
import '../../resources/colors.dart';
import '../../utils/message.dart';
import '../../utils/user.dart';
import '../../utils/utils.dart';
import '../../view_model/my_medicine_view_model/my_medicine_view_model.dart';
import '../../widgets/back_button.dart';

class UploadReportView extends StatefulWidget {
  UploadReportView({
    super.key,
  });

  @override
  State<UploadReportView> createState() => _UploadReportViewState();
}

class _UploadReportViewState extends State<UploadReportView> {
  var file;
  List<XFile>? selectedImages = [];

  Future<void> loadAssets() async {
    try {
      final List<XFile>? pickedImages = await ImagePicker().pickMultiImage();

      if (pickedImages != null && pickedImages.isNotEmpty) {
        setState(() {
          selectedImages!.addAll(pickedImages);
          imgageSelectedtrue();
        });
      }
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<void> pickImageFromCamera() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() {
        selectedImages!.add(XFile(imageFile.path));
        imgageSelectedtrue();
      });
    }
  }

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

  TextEditingController reportName = TextEditingController();
  TextEditingController typereportName = TextEditingController();

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
      body: Container(
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
                    height:150.h,
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
                          padding: const EdgeInsets.symmetric(horizontal: 5),
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
                                padding:  EdgeInsets.all(8.0.r),
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
                                        style: Style.alltext_default_primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              child: Padding(
                                padding:  EdgeInsets.all(8.0.r),
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
                                        style: Style.alltext_default_primary,
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
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomTextField(
                  textEditingController: typereportName,
                  prefix: Icon(
                    Icons.dashboard_sharp,
                    color: AppColors.primaryColor,
                  ),
                  hintText: "Type Of Report",
                ),
              ),
              Style.distan_size10,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 5),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                            maxLines: 1,overflow: TextOverflow.clip,
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
                                          setState(() =>
                                              selectedImages!.removeAt(index));
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
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: MaterialButton(
              minWidth: 200.w,
              height: 50.h,
              color: Colors.green,
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();

                if (reportName.text.isEmpty) {
                  Messages.snackBar(
                    context,
                    "DoctorName / TabName con not be empty !",
                  );
                } else if (typereportName.text.isEmpty) {
                  Messages.snackBar(
                    context,
                    "Type of report con not be empty !",
                  );
                } else {
                  int? id = prefs.getInt(UserP.id);
                  Map<String, String> body = {
                    'patient_id': id.toString(),
                    'name': reportName.text,
                    'type_of_report': typereportName.text,
                  };

                  print(body);

                  report.uploadRx(context, body, selectedImages);
                  // if (selectedImages!.isNotEmpty) {
                  //   print('Gallery');
                  //   // if (selectedImages == null || selectedImages!.isEmpty) {
                  //   //   print('No images selected Gallery');
                  //   //   return;
                  //   // }
                  //   final token = prefs.getString(UserP.fcmToken) ?? "";
                  //   Map<String, String> headers = {
                  //     'Authorization': "Bearer $token",
                  //     'Content-Type': 'multipart/form-data',
                  //     'Accept': 'application/json',
                  //     'databaseName': 'mhpdemocom',
                  //   };
                  //
                  //   final Uri apiUrl = Uri.parse(AppUrls
                  //       .uploadMyReport); // Replace with your API endpoint
                  //
                  //   var request = http.MultipartRequest('POST', apiUrl)
                  //     ..fields.addAll(body)
                  //     ..headers.addAll(headers);
                  //
                  //   for (var image in selectedImages!) {
                  //     final File file = File(image.path);
                  //     request.files.add(
                  //       await http.MultipartFile.fromPath(
                  //         "images[]",
                  //         file.path,
                  //       ),
                  //     );
                  //   }
                  //
                  //   try {
                  //     var response = await request.send();
                  //     print("ddddddddddddddddddd${response.request}");
                  //
                  //     if (response.statusCode == 200) {
                  //       Messages.snackBar(
                  //           context, "Images uploaded successfully",
                  //           backgroundColor: AppColors.greenColor);
                  //       print('Images uploaded successfully');
                  //       reportName.clear();
                  //       imageList.clear();
                  //       selectedImages!.clear();
                  //       Navigator.pop(context);
                  //       // Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => MyRecordView()));
                  //       // Navigator.pushAndRemoveUntil(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //         builder: (context) => MyRecordView()),
                  //       //         (route) => false);
                  //       // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ConsultationAppoinmentView()),(route) => DashbordView(),);
                  //     } else {
                  //       print(
                  //           'Failed to upload images. Status code: ${response.statusCode}');
                  //     }
                  //   } catch (error) {
                  //     print('Error uploading images: $error');
                  //   }
                  // }
                  // else {
                  //   print('Camra');
                  //   // if (imageList!.isEmpty) {
                  //   //   print('No images selected camera');
                  //   //   return;
                  //   // }
                  //   final token = prefs.getString(UserP.fcmToken) ?? "";
                  //   Map<String, String> headers = {
                  //     'Authorization': "Bearer $token",
                  //     'Content-Type': 'multipart/form-data',
                  //     'Accept': 'application/json',
                  //     'databaseName': 'mhpdemocom',
                  //   };
                  //
                  //   final Uri apiUrl = Uri.parse(AppUrls
                  //       .uploadMyReport); // Replace with your API endpoint
                  //
                  //   var request = http.MultipartRequest('POST', apiUrl)
                  //     ..fields.addAll(body)
                  //     ..headers.addAll(headers);
                  //
                  //   for (var image in imageList!) {
                  //     final File file = File(image.path);
                  //     request.files.add(
                  //       await http.MultipartFile.fromPath(
                  //         "images[]",
                  //         file.path,
                  //       ),
                  //     );
                  //   }
                  //
                  //   try {
                  //     var response = await request.send();
                  //     print("ddddddddddddddddddd${response}");
                  //
                  //     if (response.statusCode == 200) {
                  //       reportName.clear();
                  //       print('Images uploaded successfully');
                  //       Messages.snackBar(
                  //           context, "Images uploaded successfully",
                  //           backgroundColor: AppColors.greenColor);
                  //       imageList.clear();
                  //       selectedImages!.clear();
                  //       Navigator.pop(context);
                  //       // Navigator.pushReplacement(
                  //       //     context,
                  //       //     MaterialPageRoute(
                  //       //         builder: (context) => MyRecordView()),
                  //       //         );
                  //     } else {
                  //       print(
                  //           'Failed to upload images. Status code: ${response.statusCode}');
                  //     }
                  //   } catch (error) {
                  //     print('Error uploading images: $error');
                  //   }
                  // }
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
