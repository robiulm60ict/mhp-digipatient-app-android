import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../generated/assets.dart';
import '/resources/colors.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 6),
        (){
        // splashServices.checkAuthentication(context);
        // AutoRouter.of(context).replace(const LoginRoute());
        //   context.router.replace(const Splash2Route());
        //   context.router.push(const LoginRoute());
          context.router.push(const OnBoardingRoute());

        }
    );
  }

  Duration duration = const Duration(seconds: 1);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              AppColors.linearGradient1,
              AppColors.linearGradient2,
            ],),),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     // const Text("Splash Screen"),
        //     SizedBox(height: size.height / 2 - 50,),
        //     AnimatedContainer(duration: const Duration(seconds: 3),
        //     child: Image.asset(height: height.h, width: width.w, Assets.logo),
        //     ),
        //     SizedBox(height: 100),
        //     // Text(
        //     //   "Macro Health Plus",
        //     //   style: TextStyle(
        //     //       fontSize: 32.sp,
        //     //       color: const Color(0xFFFFFFFF),
        //     //       fontWeight: FontWeight.w700),
        //     // ),
        //     // const Spacer(),
        //     AnimatedTextKit(animatedTexts: [
        //       RotateAnimatedText('Android', textStyle: TextStyle(fontSize: 20.sp, color: Colors.white)),
        //       RotateAnimatedText('ios', textStyle: TextStyle(fontSize: 20.sp, color: Colors.white)),
        //       RotateAnimatedText('Web', textStyle: TextStyle(fontSize: 20.sp, color: Colors.white)),
        //     ]),
        //
        //
        //   ],
        // ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // PageTransition(child: Image.asset(Assets.logoWhite), type: PageTransitionType.bottomToTop)
            TweenAnimationBuilder(
                curve: Curves.bounceInOut,
                tween: Tween<double>(begin: 70, end: 300), duration: const Duration(seconds: 4),
                builder: (BuildContext context, double value, Widget? child){
              return Image.asset(Assets.imagesLogoWhite, height: value, width: value,);

                }),
            // SlideTransition(
            //     position: Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(),

            // Positioned(
            //   bottom: 150,
            //   child:
            //   SizedBox(
            //     width: 250.0,
            //     child: TextLiquidFill(
            //       text: 'Macro Helth Plus',
            //       waveColor: Colors.blueAccent,
            //       boxBackgroundColor: Colors.red,
            //       textStyle: TextStyle(
            //         fontSize: 32.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       boxHeight: 300.0,
            //     ),
            //   )
            // ),
            Positioned(
              bottom: 50,
              child:
            AnimatedTextKit(

                animatedTexts: [
                    RotateAnimatedText('Android', textStyle: TextStyle(fontSize: 20.sp, color: Colors.white), duration: duration ),
                    RotateAnimatedText('ios', textStyle: TextStyle(fontSize: 20.sp, color: Colors.white), duration: duration),
                    RotateAnimatedText('Web', textStyle: TextStyle(fontSize: 20.sp, color: Colors.white),duration: duration ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
