import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../model/myDoctorList/mydoctorList.dart';
import '../resources/styles.dart';
import '../utils/custom_rating.dart';
import '../view_model/mydoctor/new_my_doctor_view_model.dart';

class DocCard extends StatelessWidget {
  const DocCard(
      {Key? key,
      this.onTap,
      required this.docName,
      this.docSpeciality,
      this.docImage,
      this.docHospital,
      this.doctortitle,
      required this.docId})
      : super(key: key);
  final VoidCallback? onTap;
  final String docName;
  final String docId;
  final String? docSpeciality;
  final String? docImage;
  final String? docHospital;
  final List<Academic>? doctortitle;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MyDoctorDelaisViewModel>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              margin: const EdgeInsets.only(top: 35),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: double.infinity,
                    ),
                    Text(
                      docName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Style.alltext_default_balck_blod,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    doctortitle!.isNotEmpty
                        ? Container(
                            height: 16.h,
                            width: 200.h,
                            // width: 200, // specify a height here,
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: doctortitle!.length < 4
                                    ? doctortitle!.length
                                    : 5,
                                itemBuilder: (context, index) {
                                  var data = doctortitle![index];
                                  return Container(
                                    // width: 50.h,

                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0.0),
                                    child: Text(
                                      "${data.degreeId}${doctortitle!.last == data ? "" : ", "}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Style.alltext_ExtraSmall_black,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )

                        // Container(
                        //         //width: 100,
                        //         padding: const EdgeInsets.only(left: 12),
                        //         child: Center(
                        //             child: Row(
                        //                 mainAxisAlignment: MainAxisAlignment.center,
                        //                 children: List.generate(
                        //                     doctortitle!.length < 4
                        //                         ? doctortitle!.length
                        //                         : 4, (index) {
                        //                   var data = doctortitle![index];
                        //                   return Center(
                        //                     //  width: Get.size.width*0.26,
                        //                     child: SizedBox(
                        //                       //  width: 2,
                        //                       child: Text(
                        //                           "${data.degreeId}${doctortitle!.last == data ? "" : ","}",
                        //                           maxLines: 1,
                        //                           overflow: TextOverflow.ellipsis,
                        //                           textAlign: TextAlign.center,
                        //                           style: Style
                        //                               .alltext_ExtraSmall_black),
                        //                     ),
                        //                   );
                        //                 }))),
                        //       )
                        : Container(),
                    const SizedBox(
                      height: 0,
                    ),
                    Text(
                      docSpeciality!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Style.alltext_default_balck,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      docHospital!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Style.alltext_default_balck,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     top: 0,
          //     child: CircleAvatar(radius: 25.h,),),
          Positioned(
            top: 10,
            child: ClipOval(
              child: FadeInImage(
                fit: BoxFit.cover,
                width: 65,
                height: 65,
                image: NetworkImage(
                  docImage!,
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                    const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(Assets.dummy_image),
                ),
                placeholder: const AssetImage(Assets.imagesAvatar),
              ),
            ),
          ),
          // Positioned(
          //   top: 10,
          //   right: 0,
          //   child: ClipOval(
          //     child: IconButton(
          //
          //       icon:Icon(Icons.cancel,color: Colors.red,),
          //       onPressed: () {
          //
          //      //
          //       },
          //     ),
          //
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DeActveocCard extends StatelessWidget {
  const DeActveocCard(
      {Key? key,
      this.onTap,
      required this.docName,
      this.docSpeciality,
      this.docImage,
      this.docHospital,
      this.doctortitle,
      required this.docId})
      : super(key: key);
  final VoidCallback? onTap;
  final String docName;
  final String docId;
  final String? docSpeciality;
  final String? docImage;
  final String? docHospital;
  final List<Academic>? doctortitle;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<MyDoctorDelaisViewModel>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              margin: const EdgeInsets.only(top: 35),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: double.infinity,
                    ),
                    Text(
                      docName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Style.alltext_default_balck_blod,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    doctortitle!.isNotEmpty
                        ? Container(
                            height: 16.h,
                            width: 200.h,
                            // width: 200, // specify a height here,
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: doctortitle!.length < 4
                                    ? doctortitle!.length
                                    : 5,
                                itemBuilder: (context, index) {
                                  var data = doctortitle![index];
                                  return Center(
                                    // width: 50.h,

                                    child: Text(
                                      "${data.degreeId}${doctortitle!.last == data ? "" : ", "}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Style.alltext_ExtraSmall_black,
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      docSpeciality!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Style.alltext_default_balck,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      docHospital!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Style.alltext_default_balck,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     top: 0,
          //     child: CircleAvatar(radius: 25.h,),),
          Positioned(
            top: 10,
            child: ClipOval(
              child: FadeInImage(
                fit: BoxFit.cover,
                width: 65,
                height: 65,
                image: NetworkImage(
                  docImage!,
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                    const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(Assets.dummy_image),
                ),
                placeholder: const AssetImage(Assets.imagesAvatar),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class BranceActveocCard extends StatelessWidget {
  const BranceActveocCard(
      {Key? key,
        this.onTap,
        required this.docName,
        this.docSpeciality,
        this.docImage,
        this.docHospital,
        this.doctortitle,
        required this.docId})
      : super(key: key);
  final VoidCallback? onTap;
  final String docName;
  final String docId;
  final String? docSpeciality;
  final String? docImage;
  final String? docHospital;
  final List<dynamic>? doctortitle;

  @override
  Widget build(BuildContext context) {
    final provider =
    Provider.of<MyDoctorDelaisViewModel>(context, listen: false);
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              margin: const EdgeInsets.only(top: 35),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: double.infinity,
                    ),
                    Text(
                      docName,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Style.alltext_default_balck_blod,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    doctortitle!.isNotEmpty
                        ? Container(
                      height: 16.h,
                      width: 200.h,
                      // width: 200, // specify a height here,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: doctortitle!.length < 4
                              ? doctortitle!.length
                              : 5,
                          itemBuilder: (context, index) {
                            var data = doctortitle![index];
                            return Center(
                              // width: 50.h,

                              child: Text(
                                "${data.degreeId}${doctortitle!.last == data ? "" : ", "}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: Style.alltext_ExtraSmall_black,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                        : Container(),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      docSpeciality!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Style.alltext_default_balck,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      docHospital!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: Style.alltext_default_balck,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Positioned(
          //     top: 0,
          //     child: CircleAvatar(radius: 25.h,),),
          Positioned(
            top: 10,
            child: ClipOval(
              child: FadeInImage(
                fit: BoxFit.cover,
                width: 65,
                height: 65,
                image: NetworkImage(
                  docImage!,
                ),
                imageErrorBuilder: (context, error, stackTrace) =>
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(Assets.dummy_image),
                ),
                placeholder: const AssetImage(Assets.imagesAvatar),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
