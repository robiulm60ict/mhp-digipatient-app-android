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
import 'package:auto_route/auto_route.dart' as _i30;
import 'package:flutter/material.dart' as _i31;

import '../model/doctor_model/doctors_model.dart' as _i32;
import '../view/anatomy/anatomy_view.dart' as _i18;
import '../view/appointment/book_appointment_view.dart' as _i15;
import '../view/authentications/create_account_view.dart' as _i7;
import '../view/authentications/sign_in_view.dart' as _i3;
import '../view/authentications/sign_up_view.dart' as _i4;
import '../view/bottom_navigation_buttons/basket_view.dart' as _i29;
import '../view/bottom_navigation_buttons/favourites_view.dart' as _i28;
import '../view/bottom_navigation_buttons/home_view.dart' as _i26;
import '../view/bottom_navigation_buttons/set_appointment_view.dart' as _i27;
import '../view/dashboard.dart' as _i8;
import '../view/home_item_pages/my_doctor_view.dart' as _i10;
import '../view/home_item_pages/my_record_view.dart' as _i11;
import '../view/my_doctor_category_views/all_doctor_search_view.dart' as _i13;
import '../view/my_doctor_category_views/doc_details_view.dart' as _i14;
import '../view/my_doctor_category_views/my_doctor_category_wise_view.dart'
    as _i12;
import '../view/my_record/my_medical_history_view.dart' as _i21;
import '../view/my_record/my_report_view.dart' as _i24;
import '../view/my_record/reason_for_visit_view.dart' as _i23;
import '../view/my_record/self_medical_history_from_great_doc_view.dart'
    as _i22;
import '../view/my_record/vital_view.dart' as _i20;
import '../view/my_record/vitals/vitals_item_details_view.dart' as _i25;
import '../view/notifications_view.dart' as _i9;
import '../view/onbording_view.dart' as _i5;
import '../view/payment/invoice_view.dart' as _i17;
import '../view/payment/payment_method_view.dart' as _i16;
import '../view/payment/single_invoice_view.dart' as _i19;
import '../view/pincode_verification_view.dart' as _i6;
import '../view/splash_view.dart' as _i1;
import '../view/splash_view_2.dart' as _i2;

class AppRouter extends _i30.RootStackRouter {
  AppRouter([_i31.GlobalKey<_i31.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i30.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    Splash2Route.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Splash2View(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingView(),
      );
    },
    PinCodeVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeVerificationRouteArgs>(
          orElse: () => const PinCodeVerificationRouteArgs());
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PinCodeVerificationView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CreateAccountView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardView(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotificationsView(),
      );
    },
    MyDoctorRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MyDoctorView(),
      );
    },
    MyRecordRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.MyRecordView(),
      );
    },
    MyDoctorCategoryWiseRoute.name: (routeData) {
      final args = routeData.argsAs<MyDoctorCategoryWiseRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.MyDoctorCategoryWiseView(
          key: args.key,
          categoryName: args.categoryName,
          departmentId: args.departmentId,
        ),
      );
    },
    AllDoctorSearchRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AllDoctorSearchView(),
      );
    },
    DocDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DocDetailsRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.DocDetailsView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    BookAppointmentRoute.name: (routeData) {
      final args = routeData.argsAs<BookAppointmentRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.BookAppointmentView(
          key: args.key,
          doctors: args.doctors,
        ),
      );
    },
    PaymentMethodRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentMethodView(),
      );
    },
    InvoiceRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.InvoiceView(),
      );
    },
    AnatomyRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.AnatomyView(),
      );
    },
    SingleInvoiceRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.SingleInvoiceView(),
      );
    },
    VitalsRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.VitalsView(),
      );
    },
    MyMedicalHistoryRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.MyMedicalHistoryView(),
      );
    },
    SelfMedicalHistoryFGDRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.SelfMedicalHistoryFGDView(),
      );
    },
    ReasonForVisitRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ReasonForVisitView(),
      );
    },
    MyReportRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.MyReportView(),
      );
    },
    VitalsItemDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<VitalsItemDetailsRouteArgs>();
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.VitalsItemDetailsView(
          key: args.key,
          title: args.title,
          img: args.img,
          subtitle: args.subtitle,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.HomeView(),
      );
    },
    SetAppointmentRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.SetAppointmentView(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.FavouritesView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i30.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.BasketView(),
      );
    },
  };

  @override
  List<_i30.RouteConfig> get routes => [
        _i30.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i30.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i30.RouteConfig(
          Splash2Route.name,
          path: '/splash',
        ),
        _i30.RouteConfig(
          SignInRoute.name,
          path: '/sign-in',
        ),
        _i30.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i30.RouteConfig(
          OnBoardingRoute.name,
          path: '/onBoarding',
        ),
        _i30.RouteConfig(
          PinCodeVerificationRoute.name,
          path: '/pinCode',
        ),
        _i30.RouteConfig(
          CreateAccountRoute.name,
          path: '/create-account',
        ),
        _i30.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i30.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i30.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashboardRoute.name,
            ),
            _i30.RouteConfig(
              SetAppointmentRoute.name,
              path: 'set-appointments',
              parent: DashboardRoute.name,
            ),
            _i30.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites',
              parent: DashboardRoute.name,
            ),
            _i30.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i30.RouteConfig(
          NotificationsRoute.name,
          path: '/notification',
        ),
        _i30.RouteConfig(
          MyDoctorRoute.name,
          path: '/my-doctor',
        ),
        _i30.RouteConfig(
          MyRecordRoute.name,
          path: '/my-record',
        ),
        _i30.RouteConfig(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
        ),
        _i30.RouteConfig(
          AllDoctorSearchRoute.name,
          path: '/all-doctor-search',
        ),
        _i30.RouteConfig(
          DocDetailsRoute.name,
          path: '/doc-detail',
        ),
        _i30.RouteConfig(
          BookAppointmentRoute.name,
          path: '/book-appointment',
        ),
        _i30.RouteConfig(
          PaymentMethodRoute.name,
          path: '/payment-method',
        ),
        _i30.RouteConfig(
          InvoiceRoute.name,
          path: '/invoice',
        ),
        _i30.RouteConfig(
          AnatomyRoute.name,
          path: '/anatomy',
        ),
        _i30.RouteConfig(
          SingleInvoiceRoute.name,
          path: '/single-invoice',
        ),
        _i30.RouteConfig(
          VitalsRoute.name,
          path: '/vital',
        ),
        _i30.RouteConfig(
          MyMedicalHistoryRoute.name,
          path: '/my-medical-history',
        ),
        _i30.RouteConfig(
          SelfMedicalHistoryFGDRoute.name,
          path: '/self-medical-history',
        ),
        _i30.RouteConfig(
          ReasonForVisitRoute.name,
          path: '/reason-visit',
        ),
        _i30.RouteConfig(
          MyReportRoute.name,
          path: '/my-report',
        ),
        _i30.RouteConfig(
          VitalsItemDetailsRoute.name,
          path: '/vitals-detail',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i30.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Splash2View]
class Splash2Route extends _i30.PageRouteInfo<void> {
  const Splash2Route()
      : super(
          Splash2Route.name,
          path: '/splash',
        );

  static const String name = 'Splash2Route';
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i30.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i30.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingRoute extends _i30.PageRouteInfo<void> {
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
    extends _i30.PageRouteInfo<PinCodeVerificationRouteArgs> {
  PinCodeVerificationRoute({
    _i31.Key? key,
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

  final _i31.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'PinCodeVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.CreateAccountView]
class CreateAccountRoute extends _i30.PageRouteInfo<void> {
  const CreateAccountRoute()
      : super(
          CreateAccountRoute.name,
          path: '/create-account',
        );

  static const String name = 'CreateAccountRoute';
}

/// generated route for
/// [_i8.DashboardView]
class DashboardRoute extends _i30.PageRouteInfo<void> {
  const DashboardRoute({List<_i30.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i9.NotificationsView]
class NotificationsRoute extends _i30.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i10.MyDoctorView]
class MyDoctorRoute extends _i30.PageRouteInfo<void> {
  const MyDoctorRoute()
      : super(
          MyDoctorRoute.name,
          path: '/my-doctor',
        );

  static const String name = 'MyDoctorRoute';
}

/// generated route for
/// [_i11.MyRecordView]
class MyRecordRoute extends _i30.PageRouteInfo<void> {
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
    extends _i30.PageRouteInfo<MyDoctorCategoryWiseRouteArgs> {
  MyDoctorCategoryWiseRoute({
    _i31.Key? key,
    required String categoryName,
    required int departmentId,
  }) : super(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
          args: MyDoctorCategoryWiseRouteArgs(
            key: key,
            categoryName: categoryName,
            departmentId: departmentId,
          ),
        );

  static const String name = 'MyDoctorCategoryWiseRoute';
}

class MyDoctorCategoryWiseRouteArgs {
  const MyDoctorCategoryWiseRouteArgs({
    this.key,
    required this.categoryName,
    required this.departmentId,
  });

  final _i31.Key? key;

  final String categoryName;

  final int departmentId;

  @override
  String toString() {
    return 'MyDoctorCategoryWiseRouteArgs{key: $key, categoryName: $categoryName, departmentId: $departmentId}';
  }
}

/// generated route for
/// [_i13.AllDoctorSearchView]
class AllDoctorSearchRoute extends _i30.PageRouteInfo<void> {
  const AllDoctorSearchRoute()
      : super(
          AllDoctorSearchRoute.name,
          path: '/all-doctor-search',
        );

  static const String name = 'AllDoctorSearchRoute';
}

/// generated route for
/// [_i14.DocDetailsView]
class DocDetailsRoute extends _i30.PageRouteInfo<DocDetailsRouteArgs> {
  DocDetailsRoute({
    _i31.Key? key,
    required num id,
  }) : super(
          DocDetailsRoute.name,
          path: '/doc-detail',
          args: DocDetailsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'DocDetailsRoute';
}

class DocDetailsRouteArgs {
  const DocDetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i31.Key? key;

  final num id;

  @override
  String toString() {
    return 'DocDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i15.BookAppointmentView]
class BookAppointmentRoute
    extends _i30.PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({
    _i31.Key? key,
    required _i32.Doctors doctors,
  }) : super(
          BookAppointmentRoute.name,
          path: '/book-appointment',
          args: BookAppointmentRouteArgs(
            key: key,
            doctors: doctors,
          ),
        );

  static const String name = 'BookAppointmentRoute';
}

class BookAppointmentRouteArgs {
  const BookAppointmentRouteArgs({
    this.key,
    required this.doctors,
  });

  final _i31.Key? key;

  final _i32.Doctors doctors;

  @override
  String toString() {
    return 'BookAppointmentRouteArgs{key: $key, doctors: $doctors}';
  }
}

/// generated route for
/// [_i16.PaymentMethodView]
class PaymentMethodRoute extends _i30.PageRouteInfo<void> {
  const PaymentMethodRoute()
      : super(
          PaymentMethodRoute.name,
          path: '/payment-method',
        );

  static const String name = 'PaymentMethodRoute';
}

/// generated route for
/// [_i17.InvoiceView]
class InvoiceRoute extends _i30.PageRouteInfo<void> {
  const InvoiceRoute()
      : super(
          InvoiceRoute.name,
          path: '/invoice',
        );

  static const String name = 'InvoiceRoute';
}

/// generated route for
/// [_i18.AnatomyView]
class AnatomyRoute extends _i30.PageRouteInfo<void> {
  const AnatomyRoute()
      : super(
          AnatomyRoute.name,
          path: '/anatomy',
        );

  static const String name = 'AnatomyRoute';
}

/// generated route for
/// [_i19.SingleInvoiceView]
class SingleInvoiceRoute extends _i30.PageRouteInfo<void> {
  const SingleInvoiceRoute()
      : super(
          SingleInvoiceRoute.name,
          path: '/single-invoice',
        );

  static const String name = 'SingleInvoiceRoute';
}

/// generated route for
/// [_i20.VitalsView]
class VitalsRoute extends _i30.PageRouteInfo<void> {
  const VitalsRoute()
      : super(
          VitalsRoute.name,
          path: '/vital',
        );

  static const String name = 'VitalsRoute';
}

/// generated route for
/// [_i21.MyMedicalHistoryView]
class MyMedicalHistoryRoute extends _i30.PageRouteInfo<void> {
  const MyMedicalHistoryRoute()
      : super(
          MyMedicalHistoryRoute.name,
          path: '/my-medical-history',
        );

  static const String name = 'MyMedicalHistoryRoute';
}

/// generated route for
/// [_i22.SelfMedicalHistoryFGDView]
class SelfMedicalHistoryFGDRoute extends _i30.PageRouteInfo<void> {
  const SelfMedicalHistoryFGDRoute()
      : super(
          SelfMedicalHistoryFGDRoute.name,
          path: '/self-medical-history',
        );

  static const String name = 'SelfMedicalHistoryFGDRoute';
}

/// generated route for
/// [_i23.ReasonForVisitView]
class ReasonForVisitRoute extends _i30.PageRouteInfo<void> {
  const ReasonForVisitRoute()
      : super(
          ReasonForVisitRoute.name,
          path: '/reason-visit',
        );

  static const String name = 'ReasonForVisitRoute';
}

/// generated route for
/// [_i24.MyReportView]
class MyReportRoute extends _i30.PageRouteInfo<void> {
  const MyReportRoute()
      : super(
          MyReportRoute.name,
          path: '/my-report',
        );

  static const String name = 'MyReportRoute';
}

/// generated route for
/// [_i25.VitalsItemDetailsView]
class VitalsItemDetailsRoute
    extends _i30.PageRouteInfo<VitalsItemDetailsRouteArgs> {
  VitalsItemDetailsRoute({
    _i31.Key? key,
    required String title,
    required String img,
    required String subtitle,
  }) : super(
          VitalsItemDetailsRoute.name,
          path: '/vitals-detail',
          args: VitalsItemDetailsRouteArgs(
            key: key,
            title: title,
            img: img,
            subtitle: subtitle,
          ),
        );

  static const String name = 'VitalsItemDetailsRoute';
}

class VitalsItemDetailsRouteArgs {
  const VitalsItemDetailsRouteArgs({
    this.key,
    required this.title,
    required this.img,
    required this.subtitle,
  });

  final _i31.Key? key;

  final String title;

  final String img;

  final String subtitle;

  @override
  String toString() {
    return 'VitalsItemDetailsRouteArgs{key: $key, title: $title, img: $img, subtitle: $subtitle}';
  }
}

/// generated route for
/// [_i26.HomeView]
class HomeRoute extends _i30.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i27.SetAppointmentView]
class SetAppointmentRoute extends _i30.PageRouteInfo<void> {
  const SetAppointmentRoute()
      : super(
          SetAppointmentRoute.name,
          path: 'set-appointments',
        );

  static const String name = 'SetAppointmentRoute';
}

/// generated route for
/// [_i28.FavouritesView]
class FavouritesRoute extends _i30.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i29.BasketView]
class BasketRoute extends _i30.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}
