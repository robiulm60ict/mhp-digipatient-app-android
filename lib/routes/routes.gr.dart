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
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../view/authentications/create_account_view.dart' as _i7;
import '../view/authentications/sign_in_view.dart' as _i3;
import '../view/authentications/sign_up_view.dart' as _i4;
import '../view/bottom_navigation_buttons/basket_view.dart' as _i13;
import '../view/bottom_navigation_buttons/favourites_view.dart' as _i12;
import '../view/bottom_navigation_buttons/home_view.dart' as _i10;
import '../view/bottom_navigation_buttons/set_appointment_view.dart' as _i11;
import '../view/dashboard.dart' as _i9;
import '../view/notifications_view.dart' as _i8;
import '../view/onbording_view.dart' as _i5;
import '../view/pincode_verification_view.dart' as _i6;
import '../view/splash_view.dart' as _i1;
import '../view/splash_view_2.dart' as _i2;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    Splash2Route.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Splash2View(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingView(),
      );
    },
    PinCodeVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeVerificationRouteArgs>(
          orElse: () => const PinCodeVerificationRouteArgs());
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PinCodeVerificationView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccountView(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.NotificationsView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.DashboardView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.HomeView(),
      );
    },
    SetAppointmentRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.SetAppointmentView(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.FavouritesView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.BasketView(),
      );
    },
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i14.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i14.RouteConfig(
          Splash2Route.name,
          path: '/splash',
        ),
        _i14.RouteConfig(
          SignInRoute.name,
          path: '/sign-in',
        ),
        _i14.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i14.RouteConfig(
          OnBoardingRoute.name,
          path: '/onBoarding',
        ),
        _i14.RouteConfig(
          PinCodeVerificationRoute.name,
          path: '/pinCode',
        ),
        _i14.RouteConfig(
          CreateAccountRoute.name,
          path: '/create-account',
        ),
        _i14.RouteConfig(
          NotificationsRoute.name,
          path: '/notification',
        ),
        _i14.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i14.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i14.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashboardRoute.name,
            ),
            _i14.RouteConfig(
              SetAppointmentRoute.name,
              path: 'set-appointments',
              parent: DashboardRoute.name,
            ),
            _i14.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites',
              parent: DashboardRoute.name,
            ),
            _i14.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Splash2View]
class Splash2Route extends _i14.PageRouteInfo<void> {
  const Splash2Route()
      : super(
          Splash2Route.name,
          path: '/splash',
        );

  static const String name = 'Splash2Route';
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i14.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingRoute extends _i14.PageRouteInfo<void> {
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
    extends _i14.PageRouteInfo<PinCodeVerificationRouteArgs> {
  PinCodeVerificationRoute({
    _i15.Key? key,
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

  final _i15.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'PinCodeVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.CreateAccountView]
class CreateAccountRoute extends _i14.PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(
          CreateAccountRoute.name,
          path: '/create-account',
        );

  static const String name = 'CreateAccountRoute';
}

/// generated route for
/// [_i8.NotificationsView]
class NotificationsRoute extends _i14.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i9.DashboardView]
class DashboardRoute extends _i14.PageRouteInfo<void> {
  const DashboardRoute({List<_i14.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i10.HomeView]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i11.SetAppointmentView]
class SetAppointmentRoute extends _i14.PageRouteInfo<void> {
  const SetAppointmentRoute()
      : super(
          SetAppointmentRoute.name,
          path: 'set-appointments',
        );

  static const String name = 'SetAppointmentRoute';
}

/// generated route for
/// [_i12.FavouritesView]
class FavouritesRoute extends _i14.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i13.BasketView]
class BasketRoute extends _i14.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}
