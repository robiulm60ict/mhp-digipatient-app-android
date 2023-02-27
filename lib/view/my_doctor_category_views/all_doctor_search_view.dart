import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/widgets/doctor_list_tile_our_doc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/utils.dart';
import '../../widgets/back_button.dart';
import '../../widgets/search_text_field.dart';

class AllDoctorSearchView extends StatelessWidget {
  const AllDoctorSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        centerTitle: true,
        title: Text("My Doctor", style: TextStyle(fontSize: 18.sp, color: AppColors.primaryColor),),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: Column(
          children: [
            const SearchTextField(hintText: "Search Doctor..",),
            SizedBox(height: 10.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("  Our Doctors", textAlign: TextAlign.start, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xFF646464)),)),
            SizedBox(height: 10.h,),
            Expanded(child: ListView.separated(

                itemCount: 7,
                itemBuilder: (context, index){
                  return DoctorListTileOurDoc(onTap: (){
                    context.router.push(DocDetailsRoute());
                  },);
                },
            separatorBuilder: (context, index)=> SizedBox(height: 6.h,),
            ),

            )
          ],
        ),
      ),
    );
  }
}
