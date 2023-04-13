import 'package:auto_route/auto_route.dart';
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

class MyDoctorCategoryWiseView extends StatefulWidget {
  const MyDoctorCategoryWiseView({Key? key, required this.categoryName, required this.departmentId}) : super(key: key);
  final String categoryName;
  final num departmentId;

  @override
  State<MyDoctorCategoryWiseView> createState() => _MyDoctorCategoryWiseViewState();
}

class _MyDoctorCategoryWiseViewState extends State<MyDoctorCategoryWiseView> {

  late List<Doctors>? doctors;

  @override
  void initState() {
    super.initState();
    doctors = context.read<MyDoctorViewModel>().getDoctorsByType(departmentId: widget.departmentId);
    debugPrint(doctors?.length.toString() );
  }
  @override
  Widget build(BuildContext context) {
    final myDocVM = Provider.of<MyDoctorViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
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
                    Image.asset(Assets.imagesCardiology, height: 117.h, width: 134.w,),
                    SizedBox(width: 12.w,),
                    Expanded(child: Text(widget.categoryName, textAlign: TextAlign.start, style: TextStyle(fontSize: 26.sp, color: Colors.white),))
                  ],
                ),
              ),
            ),
            SizedBox(height: 25.h,),
            Expanded(child: GridView.builder(
              itemCount: doctors?.length,
                gridDelegate: FlutterzillaFixedGridView(
                    crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 16,
                  height: 155.h

                ), itemBuilder: (context, index) {

                Doctors? doc = doctors?[index];

                return InkWell(
              onTap: (){
                context.router.push( DocDetailsRoute(id: doc!.id!));
              },
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
                          children: [
                            SizedBox(height: 35.h, width: double.infinity,),
                            Text("${doc?.drFullName}", maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464),),),
                            const SizedBox(height: 4,),
                            Text("${doc?.department?.departmentsName }", maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A),),),
                            const SizedBox(height: 4,),
                            Text("${doc?.usualProvider?.usualProviderName}", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp,  color: const Color(0xFF8A8A8A),),),
                            const SizedBox(height: 4,),
                            CustomRating.ratingBar(onRatingUpdate: (val){}),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     top: 0,
                  //     child: CircleAvatar(radius: 25.h,),),
                Positioned(
                  top: 0,
                  child: ClipOval(
                  child: Image.network(
                    "${AppUrls.docImage}${doc?.drImages}",
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) => const CircleAvatar(radius: 35, child: Text("Error"),),
                  ),
                ),)
              ],
            ),
                );},
            ),
            ),
            // SizedBox(height: 50.h,),
          ],
        ),
      ),
    );
  }
}
