import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/custom_rating.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../model/doctor_model/doctors_model.dart';
import '../../routes/routes.gr.dart';
import '../../widgets/doc_card.dart';

class MyDoctorCategoryWiseView extends StatefulWidget {
  const MyDoctorCategoryWiseView(
      {Key? key,
      required this.categoryName,
      required this.departmentId,
      required this.departmentImage})
      : super(key: key);
  final String categoryName;
  final num departmentId;
  final String departmentImage;

  @override
  State<MyDoctorCategoryWiseView> createState() =>
      _MyDoctorCategoryWiseViewState();
}

class _MyDoctorCategoryWiseViewState extends State<MyDoctorCategoryWiseView> {
  late List<Doctor>? doctors;

  @override
  void initState() {
    super.initState();
    doctors = context
        .read<MyDoctorViewModel>()
        .getDoctorsByType(departmentId: widget.departmentId);
    debugPrint(doctors?.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    final myDocVM = Provider.of<MyDoctorViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text(
          "My Doctor",
          style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Column(
          children: [
            Container(
              height: 130.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInImage(
                      // fit: BoxFit.cover,
                      height: 117.h,
                      width: 134.w,
                      image: NetworkImage(
                        widget.departmentImage,
                      ),
                      imageErrorBuilder: (context, error, stackTrace) =>
                          const CircleAvatar(
                        radius: 35,
                        child: Text("Error"),
                      ),
                      placeholder: const AssetImage(Assets.imagesCardiology),
                    ),
                    // Image.asset(Assets.imagesCardiology, height: 117.h, width: 134.w,),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: Text(
                      widget.categoryName,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 26.sp, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: doctors?.length,
                gridDelegate: FlutterzillaFixedGridView(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                    height: 175.h),
                itemBuilder: (context, index) {
                  Doctor? doc = doctors?[index];

                  return DocCard(
                    onTap: () {
                      // context.router.push(DocDetailsRoute(id: doc!.id!));
                    },
                    docImage: "${AppUrls.docImage}${doc?.drImages}",
                    docName: "${doc?.drGivenName}",
                    docSpeciality: "${doc?.department?.departmentsName}",
                    docHospital: "${doc?.usualProvider?.usualProviderName}",
                  );
                },
              ),
            ),
            // SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
