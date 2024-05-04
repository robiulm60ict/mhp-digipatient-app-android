import 'dart:io';
import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:digi_patient/view/daily_upcomming_appointment/daily_and_upcomming_appointments_view.dart';
import 'package:digi_patient/view/myClinic/myclinic_our_servic/lab_view/brance_mylab_view.dart';
import 'package:digi_patient/view/myClinic/myclinic_our_servic/lab_view/myclinic_appoinment_view.dart';
import 'package:digi_patient/view/notifications_view.dart';
import 'package:digi_patient/view/payment/invoice_view.dart';
import 'package:digi_patient/view/tutrials/tutrials_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterzilla_fixed_grid/flutterzilla_fixed_grid.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/assets.dart';
import '../../login_service.dart';
import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/message.dart';
import '../../utils/route/routes_name.dart';
import '../../utils/user.dart';
import '../../view_model/auth_view_model.dart';
import '../../view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import '../../view_model/home_view_model.dart';
import '../../view_model/mydoctor/new_my_doctor_view_model.dart';
import '../../view_model/push_notification/notification_service.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/drawer_list_tile.dart';
import '../../widgets/shimmer.dart';
import '../daily_upcomming_appointment/appoinment_catagory.dart';
import '../daily_upcomming_appointment/patientqueioo.dart';
import '../mypayment_view/mypayment_view.dart';
import '../mypayment_view/payment_catagory.dart';
import '../privacy_policy/privacypolicy.dart';
import '../profile/patient_profile.dart';
import '../support/support_page.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  String? name = "";
  String? gender = "";
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    //  getUserData();
    onUserLogin();
    context.read<UserViewModel>().getUserDetails(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DailyAndUpcommingViewModel>().getTodayAppointments(context);
      context
          .read<DailyAndUpcommingViewModel>()
          .getUpcommingAppointments(context);
    });

    notificationService.requestPermission();
    notificationService.getToken();
    notificationService.getDeviceToken();
    notificationService.isTokenrefresh();

    notificationService.firbaseInit(context);
    notificationService.setupInteractMessage(context);
    //notificationService.getToken();
    notificationService.messaging.getToken().then((value) {});
  }

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString(UserP.name) ?? "";
    gender = prefs.getString(UserP.gender) ?? "";
    print(gender);
    bool isLoggedIn = prefs.getBool(UserP.isLoggedIn) ?? false;

    String role = prefs.getString(UserP.role) ?? "";

    // if (isLoggedIn) {
    //   context.read<AuthViewModel>().onUserLogin();
    // } else {
    //   context.read<AuthViewModel>().onUserLogout();
    // }
  }

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = (size.width / 2);
    debugPrint(size.width.toString());

    final user = Provider.of<UserViewModel>(context).user;
    final auth = Provider.of<AuthViewModel>(context, listen: false);
    final appointments = Provider.of<DailyAndUpcommingViewModel>(context);
    final dvm = Provider.of<MyDoctorDelaisViewModel>(context, listen: false);

    return WillPopScope(
      onWillPop: () async {
        // Show exit confirmation dialog
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return MyExitConfirmationDialog();
          },
        );

        return exit ?? false;
      },
      child: SafeArea(
        top: true,
        maintainBottomViewPadding: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true,
          drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.75,
            shape: OutlineInputBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(40.w)),
              borderSide: BorderSide.none,
            ),
            child: ListView(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
              shrinkWrap: true,
              children: [
                // Row(
                //   children: [
                //     const CustomBackButton(
                //       margin: 0,
                //       padding: 8,
                //     ),
                //     Expanded(
                //         child: Text(
                //       "Menu",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           fontSize: 18.sp,
                //           fontWeight: FontWeight.bold,
                //           color: AppColors.primaryColor),
                //     )),
                //   ],
                // ),

                Consumer<UserViewModel>(
                    builder: (context, userprovider, child) {
                  if (userprovider.userData.isEmpty) {
                    return userprovider.isUserLoading == true
                        ? Center(
                            child: ListView.builder(
                              itemCount: 1,
                              scrollDirection: Axis.vertical,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: bannerShimmereffect(
                                      80.toDouble(), 400.toDouble()),
                                );
                              },
                            ),
                          )
                        : noDataFounForList("");
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        userprovider.user?.patientImages.toString() == "null"
                            ? SizedBox(
                                //height: 110,
                                // width: 90.w,
                                child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(Assets.dummy_image),
                              ))
                            : SizedBox(
                                // height: 110,
                                // width: 90.w,
                                child: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  "${AppUrls.image}${userprovider.user?.patientImages}",
                                ),
                              )

                                // Image.network(
                                //
                                //   height: 110,
                                //   width: 90.w,
                                //   fit: BoxFit.fill,
                                // ),
                                ),
                        Style.distan_size10,
                        Text(
                          "${user?.patientFirstName} ${user?.patientLastName}"
                              .toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: const Color(0xFF454545)),
                        ),
                        Style.distan_size5,
                        Text(
                          "${user?.patientEmail}".toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: const Color(0xFF454545)),
                        ),
                      ],
                    );
                  }
                }),
                Style.distan_size15,
                DrawerListTile(
                  iconData: Icons.person,
                  title: "Personal details",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileData()));
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailView(user: user)));
                  },
                ),
                Style.distan_size2,
                DrawerListTile(
                  iconData: Icons.calendar_view_day,
                  title: "Appointment",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppoinmentCatagoryView()));

                    // context.router.push(const DailyAndUpcommingRoute());
                  },
                ),
                Style.distan_size2,
                DrawerListTile(
                  iconData: Icons.payment,
                  title: "Payment details",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentCatagoryView()));
                    //  context.router.push(const InvoiceRoute());
                  },
                ),

                Style.distan_size2,  DrawerListTile(
                  iconData: Icons.payment,
                  title: "Lab details",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MyClinicLabView()));
                    //  context.router.push(const InvoiceRoute());
                  },
                ),

                Style.distan_size2,
                DrawerListTile(
                  iconData: Icons.video_collection,
                  title: "User GridLine",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TutrialsCategory()));
                  },
                ),
                Style.distan_size2,
                DrawerListTile(
                  iconData: Icons.support,
                  title: "Support",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SupportPage()));
                  },
                ),
                Style.distan_size2,
                DrawerListTile(
                  iconData: Icons.privacy_tip,
                  title: "Privacy & Policy",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PrivacyPolicy()));
                  },
                ),
                Style.distan_size2,
                Card(
                  color: AppColors.primaryColor,
                  child: ListTile(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();

                      await prefs.setBool(UserP.isLoggedIn, false);
                      int? id = prefs.getInt(UserP.userid);

                      auth.onUserLogout();
                      auth.logout(id);
                      logout();

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.login,
                        (route) => false,
                      );
                      //  context.router.replace(const SignInRoute());
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.logout,
                        size: 15.h,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "V 1.1.9(16)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFFAAAAAA)),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Builder(builder: (context) {
              return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  Assets.iconsDrawer,
                  height: 100,
                  width: 100,
                ),
              );
            }),
            title: Container(
              height: 45.h,
              // width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesMacroHealthPlus))),
            ),
            actions: [
              badges.Badge(
                  position: BadgePosition.topEnd(top: 4, end: 0),
                  badgeContent: Text(
                    "${int.parse(appointments.todayAppointmentList.length.toString()) + int.parse(appointments.upcommingAppointmentList.length.toString())}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationsView()));
                        //  context.router.push(const NotificationsRoute());
                      },
                      icon: Icon(
                        Icons.notification_important,
                        color: AppColors.primaryColor,
                        size: 44,
                      ))),
              SizedBox(
                width: 18.w,
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            children: [
              Container(
                height: 110.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    //     image: AssetImage(Assets.imagesWelcomeBackground))
                    ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Consumer<UserViewModel>(
                        builder: (context, userprovider, child) {
                      if (userprovider.userData.isEmpty) {
                        return userprovider.isUserLoading == true
                            ? Center(
                                child: ListView.builder(
                                  itemCount: 1,
                                  scrollDirection: Axis.vertical,
                                  physics: const ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: bannerShimmereffect(
                                          120.toDouble(), 400.toDouble()),
                                    );
                                  },
                                ),
                              )
                            : noDataFounForList("");
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            userprovider.user?.patientImages.toString() ==
                                    "null"
                                ? SizedBox(
                                    //height: 110,
                                    // width: 90.w,
                                    child: const CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage(Assets.dummy_image),
                                  ))
                                : SizedBox(
                                    // height: 110,
                                    // width: 90.w,
                                    child: CircleAvatar(
                                    radius: 40,
                                    backgroundImage: NetworkImage(
                                      "${AppUrls.image}${userprovider.user?.patientImages}",
                                    ),
                                  )

                                    // Image.network(
                                    //
                                    //   height: 110,
                                    //   width: 90.w,
                                    //   fit: BoxFit.fill,
                                    // ),
                                    ),
                            Style.widthdistan_size10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18.sp,
                                      color: AppColors.primaryColor),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "${user?.patientFirstName} ${user?.patientLastName}"
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                      color: const Color(0xFF454545)),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  "Welcome to MacroHealthPlus",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: const Color(0xFF7A7A7A),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    }),
                  ),
                ),
              ),

              Consumer<HomeViewModel>(builder: (context, data, child) {
                return Container(
                  width: double.infinity,
                  child: CarouselSlider.builder(
                      itemCount: data.imgList.length,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = data.imgList[index];
                        return Card(
                          elevation: 3,
                          child: Container(
                            width: double.infinity,
                            color: AppColors.page_background_color,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                // ignore: prefer_interpolation_to_compose_strings
                                urlImage,
                                width: double.infinity,
                                height: 110.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        autoPlayAnimationDuration: Duration(seconds: 3),
                        viewportFraction: 1,
                        height: MediaQuery.of(context).size.height * .18,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                      )),
                );
              }),

              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => PatientQueioPage()));
              //     },
              //     child: Text("date")),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "What services do you need?",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF8A8A8A)),
              ),

              SizedBox(
                height: 4.h,
              ),
              Consumer<HomeViewModel>(builder: (context, provider, child) {
                return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: FlutterzillaFixedGridView(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 10,
                        height: 80.h),
                    itemCount: provider.homeItemsList.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            dvm.getmyAllDoctors(context);
                            dvm.getmyAllDeactiveDoctors(context);
                          }

                          provider.homeItemsRouteTo(context, index);
                        },
                        child: Card(
                          elevation: 4,
                          shadowColor: AppColors.primary_color,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  // height: 75.h,
                                  // width: 75.w,
                                  child: CircleAvatar(
                                    radius: 35,
                                    child: Image.asset(
                                      provider.homeItemsList[index].image,
                                    ),
                                    // backgroundImage:AssetImage(
                                    //   provider.homeItemsList[index].image,
                                    // ),
                                  ),
                                ),
                                Style.widthdistan_size10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      provider.homeItemsList[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: Style.alltext_Large_black,
                                    ),
                                    Style.distan_size5,
                                    Text(
                                      "Find your own clinics from app",
                                      style: Style.alltext_default_balck,
                                    )
                                  ],
                                ),
                                Style.widthdistan_size20,
                                Image.asset("assets/icons/home/homebutton.png")
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
              SizedBox(
                height: 50.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exit App?'),
      content: Text('Are you sure you want to exit the app?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // Dismiss the dialog
          },
          child: Text('No'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            exit(0);
            // Dismiss the dialog and return true
          },
          child: Text('Yes'),
        ),
      ],
    );
  }
}
