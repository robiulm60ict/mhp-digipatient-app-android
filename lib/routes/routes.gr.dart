// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

import '../view/authentications/create_account_view.dart' as _i7;
import '../view/authentications/sign_in_view.dart' as _i3;
import '../view/authentications/sign_up_view.dart' as _i4;
import '../view/bottom_navigation_buttons/basket_view.dart' as _i16;
import '../view/bottom_navigation_buttons/favourites_view.dart' as _i15;
import '../view/bottom_navigation_buttons/home_view.dart' as _i13;
import '../view/bottom_navigation_buttons/set_appointment_view.dart' as _i14;
import '../view/dashboard.dart' as _i8;
import '../view/home_item_pages/my_doctor_view.dart' as _i10;
import '../view/home_item_pages/my_record_view.dart' as _i11;
import '../view/my_doctor_category_views/my_doctor_category_wise_view.dart'
    as _i12;
import '../view/notifications_view.dart' as _i9;
import '../view/onbording_view.dart' as _i5;
import '../view/pincode_verification_view.dart' as _i6;
import '../view/splash_view.dart' as _i1;
import '../view/splash_view_2.dart' as _i2;

class AppRouter extends _i17.RootStackRouter {
  AppRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    Splash2Route.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Splash2View(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingView(),
      );
    },
    PinCodeVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeVerificationRouteArgs>(
          orElse: () => const PinCodeVerificationRouteArgs());
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PinCodeVerificationView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccountView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardView(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotificationsView(),
      );
    },
    MyDoctorRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MyDoctorView(),
      );
    },
    MyRecordRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.MyRecordView(),
      );
    },
    MyDoctorCategoryWiseRoute.name: (routeData) {
      final args = routeData.argsAs<MyDoctorCategoryWiseRouteArgs>();
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.MyDoctorCategoryWiseView(
          key: args.key,
          categoryName: args.categoryName,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.HomeView(),
      );
    },
    SetAppointmentRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.SetAppointmentView(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.FavouritesView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i17.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.BasketView(),
      );
    },
  };

  @override
  List<_i17.RouteConfig> get routes => [
        _i17.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i17.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i17.RouteConfig(
          Splash2Route.name,
          path: '/splash',
        ),
        _i17.RouteConfig(
          SignInRoute.name,
          path: '/sign-in',
        ),
        _i17.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i17.RouteConfig(
          OnBoardingRoute.name,
          path: '/onBoarding',
        ),
        _i17.RouteConfig(
          PinCodeVerificationRoute.name,
          path: '/pinCode',
        ),
        _i17.RouteConfig(
          CreateAccountRoute.name,
          path: '/create-account',
        ),
        _i17.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i17.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i17.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashboardRoute.name,
            ),
            _i17.RouteConfig(
              SetAppointmentRoute.name,
              path: 'set-appointments',
              parent: DashboardRoute.name,
            ),
            _i17.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites',
              parent: DashboardRoute.name,
            ),
            _i17.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i17.RouteConfig(
          NotificationsRoute.name,
          path: '/notification',
        ),
        _i17.RouteConfig(
          MyDoctorRoute.name,
          path: '/my-doctor',
        ),
        _i17.RouteConfig(
          MyRecordRoute.name,
          path: '/my-record',
        ),
        _i17.RouteConfig(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i17.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Splash2View]
class Splash2Route extends _i17.PageRouteInfo<void> {
  const Splash2Route()
      : super(
          Splash2Route.name,
          path: '/splash',
        );

  static const String name = 'Splash2Route';
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i17.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i17.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingRoute extends _i17.PageRouteInfo<void> {
  const OnBoardingRoute()
      : super(
          OnBoardingRoute.name,
          path: '/onBoarding',
        );

  static const String name = 'OnBoardingRoute';
}

/// generated route for
/// [_i6.PinCodeVerificationView]
class PinCodeVerificationRoute
    extends _i17.PageRouteInfo<PinCodeVerificationRouteArgs> {
  PinCodeVerificationRoute({
    _i18.Key? key,
    String? phoneNumber,
  }) : super(
          PinCodeVerificationRoute.name,
          path: '/pinCode',
          args: PinCodeVerificationRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
          ),
        );

  static const String name = 'PinCodeVerificationRoute';
}

class PinCodeVerificationRouteArgs {
  const PinCodeVerificationRouteArgs({
    this.key,
    this.phoneNumber,
  });

  final _i18.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'PinCodeVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.CreateAccountView]
class CreateAccountRoute extends _i17.PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(
          CreateAccountRoute.name,
          path: '/create-account',
        );

  static const String name = 'CreateAccountRoute';
}

/// generated route for
/// [_i8.DashboardView]
class DashboardRoute extends _i17.PageRouteInfo<void> {
  const DashboardRoute({List<_i17.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i9.NotificationsView]
class NotificationsRoute extends _i17.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i10.MyDoctorView]
class MyDoctorRoute extends _i17.PageRouteInfo<void> {
  const MyDoctorRoute()
      : super(
          MyDoctorRoute.name,
          path: '/my-doctor',
        );

  static const String name = 'MyDoctorRoute';
}

/// generated route for
/// [_i11.MyRecordView]
class MyRecordRoute extends _i17.PageRouteInfo<void> {
  const MyRecordRoute()
      : super(
          MyRecordRoute.name,
          path: '/my-record',
        );

  static const String name = 'MyRecordRoute';
}

/// generated route for
/// [_i12.MyDoctorCategoryWiseView]
class MyDoctorCategoryWiseRoute
    extends _i17.PageRouteInfo<MyDoctorCategoryWiseRouteArgs> {
  MyDoctorCategoryWiseRoute({
    _i18.Key? key,
    required String categoryName,
  }) : super(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
          args: MyDoctorCategoryWiseRouteArgs(
            key: key,
            categoryName: categoryName,
          ),
        );

  static const String name = 'MyDoctorCategoryWiseRoute';
}

class MyDoctorCategoryWiseRouteArgs {
  const MyDoctorCategoryWiseRouteArgs({
    this.key,
    required this.categoryName,
  });

  final _i18.Key? key;

  final String categoryName;

  @override
  String toString() {
    return 'MyDoctorCategoryWiseRouteArgs{key: $key, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i13.HomeView]
class HomeRoute extends _i17.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i14.SetAppointmentView]
class SetAppointmentRoute extends _i17.PageRouteInfo<void> {
  const SetAppointmentRoute()
      : super(
          SetAppointmentRoute.name,
          path: 'set-appointments',
        );

  static const String name = 'SetAppointmentRoute';
}

/// generated route for
/// [_i15.FavouritesView]
class FavouritesRoute extends _i17.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i16.BasketView]
class BasketRoute extends _i17.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}
