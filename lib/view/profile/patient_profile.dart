import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../authentications/user_detail_view.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({super.key});

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData> {
  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context).user;
    final usr = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Profile",
          style: Style.alltext_ExtraLarge_white,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailView(user: user)));

                if (user == null) {
                  debugPrint("Reload page ");
                } else {
                  //context.router.push(UserDetailRoute(user: user!));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 45.h,
                          backgroundImage: NetworkImage(
                              "${AppUrls.image}${user?.patientImages}"),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${user?.patientFirstName} ${user?.patientLastName}"
                                    .toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Style.alltext_default_balck_blod,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Text(
                                "${user?.patientHnNumber}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Style.alltext_default_balck,
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Wrap(
                                children: [
                                  Icon(
                                    Icons.male,
                                    size: 13.h,
                                    color: const Color(0xFF8A8A8A),
                                  ),
                                  Text(
                                    "Gender:",
                                    style: Style.alltext_default_balck,
                                  ),
                                  Text(
                                    "${user?.patientBirthSex?.birthSexName}",
                                    style: Style.alltext_default_balck,
                                  ),
                                  // SizedBox(
                                  //   width: 8.w,
                                  // ),
                                  // Text(
                                  //   "${user!.bloodGroup!.bloodGroupName}",
                                  //   style: Style.alltext_default_balck,
                                  // ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Wrap(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    size: 13.h,
                                    color: const Color(0xFF8A8A8A),
                                  ),
                                  Text(
                                    " Dob:",
                                    style: Style.alltext_default_balck,
                                  ),
                                  Text(
                                    DateFormat(
                                        "dd-MM-yyyy")
                                        .format(DateTime.parse(user!.patientDob.toString())),
                                    style: Style.alltext_default_balck,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              Wrap(
                                children: [
                                  Icon(
                                    Icons.bloodtype,
                                    size: 13.h,
                                    color: const Color(0xFF8A8A8A),
                                  ),
                                  Text(
                                    "Blood:",
                                    style: Style.alltext_default_balck,
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Text(
                                    "${user!.bloodGroup!.bloodGroupName}",
                                    style: Style.alltext_default_balck,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(
                  width: 100.w,
                  child: Text('Phone', style: Style.alltext_default_balck,),
                ),
                Text(': '),
                Text(  "${user!.patientMobilePhone}", style: Style.alltext_default_balck,)
              ],),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(
                  width: 100.w,
                  child: Text('Email', style: Style.alltext_default_balck,),
                ),
                Text(': '),
                Text(  "${user!.patientEmail}", style: Style.alltext_default_balck,)
              ],),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(
                  width: 100.w,
                  child: Text('Address', style: Style.alltext_default_balck,),
                ),
                Text(': '),
                Text(  "${user!.patientAddress1}", style: Style.alltext_default_balck,)
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
