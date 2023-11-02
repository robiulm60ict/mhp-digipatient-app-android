import 'package:digi_patient/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_rating.dart';

class DocCard extends StatelessWidget {
  const DocCard({Key? key, this.onTap, required this.docName,  this.docSpeciality,  this.docImage,  this.docHospital}) : super(key: key);
  final VoidCallback? onTap;
  final String docName;
  final String ?docSpeciality;
  final String ?docImage;
  final String ?docHospital;


  @override
  Widget build(BuildContext context) {
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
                  children: [
                    SizedBox(height: 35.h, width: double.infinity,),
                    Text(docName, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464),),),
                    const SizedBox(height: 4,),
                    Text(docSpeciality!, maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp, color: const Color(0xFF8A8A8A),),),
                    const SizedBox(height: 4,),
                    Text(docHospital!, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: TextStyle(fontSize: 12.sp,  color: const Color(0xFF8A8A8A),),),
                    const SizedBox(height: 4,),
                    CustomRating.ratingBar(onRatingUpdate: (val){}),
                  SizedBox(height: 5.h),
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
              child: FadeInImage(
                fit: BoxFit.cover,
                width: 65,
                height: 65,
                image: NetworkImage(
                  docImage!,
                ),
                imageErrorBuilder: (context, error, stackTrace) => const CircleAvatar(radius: 35, child: Text("Error"),),
                placeholder: const AssetImage(Assets.imagesAvatar),

              ),
            ),)
        ],
      ),
    );
  }
}
