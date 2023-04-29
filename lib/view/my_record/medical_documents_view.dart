import 'package:digi_patient/model/my_record_model/medical_history_from_great_doc_model.dart';
import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors.dart';
import '../../widgets/back_button.dart';

class MedicalDocumentsView extends StatelessWidget {
  const MedicalDocumentsView({Key? key, required this.history}) : super(key: key);
  final PastHistory? history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("Medical Documents Details", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.whiteColor),),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          Container(
            height: 150.h,
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r)
              ),
            ),
            child: Row(
              children: [
                Image.network("${AppUrls.docImage}${history?.doctor?.drImages}",
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red,),
                height: 80,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(width: 8.w,),
                Expanded(child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${history?.doctor?.drGivenName}", style: TextStyle(fontSize: 16.sp, color: Colors.white),),
                    Text("${history?.doctor?.departmentName}", style: TextStyle(fontSize: 15.sp, color: Colors.white70),),
                    Text("${history?.doctor?.drProviderId}", style: TextStyle(fontSize: 15.sp, color: Colors.white70),),
                  ],
                ),
                ),
              ],
            ),
          ),
          Expanded(child: ListView(
            padding: EdgeInsets.all(20.r),
            children: [
              RichText(text: TextSpan(
                children: [
                  TextSpan(text: "Compliant: ", style: TextStyle(fontSize: 19.sp, color: Colors.black)),
                  TextSpan(text: " data", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                ]
              ),
              ),
              SizedBox(height: 20.h,),
              Text("${history?.details}",),
              SizedBox(height: 20.h,),
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Treatment: ", style: TextStyle(fontSize: 19.sp, color: Colors.black)),
                    TextSpan(text: " ${history?.condition}", style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                  ]
              ),
              ),
              SizedBox(height: 20.h,),
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Follow Up: ", style: TextStyle(fontSize: 19.sp, color: Colors.black)),
                    TextSpan(text: " data", style: TextStyle(fontSize: 19.sp, color: Colors.grey)),
                  ]
              ),
              ),
              SizedBox(height: 20.h,),
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Assessments: ", style: TextStyle(fontSize: 19.sp, color: Colors.black)),
                    TextSpan(text: " data", style: TextStyle(fontSize: 19.sp, color: Colors.grey)),
                  ]
              ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
