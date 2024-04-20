import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';

import '../../../generated/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';

class MyClinicServices extends StatelessWidget {
  const MyClinicServices({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Our Services",style: Style.alltext_default_balck_blod,),
          actions: [
            Icon(Icons.sms_failed_rounded)
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Style.distan_size10,
                SizedBox(
                  child: Image.asset(
                    Assets.imagesChamber,
                  ),
                  height: 150.h,
                  width: double.infinity,
                ),
                Style.distan_size10,
                SizedBox(
                    width: 250.w,
                    child: Text(
                      "WELCOME TO",
                      style: Style.alltext_default_balck_blod_dilog,
                    )),


                Style.distan_size15,
                Text(
                  "IBN SINA DHANMONDI BRANCH",
                  style: Style.alltext_default_balck_blod,
                ),

                Style.distan_size5,
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: FlutterzillaFixedGridView(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 16,
                    height: 135.h),
                itemBuilder: (context, index) {


                  return Container(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      
                          Icon(Icons.calendar_month,size: 50,color: Colors.black,),
                          Text("Appointment",style: Style.alltext_default_balck_blod,)
                        ],
                      ),
                    ),
                  );
                },
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
