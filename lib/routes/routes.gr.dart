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
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/material.dart' as _i24;

import '../view/anatomy/anatomy_view.dart' as _i18;
import '../view/appointment/book_appointment_view.dart' as _i15;
import '../view/authentications/create_account_view.dart' as _i7;
import '../view/authentications/sign_in_view.dart' as _i3;
import '../view/authentications/sign_up_view.dart' as _i4;
import '../view/bottom_navigation_buttons/basket_view.dart' as _i22;
import '../view/bottom_navigation_buttons/favourites_view.dart' as _i21;
import '../view/bottom_navigation_buttons/home_view.dart' as _i19;
import '../view/bottom_navigation_buttons/set_appointment_view.dart' as _i20;
import '../view/dashboard.dart' as _i8;
import '../view/home_item_pages/my_doctor_view.dart' as _i10;
import '../view/home_item_pages/my_record_view.dart' as _i11;
import '../view/my_doctor_category_views/all_doctor_search_view.dart' as _i13;
import '../view/my_doctor_category_views/doc_details_view.dart' as _i14;
import '../view/my_doctor_category_views/my_doctor_category_wise_view.dart'
    as _i12;
import '../view/notifications_view.dart' as _i9;
import '../view/onbording_view.dart' as _i5;
import '../view/payment/invoice_view.dart' as _i17;
import '../view/payment/payment_method_view.dart' as _i16;
import '../view/pincode_verification_view.dart' as _i6;
import '../view/splash_view.dart' as _i1;
import '../view/splash_view_2.dart' as _i2;

class AppRouter extends _i23.RootStackRouter {
  AppRouter([_i24.GlobalKey<_i24.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    Splash2Route.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Splash2View(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingView(),
      );
    },
    PinCodeVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeVerificationRouteArgs>(
          orElse: () => const PinCodeVerificationRouteArgs());
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PinCodeVerificationView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccountView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardView(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotificationsView(),
      );
    },
    MyDoctorRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MyDoctorView(),
      );
    },
    MyRecordRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.MyRecordView(),
      );
    },
    MyDoctorCategoryWiseRoute.name: (routeData) {
      final args = routeData.argsAs<MyDoctorCategoryWiseRouteArgs>();
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.MyDoctorCategoryWiseView(
          key: args.key,
          categoryName: args.categoryName,
        ),
      );
    },
    AllDoctorSearchRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AllDoctorSearchView(),
      );
    },
    DocDetailsRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.DocDetailsView(),
      );
    },
    BookAppointmentRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.BookAppointmentView(),
      );
    },
    PaymentMethodRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentMethodView(),
      );
    },
    InvoiceRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.InvoiceView(),
      );
    },
    AnatomyRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.AnatomyView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.HomeView(),
      );
    },
    SetAppointmentRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.SetAppointmentView(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.FavouritesView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.BasketView(),
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i23.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i23.RouteConfig(
          Splash2Route.name,
          path: '/splash',
        ),
        _i23.RouteConfig(
          SignInRoute.name,
          path: '/sign-in',
        ),
        _i23.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i23.RouteConfig(
          OnBoardingRoute.name,
          path: '/onBoarding',
        ),
        _i23.RouteConfig(
          PinCodeVerificationRoute.name,
          path: '/pinCode',
        ),
        _i23.RouteConfig(
          CreateAccountRoute.name,
          path: '/create-account',
        ),
        _i23.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i23.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i23.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashboardRoute.name,
            ),
            _i23.RouteConfig(
              SetAppointmentRoute.name,
              path: 'set-appointments',
              parent: DashboardRoute.name,
            ),
            _i23.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites',
              parent: DashboardRoute.name,
            ),
            _i23.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i23.RouteConfig(
          NotificationsRoute.name,
          path: '/notification',
        ),
        _i23.RouteConfig(
          MyDoctorRoute.name,
          path: '/my-doctor',
        ),
        _i23.RouteConfig(
          MyRecordRoute.name,
          path: '/my-record',
        ),
        _i23.RouteConfig(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
        ),
        _i23.RouteConfig(
          AllDoctorSearchRoute.name,
          path: '/all-doctor-search',
        ),
        _i23.RouteConfig(
          DocDetailsRoute.name,
          path: '/doc-detail',
        ),
        _i23.RouteConfig(
          BookAppointmentRoute.name,
          path: '/book-appointment',
        ),
        _i23.RouteConfig(
          PaymentMethodRoute.name,
          path: '/payment-method',
        ),
        _i23.RouteConfig(
          InvoiceRoute.name,
          path: '/invoice',
        ),
        _i23.RouteConfig(
          AnatomyRoute.name,
          path: '/anatomy',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i23.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Splash2View]
class Splash2Route extends _i23.PageRouteInfo<void> {
  const Splash2Route()
      : super(
          Splash2Route.name,
          path: '/splash',
        );

  static const String name = 'Splash2Route';
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i23.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i23.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingRoute extends _i23.PageRouteInfo<void> {
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
    extends _i23.PageRouteInfo<PinCodeVerificationRouteArgs> {
  PinCodeVerificationRoute({
    _i24.Key? key,
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

  final _i24.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'PinCodeVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.CreateAccountView]
class CreateAccountRoute extends _i23.PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(
          CreateAccountRoute.name,
          path: '/create-account',
        );

  static const String name = 'CreateAccountRoute';
}

/// generated route for
/// [_i8.DashboardView]
class DashboardRoute extends _i23.PageRouteInfo<void> {
  const DashboardRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i9.NotificationsView]
class NotificationsRoute extends _i23.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i10.MyDoctorView]
class MyDoctorRoute extends _i23.PageRouteInfo<void> {
  const MyDoctorRoute()
      : super(
          MyDoctorRoute.name,
          path: '/my-doctor',
        );

  static const String name = 'MyDoctorRoute';
}

/// generated route for
/// [_i11.MyRecordView]
class MyRecordRoute extends _i23.PageRouteInfo<void> {
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
    extends _i23.PageRouteInfo<MyDoctorCategoryWiseRouteArgs> {
  MyDoctorCategoryWiseRoute({
    _i24.Key? key,
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

  final _i24.Key? key;

  final String categoryName;

  @override
  String toString() {
    return 'MyDoctorCategoryWiseRouteArgs{key: $key, categoryName: $categoryName}';
  }
}

/// generated route for
/// [_i13.AllDoctorSearchView]
class AllDoctorSearchRoute extends _i23.PageRouteInfo<void> {
  const AllDoctorSearchRoute()
      : super(
          AllDoctorSearchRoute.name,
          path: '/all-doctor-search',
        );

  static const String name = 'AllDoctorSearchRoute';
}

/// generated route for
/// [_i14.DocDetailsView]
class DocDetailsRoute extends _i23.PageRouteInfo<void> {
  const DocDetailsRoute()
      : super(
          DocDetailsRoute.name,
          path: '/doc-detail',
        );

  static const String name = 'DocDetailsRoute';
}

/// generated route for
/// [_i15.BookAppointmentView]
class BookAppointmentRoute extends _i23.PageRouteInfo<void> {
  const BookAppointmentRoute()
      : super(
          BookAppointmentRoute.name,
          path: '/book-appointment',
        );

  static const String name = 'BookAppointmentRoute';
}

/// generated route for
/// [_i16.PaymentMethodView]
class PaymentMethodRoute extends _i23.PageRouteInfo<void> {
  const PaymentMethodRoute()
      : super(
          PaymentMethodRoute.name,
          path: '/payment-method',
        );

  static const String name = 'PaymentMethodRoute';
}

/// generated route for
/// [_i17.InvoiceView]
class InvoiceRoute extends _i23.PageRouteInfo<void> {
  const InvoiceRoute()
      : super(
          InvoiceRoute.name,
          path: '/invoice',
        );

  static const String name = 'InvoiceRoute';
}

/// generated route for
/// [_i18.AnatomyView]
class AnatomyRoute extends _i23.PageRouteInfo<void> {
  const AnatomyRoute()
      : super(
          AnatomyRoute.name,
          path: '/anatomy',
        );

  static const String name = 'AnatomyRoute';
}

/// generated route for
/// [_i19.HomeView]
class HomeRoute extends _i23.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i20.SetAppointmentView]
class SetAppointmentRoute extends _i23.PageRouteInfo<void> {
  const SetAppointmentRoute()
      : super(
          SetAppointmentRoute.name,
          path: 'set-appointments',
        );

  static const String name = 'SetAppointmentRoute';
}

/// generated route for
/// [_i21.FavouritesView]
class FavouritesRoute extends _i23.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i22.BasketView]
class BasketRoute extends _i23.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}
