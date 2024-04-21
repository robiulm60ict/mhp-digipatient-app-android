import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../view_model/clinic_service_view_model/clinic_service_view_model.dart';

class MyClinicServices extends StatelessWidget {
  const MyClinicServices({super.key});

  @override
  Widget build(BuildContext context) {
    final clinic = Provider.of<ClinicServiceViewModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            "Our Services",
            style: Style.alltext_default_balck_blod,
          ),
          actions: [
            Icon(Icons.sms_failed_rounded),
            Style.widthdistan_size15,
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
                Style.distan_size15,
                GridView.builder(
                  itemCount: clinic.serviceItemsList.length,
                  shrinkWrap: true,
                  gridDelegate: FlutterzillaFixedGridView(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 16,
                      height: 135.h),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(44)),
                      child: Card( shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                        elevation: 4,
                        shadowColor: AppColors.primary_color,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(clinic.serviceItemsList[index].image,height: 70,),
                            Style.distan_size5,
                            Text(
                              clinic.serviceItemsList[index].title,
                              style: Style.alltext_default_balck_blod,
                            )
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
