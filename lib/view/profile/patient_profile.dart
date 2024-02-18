import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../../widgets/back_button.dart';
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
    context.read<UserViewModel>().getUserDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context).user;
    final userr = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true, leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        title: Text(
          "Profile",
          style: Style.alltext_ExtraLarge_white,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 35.h,
                            backgroundImage: NetworkImage(
                                "${AppUrls.image}${user?.patientImages}"),
                          ),
                          Positioned(
                              top: 40,
                              left: 50,
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                  onTap: () {
                                    if (user != null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              UserDetailView(user: user),
                                        ),
                                      );
                                    } else {
                                      // Handle the case when user is null
                                    }
                                  },
                                  child: Image.asset(
                                    "assets/icons/editing.png",
                                    color: Colors.green,height: 30,
                                  ))

                              // IconButton(
                              //     onPressed: () {
                              //       if (user != null) {
                              //         Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //             builder: (context) =>
                              //                 UserDetailView(user: user),
                              //           ),
                              //         );
                              //       } else {
                              //         // Handle the case when user is null
                              //       }
                              //       // Navigator.push(
                              //       //     context,
                              //       //     MaterialPageRoute(
                              //       //         builder: (context) =>
                              //       //             UserDetailView(user: user)));
                              //     },
                              //     icon: Icon(Icons.edit_outlined,color: Colors.green,))
                              )
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                                Icons.date_range,
                                size: 13.h,
                                color: const Color(0xFF8A8A8A),
                              ),
                              Text(
                                " DOB:",
                                style: Style.alltext_default_balck,
                              ),
                              Text(
                                DateFormat("dd-MM-yyyy").format(DateTime.parse(
                                    user!.patientDob.toString())),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      'Blood',
                      style: Style.alltext_default_balck,
                    ),
                  ),
                  Text(': '),
                  Text(
                    "${user!.bloodGroup!.bloodGroupName}",
                    style: Style.alltext_default_balck,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      'Gender',
                      style: Style.alltext_default_balck,
                    ),
                  ),
                  Text(': '),
                  Text(
                    "${user!.patientBirthSex!.birthSexName}",
                    style: Style.alltext_default_balck,
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      'Phone',
                      style: Style.alltext_default_balck,
                    ),
                  ),
                  Text(': '),
                  Text(
                    "${user!.patientMobilePhone}",
                    style: Style.alltext_default_balck,
                  )
                ],
              ),
            ),
            user!.patientEmail != 'null'
                ? Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            'Email',
                            style: Style.alltext_default_balck,
                          ),
                        ),
                        Text(': '),
                        Text(
                          "${user!.patientEmail}",
                          style: Style.alltext_default_balck,
                        )
                      ],
                    ),
                  )
                : Container(),
            user!.patientAddress1 != 'null'
                ? Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Text(
                            'Address',
                            style: Style.alltext_default_balck,
                          ),
                        ),
                        Text(': '),
                        Text(
                          "${user!.patientAddress1}",
                          style: Style.alltext_default_balck,
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
