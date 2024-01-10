import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:digi_patient/utils/utils.dart';
import 'package:digi_patient/view/my_medicine/rx_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/styles.dart';
import '../../widgets/back_button.dart';

class MyMedicineView extends StatelessWidget {
  const MyMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,

        title: Text("My Medicine", style: Style.alltext_appbar,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPadding.r),
        child: Column(
          children: [
            Container(
              height: 149.h,
              width: double.infinity,
              padding: EdgeInsets.all(8.r),
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(Assets.myMedicineMyMedicineFull),
                  fit: BoxFit.fill
                )
              ),
            ),
            SizedBox(height: defaultPadding.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){
                      // context.router.push(const RXRoute());
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RXView()));
                    },
                    child: Card(child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.h,),
                        const CircleAvatar(
                          backgroundImage: AssetImage(Assets.myMedicineMedicineCircle),
                        ),
                        SizedBox(height: 8.r,),
                        Text("Medication", style: Style.alltext_default_balck,),
                        SizedBox(height: 10.h,),
                      ],
                    ),),
                  ),
                ),
                Expanded(
                  child: Card(child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10.h,),
                      const CircleAvatar(
                        backgroundImage: AssetImage(Assets.myMedicineBuyMedicineCircle),
                      ),
                      SizedBox(height: 8.r,),
                      Text("Buy Medicine ", style: Style.alltext_default_balck,),
                      SizedBox(height: 10.h,),
                    ],
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
