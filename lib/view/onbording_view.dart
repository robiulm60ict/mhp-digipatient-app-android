import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onboarding/onboarding.dart';

import '../utils/route/routes_name.dart';

TextStyle pageTitleTextStyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryColor);
TextStyle pageBodyTextStyle = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor);

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late Material materialButton;
  late int index;
  final onBoardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 30.0,
                ),
                child: Image.asset(
                  Assets.imagesOb1,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Text(
                  'Healthcare at a Click',
                  style: pageTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.0.h),
                child: Text(
                  'Smart Scheduling Solutions',
                  style: pageBodyTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 30.0,
                ),
                child: Image.asset(
                  Assets.imagesOb2,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Text(
                  'Unified Health Management',
                  style: pageTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.0.h),
                child: Text(
                  'Vital Signs to Vital Decisions ',
                  style: pageBodyTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.0,
            color: Colors.white,
          ),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 45.0.w,
                  vertical: 90.0.h,
                ),
                child: Image.asset(
                  Assets.imagesOb3,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Text(
                  'Health in Harmony',
                  style: pageTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.0.h),
                child: Text(
                  'Monitor, Record, Learn, Schedule',
                  style: pageBodyTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: AppColors.primaryColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: const Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: AppColors.primaryColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
          Navigator.pushNamed(context, RoutesName.login);
          //  AutoRouter.of(context).replace(const SignInRoute());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
          child: const Text(
            'Sign In',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onBoardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return ColoredBox(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIndicator(
                    netDragPercent: dragDistance,
                    pagesLength: pagesLength,
                    indicator: Indicator(
                      activeIndicator:
                          ActiveIndicator(color: AppColors.primaryColor),
                      closedIndicator: ClosedIndicator(
                        color: AppColors.primaryColor,
                      ),
                      indicatorDesign: IndicatorDesign.polygon(
                        polygonDesign: PolygonDesign(
                          polygon: DesignType.polygon_circle,
                        ),
                      ),
                    ),
                  ),
                  index == pagesLength - 1
                      ? _signupButton
                      : _skipButton(setIndex: setIndex)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
