import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMedicineView extends StatelessWidget {
  const MyMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Card(child: SizedBox(height: 80.h, child: Center(child: Text("Medication ", style: TextStyle(fontSize: 14.sp, color: AppColors.primaryColor),),),),),
              Card(child: SizedBox(height: 80.h, child: Center(child: Text("Medication ", style: TextStyle(fontSize: 14.sp, color: AppColors.primaryColor),),),),),
            ],
          ),
        ],
      ),
    );
  }
}
