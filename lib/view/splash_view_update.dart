import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../generated/assets.dart';
import '../utils/route/routes_name.dart';
import '/resources/colors.dart';

class SplashViewUpdate extends StatefulWidget {
  const SplashViewUpdate({Key? key}) : super(key: key);

  @override
  State<SplashViewUpdate> createState() => _SplashViewUpdateState();
}

class _SplashViewUpdateState extends State<SplashViewUpdate> {
  // SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    showDialog();

    Timer(const Duration(seconds: 3), () {
      navigateUser();
    });
  }

  navigateUser() async {
    final prefs = await SharedPreferences.getInstance();

    bool isLoggedIn = prefs.getBool(UserP.isLoggedIn) ?? false;

    String role = prefs.getString(UserP.role) ?? "";

    if (isLoggedIn && role.toLowerCase() == "patient") {
      Navigator.pushNamed(context, RoutesName.dashbord);
      // context.router.replace(const DashboardRoute());
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => DashboardView()),
      // );
    } else {
      Navigator.pushNamed(context, RoutesName.onbording);

      //context.router.push(const OnBoardingRoute());
    }
  }
  showDialog() async {
    await Future.delayed(const Duration(milliseconds: 50), () async {
      return await showAdaptiveDialog(
          context: context,
          builder: (context){
            return CupertinoAlertDialog(
              title: const Text('Confirmation'),
              content: const Text('You can now update app'),
              actions: [
                TextButton(
                    onPressed: (){
                      InAppUpdate.performImmediateUpdate();
                    },
                    child: const Text('Update')
                ),
                TextButton(
                    onPressed: ()=> Navigator.pop(context),
                    child: const Text('Maybe Later')
                ),
              ],
            );
          }
      );
    });
  }


  Duration duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //    color: AppColors.page_background_color,
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         begin: Alignment.topCenter,
        //         end: Alignment.bottomCenter,
        //         colors: [
        //       AppColors.linearGradient1,
        //       AppColors.linearGradient2,
        //     ],),),

        child: Stack(
          alignment: Alignment.center,
          children: [
            // PageTransition(child: Image.asset(Assets.logoWhite), type: PageTransitionType.bottomToTop)
            TweenAnimationBuilder(
                curve: Curves.bounceInOut,
                tween: Tween<double>(begin: 70, end: 300),
                duration: const Duration(seconds: 2),
                builder: (BuildContext context, double value, Widget? child) {
                  return Image.asset(
                    Assets.imagesLogoGreen,
                    height: value,
                    width: value,
                  );
                }),

            Positioned(
              bottom: 60,
              child: AnimatedTextKit(animatedTexts: [
                RotateAnimatedText('Android',
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.green),
                    duration: duration),
                RotateAnimatedText('ios',
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.green),
                    duration: duration),
                RotateAnimatedText('Web',
                    textStyle: TextStyle(fontSize: 20.sp, color: Colors.green),
                    duration: duration),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
