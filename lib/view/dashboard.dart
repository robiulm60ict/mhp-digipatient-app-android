import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:digi_patient/view/profile/patient_profile.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';
import '../resources/colors.dart';
import 'bottom_navigation_buttons/basket_view.dart';
import 'bottom_navigation_buttons/favourites_view.dart';
import 'bottom_navigation_buttons/home_view.dart';
import 'daily_upcomming_appointment/daily_and_upcomming_appointments_view.dart';
import 'tutrials/tutrials_category.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;

  int get tabIndex => _tabIndex;

  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: _tabIndex);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: [
          // Icon(Icons.person, color: Colors.deepPurple),
          Icon(Icons.home, color: AppColors.primary_color),
          Icon(Icons.video_collection, color: AppColors.primary_color),
          Image.asset(
            Assets.iconsDrawer,
            height: 100,
            width: 100,
          ),
          Icon(Icons.favorite, color: AppColors.primary_color),
          Icon(Icons.notification_add, color: AppColors.primary_color),
          Icon(Icons.person, color: AppColors.primary_color),
        ],
        inactiveIcons: [
          // Text("My"),
          Icon(Icons.home, color: AppColors.primary_color),
          Icon(Icons.video_collection, color: AppColors.primary_color),
          Image.asset(
            Assets.iconsDrawer,
            height: 100,
            width: 100,
          ),
          Icon(Icons.favorite, color: AppColors.primary_color),
          Icon(Icons.notification_add, color: AppColors.primary_color),
          Icon(Icons.person, color: AppColors.primary_color),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 2, right: 2, bottom: 0),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 6,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: [
          HomeView(),
          TutrialsCategory(),
          BasketView(),
          FavouritesView(),
          DailyAndUpcommingView(),
          ProfileData()
        ],
      ),
    );
  }
}
// class DashboardView extends StatefulWidget {
//   const DashboardView({Key? key}) : super(key: key);
//
//   @override
//   State<DashboardView> createState() => _DashboardViewState();
// }
//
// class _DashboardViewState extends State<DashboardView> {
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     Color iconColor = Colors.grey;
//
//     return Scaffold(
//       // extendBody: true,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){},
//         mini: true,
//         child: Icon(Icons.add),
//       ),
//       body: _getPage(_selectedIndex),
//       bottomNavigationBar:BottomAppBar(
//         child:  BottomNavigationBar(
//           currentIndex: _selectedIndex,
//           selectedItemColor: AppColors.primaryColor,
//           unselectedItemColor: iconColor,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_filled),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.play_circle),
//               label: 'Favorites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite_border),
//               label: 'Favorites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_basket_outlined),
//               label: 'Shopping',
//             ),
//           ],
//         ),
//       )
//     );
//   }
//
//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return HomeView(); // Replace HomeView with your actual home page widget
//       case 1:
//         return TutrialsCategory(); // Replace DateView with your actual date page widget
//       case 2:
//         return FavoritesView(); // Replace FavoritesView with your actual favorites page widget
//       case 3:
//         return FavoritesView(); // Replace ShoppingView with your actual shopping page widget
//       default:
//         return Container();
//     }
//   }
// }
//
// class FavoritesView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text('Favorites Page'),
//       ),
//     );
//   }
// }
