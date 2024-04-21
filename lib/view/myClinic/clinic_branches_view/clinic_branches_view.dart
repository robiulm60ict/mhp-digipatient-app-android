import 'package:digi_patient/view/myClinic/clinic_branches_view/branches_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../myclinic_our_servic/myclinic_service.dart';

class ClinicBranches extends StatelessWidget {
  const ClinicBranches({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),

          backgroundColor: Colors.white,
          // leading: Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child: Image.asset(
          //     Assets.mhplogo,
          //   ),
          // ),
          actions: [
            CircleAvatar(
              backgroundImage: AssetImage(Assets.dummy_image),
            ),
            Style.widthdistan_size5,
          ],
        ),
        body: Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Style.distan_size20,
                SizedBox(
                  child: Image.asset(
                   "assets/images/picturebuttons2.png",
                    fit: BoxFit.fill,
                  ),
                  height: 130.w,
                  width: double.infinity,
                ),
                Style.distan_size20,
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      side: BorderSide(color: AppColors.primaryColor)),
                  child: ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.search_rounded,
                      color: AppColors.primaryColor,
                      size: 25.h,
                    ),
                    title: Text(
                      "Search your branch",
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            // color:index%2==0? Color(0xff71B92A).withOpacity(0.5):Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        padding:
                            EdgeInsets.only(left: 8, right: 4, top: 8, bottom: 8),
                        margin:
                            EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 4),
                        child: Row(
                          children: [
                            SizedBox(
                              child: CircleAvatar(
                                backgroundImage: AssetImage(Assets.imagesChamber),
                                radius: 30,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 8),
                              width: 165.w,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Style.distan_size2,
                                    Text(
                                      "Dhanmondi Branch",
                                      style: Style.alltext_default_balck_w700,
                                    ),
                                    Style.distan_size5,
                                    Text("Please call for an appointment",
                                        style: Style.alltext_default_balck),
                                    Style.distan_size2,
                                  ]),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 2),
                              // width: 70.w,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      color: Colors.deepPurple,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BranchesDetails()));
                                      },
                                      icon: Icon(
                                        Icons.arrow_circle_right,
                                        size: 25,
                                      ),
                                    ),
                                    IconButton(
                                      color: Colors.greenAccent,
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyClinicServices()));
                                      },
                                      icon: Icon(
                                        Icons.details,
                                        size: 25,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
