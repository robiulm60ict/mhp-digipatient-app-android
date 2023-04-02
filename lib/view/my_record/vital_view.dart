import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/widgets/back_button.dart';
import 'package:digi_patient/widgets/vitals_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VitalsView extends StatelessWidget {
  const VitalsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("Vitals", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultPadding.r),
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r)
            ),
            child: Image.asset(Assets.vitalsVital, height: 130.h,),
          ),

          SizedBox(height: 45.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VitalsCard(title: "Blood Pressure", subtitle: "120/80", image: Assets.vitalsBloodPressure),
              VitalsCard(title: "Blood Pressure", subtitle: "120/80", image: Assets.vitalsBloodPressure),


            ],
          )
          // GridView.builder(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   itemCount: 6,
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 2,
          //     mainAxisExtent: 10,
          //     crossAxisSpacing: 10,
          //
          // ), itemBuilder: (context, index) {
          //   return Card(
          //     child: ListTile(
          //       title: const Text("dd"),
          //       subtitle: const Text("ccc"),
          //       trailing: Image.asset(Assets.vitalsBloodPressure, height: 15.h, fit: BoxFit.fill,),
          //     ),
          //   );
          // },)
        ],
      ),
    );
  }
}
