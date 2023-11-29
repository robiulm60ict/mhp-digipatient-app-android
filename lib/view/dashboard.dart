import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/colors.dart';
import '../routes/routes.gr.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  bool initial = false;
  @override
  void initState() {
    super.initState();
    // setDefaultIndexButton();
    initial = true;
    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   final tabsRouter = AutoTabsRouter.of(context);
    //   tabsRouter.setActiveIndex(2);
    //
    // });
  // }

  // setDefaultIndexButton(BuildContext context){
  //   WidgetsBinding.instance.addPostFrameCallback((_){
  //     final tabsRouter = AutoTabsRouter.of(context);
  //     tabsRouter.setActiveIndex(2);
  //
  //   });
    // tabsRouter.setActiveIndex(2);
  }
  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.grey;
    return AutoTabsRouter(
      routes: const [
        // HomeRoute(),
        // SetAppointmentRoute(),
        // FavouritesRoute(),
        // BasketRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        // setDefaultIndexButton(context);
        // tabsRouter.setActiveIndex(2);
        return Scaffold(
          extendBody: true,
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: CurvedNavigationBar(

            items: <Widget>[
              Icon(
                Icons.home_filled,
                size: 30.h,
                color: tabsRouter.activeIndex == 0
                    ? AppColors.primaryColor
                    : iconColor,
              ),
              Icon(
                Icons.date_range_outlined,
                size: 30.h,
                color: tabsRouter.activeIndex == 1
                    ? AppColors.primaryColor
                    : iconColor,
              ),
              Icon(
                Icons.favorite_border,
                size: 30.h,
                color: tabsRouter.activeIndex == 2
                    ? AppColors.primaryColor
                    : iconColor,
              ),
              Icon(
                Icons.shopping_basket_outlined,
                size: 30.h,
                color: tabsRouter.activeIndex == 3
                    ? AppColors.primaryColor
                    : iconColor,
              ),
            ],
            backgroundColor: Colors.transparent,
            onTap: tabsRouter.setActiveIndex,
            index: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}

// class DashboardView extends StatelessWidget {
//   const DashboardView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: SalomonBottomBar(
//         items: [
//             SalomonBottomBarItem(icon: Icon(Icons.home, size: 25.h,), title: Text('Home')),
//             SalomonBottomBarItem(icon: Icon(Icons.person, size: 25.h,), title: Text('Profile')),
//           ],
//             currentIndex: 1,
//                 onTap: (index){
//
//                 },
//             unselectedItemColor: AppColors.greyColor,
//           ),
//     );
//   }
// }
