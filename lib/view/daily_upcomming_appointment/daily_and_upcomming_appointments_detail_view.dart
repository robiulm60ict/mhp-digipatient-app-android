import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import '../../widgets/doc_card.dart';

class DailyAndUpcommingDetailView extends StatelessWidget {
  const DailyAndUpcommingDetailView({Key? key, required this.docImage, required this.docName, required this.docHospital, required this.docSpeciality, required this.appType}) : super(key: key);
  final String docImage;
  final String docName;
  final String docHospital;
  final String docSpeciality;
  final bool appType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text("Doctor Meeting", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Column(
          children: [
            DocCard(
              docImage: docImage,
              docHospital: docHospital,
              docSpeciality: docSpeciality,
              docName: docName, docId: '',

            ),
            SizedBox(height: 10.h,),
            Text("Appointment Type: ${appType ? "Online" : "Chamber"}", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
            SizedBox(height: 50.h,),
         //   Expanded(child: Lottie.asset(appType ? Assets.animationOnlineAppointment : Assets.animationMaleWalking)),
          ],
        ),
      ),
    );
  }
}
