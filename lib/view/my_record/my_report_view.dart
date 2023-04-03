
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class MyReportView extends StatelessWidget {
  const MyReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text("My Report", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: ListView(
        children: [

        ],
      ),
    );
  }
}
