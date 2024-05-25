import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../dashboard.dart';
import '../../view/authentications/sign_in_view.dart';
import '../../view/bottom_navigation_buttons/home_view.dart';
import '../../view/onbording_view.dart';
import '../../view/splash_view.dart';
import '../../view/splash_view_update.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
 case RoutesName.splashupdate:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  SplashViewUpdate());

      case RoutesName.onbording:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnBoardingView());

      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignInView());
      case RoutesName.dashbord:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  DashboardView());


      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
