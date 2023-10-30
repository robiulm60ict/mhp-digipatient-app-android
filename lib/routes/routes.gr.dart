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
import 'package:agora_uikit/agora_uikit.dart' as _i50;
import 'package:auto_route/auto_route.dart' as _i42;
import 'package:flutter/material.dart' as _i43;

import '../enum/vitals_enum.dart' as _i46;
import '../model/anatomy/anatomy_symptoms_model.dart' as _i45;
import '../model/doctor_model/doctors_model.dart' as _i44;
import '../model/my_record_model/medical_history_from_great_doc_model.dart'
    as _i48;
import '../model/my_record_model/vitals_model.dart' as _i47;
import '../model/user_detail_model/user_model.dart' as _i49;
import '../view/anatomy/anatomy_view.dart' as _i18;
import '../view/appointment/book_appointment_view.dart' as _i15;
import '../view/authentications/create_account_view.dart' as _i7;
import '../view/authentications/sign_in_view.dart' as _i3;
import '../view/authentications/sign_up_view.dart' as _i4;
import '../view/authentications/user_detail_view.dart' as _i33;
import '../view/bottom_navigation_buttons/basket_view.dart' as _i41;
import '../view/bottom_navigation_buttons/favourites_view.dart' as _i40;
import '../view/bottom_navigation_buttons/home_view.dart' as _i38;
import '../view/bottom_navigation_buttons/set_appointment_view.dart' as _i39;
import '../view/communication/agora_chatting.dart' as _i34;
import '../view/daily_upcomming_appointment/daily_and_upcomming_appointments_detail_view.dart'
    as _i31;
import '../view/daily_upcomming_appointment/daily_and_upcomming_appointments_view.dart'
    as _i30;
import '../view/dashboard.dart' as _i8;
import '../view/doctor_screen/doctor_view.dart' as _i37;
import '../view/home_item_pages/my_doctor_view.dart' as _i10;
import '../view/home_item_pages/my_record_view.dart' as _i11;
import '../view/my_doctor_category_views/all_doctor_search_view.dart' as _i13;
import '../view/my_doctor_category_views/doc_details_view.dart' as _i14;
import '../view/my_doctor_category_views/my_doctor_category_wise_view.dart'
    as _i12;
import '../view/my_medicine/my_medicine_view.dart' as _i27;
import '../view/my_medicine/rx_detail_view.dart' as _i29;
import '../view/my_medicine/rx_view.dart' as _i28;
import '../view/my_record/add_medical_history_view.dart' as _i26;
import '../view/my_record/medical_documents_view.dart' as _i32;
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
import '../view/real_communication/chat_view.dart' as _i35;
import '../view/real_communication/video_call.dart' as _i36;
import '../view/splash_view.dart' as _i1;
import '../view/splash_view_2.dart' as _i2;

class AppRouter extends _i42.RootStackRouter {
  AppRouter([_i43.GlobalKey<_i43.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i42.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    Splash2Route.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Splash2View(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpView(),
      );
    },
    OnBoardingRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OnBoardingView(),
      );
    },
    PinCodeVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PinCodeVerificationRouteArgs>(
          orElse: () => const PinCodeVerificationRouteArgs());
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.PinCodeVerificationView(
          key: args.key,
          phoneNumber: args.phoneNumber,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAccountRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.CreateAccountView(
          key: args.key,
          phoneNumber: args.phoneNumber,
          token: args.token,
          vCode: args.vCode,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.DashboardView(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.NotificationsView(),
      );
    },
    MyDoctorRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.MyDoctorView(),
      );
    },
    MyRecordRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.MyRecordView(),
      );
    },
    MyDoctorCategoryWiseRoute.name: (routeData) {
      final args = routeData.argsAs<MyDoctorCategoryWiseRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.MyDoctorCategoryWiseView(
          key: args.key,
          categoryName: args.categoryName,
          departmentId: args.departmentId,
          departmentImage: args.departmentImage,
        ),
      );
    },
    AllDoctorSearchRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AllDoctorSearchView(),
      );
    },
    DocDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DocDetailsRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.DocDetailsView(
          key: args.key,
          id: args.id,
        ),
      );
    },
    BookAppointmentRoute.name: (routeData) {
      final args = routeData.argsAs<BookAppointmentRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.BookAppointmentView(
          key: args.key,
          doctors: args.doctors,
          amount: args.amount,
        ),
      );
    },
    PaymentMethodRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentMethodRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.PaymentMethodView(
          key: args.key,
          appointmentDate: args.appointmentDate,
          doctorId: args.doctorId,
          patientId: args.patientId,
          amount: args.amount,
          appointmentType: args.appointmentType,
          doctor: args.doctor,
          diseaseList: args.diseaseList,
        ),
      );
    },
    InvoiceRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.InvoiceView(),
      );
    },
    AnatomyRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.AnatomyView(),
      );
    },
    SingleInvoiceRoute.name: (routeData) {
      final args = routeData.argsAs<SingleInvoiceRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.SingleInvoiceView(
          key: args.key,
          appointmentDate: args.appointmentDate,
          doctorId: args.doctorId,
          patientId: args.patientId,
          amount: args.amount,
          appointmentType: args.appointmentType,
          doctor: args.doctor,
          paymentMethod: args.paymentMethod,
        ),
      );
    },
    VitalsRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.VitalsView(),
      );
    },
    MyMedicalHistoryRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.MyMedicalHistoryView(),
      );
    },
    SelfMedicalHistoryFGDRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.SelfMedicalHistoryFGDView(),
      );
    },
    ReasonForVisitRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ReasonForVisitView(),
      );
    },
    MyReportRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.MyReportView(),
      );
    },
    VitalsItemDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<VitalsItemDetailsRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.VitalsItemDetailsView(
          key: args.key,
          title: args.title,
          img: args.img,
          subtitle: args.subtitle,
          v: args.v,
          allData: args.allData,
          index: args.index,
          icon: args.icon,
          unitId: args.unitId,
          color: args.color,
        ),
      );
    },
    AddMedicalHistoryRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.AddMedicalHistoryView(),
      );
    },
    MyMedicineRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.MyMedicineView(),
      );
    },
    RXRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.RXView(),
      );
    },
    RXDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RXDetailRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.RXDetailView(
          key: args.key,
          title: args.title,
          isCurrentRxView: args.isCurrentRxView,
        ),
      );
    },
    DailyAndUpcommingRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.DailyAndUpcommingView(),
      );
    },
    DailyAndUpcommingDetailRoute.name: (routeData) {
      final args = routeData.argsAs<DailyAndUpcommingDetailRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i31.DailyAndUpcommingDetailView(
          key: args.key,
          docImage: args.docImage,
          docName: args.docName,
          docHospital: args.docHospital,
          docSpeciality: args.docSpeciality,
          appType: args.appType,
        ),
      );
    },
    MedicalDocumentsRoute.name: (routeData) {
      final args = routeData.argsAs<MedicalDocumentsRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.MedicalDocumentsView(
          key: args.key,
          history: args.history,
        ),
      );
    },
    UserDetailRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i33.UserDetailView(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ChatRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i34.ChatView(),
      );
    },
    ChatRTMRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.ChatRTMView(),
      );
    },
    VideoCallingRoute.name: (routeData) {
      final args = routeData.argsAs<VideoCallingRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.VideoCallingView(
          key: args.key,
          token: args.token,
          channelName: args.channelName,
          appId: args.appId,
          client: args.client,
        ),
      );
    },
    VideoCallingRTCRoute.name: (routeData) {
      final args = routeData.argsAs<VideoCallingRTCRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.VideoCallingRTCView(
          key: args.key,
          token: args.token,
          channelName: args.channelName,
          appId: args.appId,
        ),
      );
    },
    DoctorHomeRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.DoctorHomeView(),
      );
    },
    AgoraChatPageRoute.name: (routeData) {
      final args = routeData.argsAs<AgoraChatPageRouteArgs>();
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i35.AgoraChatPageView(
          key: args.key,
          chatKey: args.chatKey,
          userId: args.userId,
          agoraToken: args.agoraToken,
          receiverId: args.receiverId,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i38.HomeView(),
      );
    },
    SetAppointmentRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.SetAppointmentView(),
      );
    },
    FavouritesRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i40.FavouritesView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i42.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i41.BasketView(),
      );
    },
  };

  @override
  List<_i42.RouteConfig> get routes => [
        _i42.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i42.RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        _i42.RouteConfig(
          Splash2Route.name,
          path: '/splash',
        ),
        _i42.RouteConfig(
          SignInRoute.name,
          path: '/sign-in',
        ),
        _i42.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i42.RouteConfig(
          OnBoardingRoute.name,
          path: '/onBoarding',
        ),
        _i42.RouteConfig(
          PinCodeVerificationRoute.name,
          path: '/pinCode',
        ),
        _i42.RouteConfig(
          CreateAccountRoute.name,
          path: '/create-account',
        ),
        _i42.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i42.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'home',
              fullMatch: true,
            ),
            _i42.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: DashboardRoute.name,
            ),
            _i42.RouteConfig(
              SetAppointmentRoute.name,
              path: 'set-appointments',
              parent: DashboardRoute.name,
            ),
            _i42.RouteConfig(
              FavouritesRoute.name,
              path: 'favourites',
              parent: DashboardRoute.name,
            ),
            _i42.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i42.RouteConfig(
          NotificationsRoute.name,
          path: '/notification',
        ),
        _i42.RouteConfig(
          MyDoctorRoute.name,
          path: '/my-doctor',
        ),
        _i42.RouteConfig(
          MyRecordRoute.name,
          path: '/my-record',
        ),
        _i42.RouteConfig(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
        ),
        _i42.RouteConfig(
          AllDoctorSearchRoute.name,
          path: '/all-doctor-search',
        ),
        _i42.RouteConfig(
          DocDetailsRoute.name,
          path: '/doc-detail',
        ),
        _i42.RouteConfig(
          BookAppointmentRoute.name,
          path: '/book-appointment',
        ),
        _i42.RouteConfig(
          PaymentMethodRoute.name,
          path: '/payment-method',
        ),
        _i42.RouteConfig(
          InvoiceRoute.name,
          path: '/invoice',
        ),
        _i42.RouteConfig(
          AnatomyRoute.name,
          path: '/anatomy',
        ),
        _i42.RouteConfig(
          SingleInvoiceRoute.name,
          path: '/single-invoice',
        ),
        _i42.RouteConfig(
          VitalsRoute.name,
          path: '/vital',
        ),
        _i42.RouteConfig(
          MyMedicalHistoryRoute.name,
          path: '/my-medical-history',
        ),
        _i42.RouteConfig(
          SelfMedicalHistoryFGDRoute.name,
          path: '/self-medical-history',
        ),
        _i42.RouteConfig(
          ReasonForVisitRoute.name,
          path: '/reason-visit',
        ),
        _i42.RouteConfig(
          MyReportRoute.name,
          path: '/my-report',
        ),
        _i42.RouteConfig(
          VitalsItemDetailsRoute.name,
          path: '/vitals-detail',
        ),
        _i42.RouteConfig(
          AddMedicalHistoryRoute.name,
          path: '/add-medical-history',
        ),
        _i42.RouteConfig(
          MyMedicineRoute.name,
          path: '/medicine',
        ),
        _i42.RouteConfig(
          RXRoute.name,
          path: '/rx',
        ),
        _i42.RouteConfig(
          RXDetailRoute.name,
          path: '/details',
        ),
        _i42.RouteConfig(
          DailyAndUpcommingRoute.name,
          path: '/daua',
        ),
        _i42.RouteConfig(
          DailyAndUpcommingDetailRoute.name,
          path: '/daua-detail',
        ),
        _i42.RouteConfig(
          MedicalDocumentsRoute.name,
          path: '/document-detail',
        ),
        _i42.RouteConfig(
          UserDetailRoute.name,
          path: '/user-detail',
        ),
        _i42.RouteConfig(
          ChatRoute.name,
          path: '/chat',
        ),
        _i42.RouteConfig(
          ChatRTMRoute.name,
          path: '/chat-rtm',
        ),
        _i42.RouteConfig(
          VideoCallingRoute.name,
          path: '/video-call',
        ),
        _i42.RouteConfig(
          VideoCallingRTCRoute.name,
          path: '/video-call-rtc',
        ),
        _i42.RouteConfig(
          DoctorHomeRoute.name,
          path: '/doctor',
        ),
        _i42.RouteConfig(
          AgoraChatPageRoute.name,
          path: '/chatR',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i42.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.Splash2View]
class Splash2Route extends _i42.PageRouteInfo<void> {
  const Splash2Route()
      : super(
          Splash2Route.name,
          path: '/splash',
        );

  static const String name = 'Splash2Route';
}

/// generated route for
/// [_i3.SignInView]
class SignInRoute extends _i42.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/sign-in',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SignUpView]
class SignUpRoute extends _i42.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingRoute extends _i42.PageRouteInfo<void> {
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
    extends _i42.PageRouteInfo<PinCodeVerificationRouteArgs> {
  PinCodeVerificationRoute({
    _i43.Key? key,
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

  final _i43.Key? key;

  final String? phoneNumber;

  @override
  String toString() {
    return 'PinCodeVerificationRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [_i7.CreateAccountView]
class CreateAccountRoute extends _i42.PageRouteInfo<CreateAccountRouteArgs> {
  CreateAccountRoute({
    _i43.Key? key,
    required String phoneNumber,
    required String token,
    required String vCode,
  }) : super(
          CreateAccountRoute.name,
          path: '/create-account',
          args: CreateAccountRouteArgs(
            key: key,
            phoneNumber: phoneNumber,
            token: token,
            vCode: vCode,
          ),
        );

  static const String name = 'CreateAccountRoute';
}

class CreateAccountRouteArgs {
  const CreateAccountRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.token,
    required this.vCode,
  });

  final _i43.Key? key;

  final String phoneNumber;

  final String token;

  final String vCode;

  @override
  String toString() {
    return 'CreateAccountRouteArgs{key: $key, phoneNumber: $phoneNumber, token: $token, vCode: $vCode}';
  }
}

/// generated route for
/// [_i8.DashboardView]
class DashboardRoute extends _i42.PageRouteInfo<void> {
  const DashboardRoute({List<_i42.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i9.NotificationsView]
class NotificationsRoute extends _i42.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i10.MyDoctorView]
class MyDoctorRoute extends _i42.PageRouteInfo<void> {
  const MyDoctorRoute()
      : super(
          MyDoctorRoute.name,
          path: '/my-doctor',
        );

  static const String name = 'MyDoctorRoute';
}

/// generated route for
/// [_i11.MyRecordView]
class MyRecordRoute extends _i42.PageRouteInfo<void> {
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
    extends _i42.PageRouteInfo<MyDoctorCategoryWiseRouteArgs> {
  MyDoctorCategoryWiseRoute({
    _i43.Key? key,
    required String categoryName,
    required num departmentId,
    required String departmentImage,
  }) : super(
          MyDoctorCategoryWiseRoute.name,
          path: '/my-doctor-category-wise',
          args: MyDoctorCategoryWiseRouteArgs(
            key: key,
            categoryName: categoryName,
            departmentId: departmentId,
            departmentImage: departmentImage,
          ),
        );

  static const String name = 'MyDoctorCategoryWiseRoute';
}

class MyDoctorCategoryWiseRouteArgs {
  const MyDoctorCategoryWiseRouteArgs({
    this.key,
    required this.categoryName,
    required this.departmentId,
    required this.departmentImage,
  });

  final _i43.Key? key;

  final String categoryName;

  final num departmentId;

  final String departmentImage;

  @override
  String toString() {
    return 'MyDoctorCategoryWiseRouteArgs{key: $key, categoryName: $categoryName, departmentId: $departmentId, departmentImage: $departmentImage}';
  }
}

/// generated route for
/// [_i13.AllDoctorSearchView]
class AllDoctorSearchRoute extends _i42.PageRouteInfo<void> {
  const AllDoctorSearchRoute()
      : super(
          AllDoctorSearchRoute.name,
          path: '/all-doctor-search',
        );

  static const String name = 'AllDoctorSearchRoute';
}

/// generated route for
/// [_i14.DocDetailsView]
class DocDetailsRoute extends _i42.PageRouteInfo<DocDetailsRouteArgs> {
  DocDetailsRoute({
    _i43.Key? key,
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

  final _i43.Key? key;

  final num id;

  @override
  String toString() {
    return 'DocDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i15.BookAppointmentView]
class BookAppointmentRoute
    extends _i42.PageRouteInfo<BookAppointmentRouteArgs> {
  BookAppointmentRoute({
    _i43.Key? key,
    required _i44.Doctor doctors,
    required String amount,
  }) : super(
          BookAppointmentRoute.name,
          path: '/book-appointment',
          args: BookAppointmentRouteArgs(
            key: key,
            doctors: doctors,
            amount: amount,
          ),
        );

  static const String name = 'BookAppointmentRoute';
}

class BookAppointmentRouteArgs {
  const BookAppointmentRouteArgs({
    this.key,
    required this.doctors,
    required this.amount,
  });

  final _i43.Key? key;

  final _i44.Doctor doctors;

  final String amount;

  @override
  String toString() {
    return 'BookAppointmentRouteArgs{key: $key, doctors: $doctors, amount: $amount}';
  }
}

/// generated route for
/// [_i16.PaymentMethodView]
class PaymentMethodRoute extends _i42.PageRouteInfo<PaymentMethodRouteArgs> {
  PaymentMethodRoute({
    _i43.Key? key,
    required String appointmentDate,
    required String doctorId,
    required String patientId,
    required String amount,
    required String appointmentType,
    required _i44.Doctor doctor,
    required List<_i45.SymptomsAnatomy> diseaseList,
  }) : super(
          PaymentMethodRoute.name,
          path: '/payment-method',
          args: PaymentMethodRouteArgs(
            key: key,
            appointmentDate: appointmentDate,
            doctorId: doctorId,
            patientId: patientId,
            amount: amount,
            appointmentType: appointmentType,
            doctor: doctor,
            diseaseList: diseaseList,
          ),
        );

  static const String name = 'PaymentMethodRoute';
}

class PaymentMethodRouteArgs {
  const PaymentMethodRouteArgs({
    this.key,
    required this.appointmentDate,
    required this.doctorId,
    required this.patientId,
    required this.amount,
    required this.appointmentType,
    required this.doctor,
    required this.diseaseList,
  });

  final _i43.Key? key;

  final String appointmentDate;

  final String doctorId;

  final String patientId;

  final String amount;

  final String appointmentType;

  final _i44.Doctor doctor;

  final List<_i45.SymptomsAnatomy> diseaseList;

  @override
  String toString() {
    return 'PaymentMethodRouteArgs{key: $key, appointmentDate: $appointmentDate, doctorId: $doctorId, patientId: $patientId, amount: $amount, appointmentType: $appointmentType, doctor: $doctor, diseaseList: $diseaseList}';
  }
}

/// generated route for
/// [_i17.InvoiceView]
class InvoiceRoute extends _i42.PageRouteInfo<void> {
  const InvoiceRoute()
      : super(
          InvoiceRoute.name,
          path: '/invoice',
        );

  static const String name = 'InvoiceRoute';
}

/// generated route for
/// [_i18.AnatomyView]
class AnatomyRoute extends _i42.PageRouteInfo<void> {
  const AnatomyRoute()
      : super(
          AnatomyRoute.name,
          path: '/anatomy',
        );

  static const String name = 'AnatomyRoute';
}

/// generated route for
/// [_i19.SingleInvoiceView]
class SingleInvoiceRoute extends _i42.PageRouteInfo<SingleInvoiceRouteArgs> {
  SingleInvoiceRoute({
    _i43.Key? key,
    required String appointmentDate,
    required String doctorId,
    required String patientId,
    required String amount,
    required String appointmentType,
    required _i44.Doctor doctor,
    required String paymentMethod,
  }) : super(
          SingleInvoiceRoute.name,
          path: '/single-invoice',
          args: SingleInvoiceRouteArgs(
            key: key,
            appointmentDate: appointmentDate,
            doctorId: doctorId,
            patientId: patientId,
            amount: amount,
            appointmentType: appointmentType,
            doctor: doctor,
            paymentMethod: paymentMethod,
          ),
        );

  static const String name = 'SingleInvoiceRoute';
}

class SingleInvoiceRouteArgs {
  const SingleInvoiceRouteArgs({
    this.key,
    required this.appointmentDate,
    required this.doctorId,
    required this.patientId,
    required this.amount,
    required this.appointmentType,
    required this.doctor,
    required this.paymentMethod,
  });

  final _i43.Key? key;

  final String appointmentDate;

  final String doctorId;

  final String patientId;

  final String amount;

  final String appointmentType;

  final _i44.Doctor doctor;

  final String paymentMethod;

  @override
  String toString() {
    return 'SingleInvoiceRouteArgs{key: $key, appointmentDate: $appointmentDate, doctorId: $doctorId, patientId: $patientId, amount: $amount, appointmentType: $appointmentType, doctor: $doctor, paymentMethod: $paymentMethod}';
  }
}

/// generated route for
/// [_i20.VitalsView]
class VitalsRoute extends _i42.PageRouteInfo<void> {
  const VitalsRoute()
      : super(
          VitalsRoute.name,
          path: '/vital',
        );

  static const String name = 'VitalsRoute';
}

/// generated route for
/// [_i21.MyMedicalHistoryView]
class MyMedicalHistoryRoute extends _i42.PageRouteInfo<void> {
  const MyMedicalHistoryRoute()
      : super(
          MyMedicalHistoryRoute.name,
          path: '/my-medical-history',
        );

  static const String name = 'MyMedicalHistoryRoute';
}

/// generated route for
/// [_i22.SelfMedicalHistoryFGDView]
class SelfMedicalHistoryFGDRoute extends _i42.PageRouteInfo<void> {
  const SelfMedicalHistoryFGDRoute()
      : super(
          SelfMedicalHistoryFGDRoute.name,
          path: '/self-medical-history',
        );

  static const String name = 'SelfMedicalHistoryFGDRoute';
}

/// generated route for
/// [_i23.ReasonForVisitView]
class ReasonForVisitRoute extends _i42.PageRouteInfo<void> {
  const ReasonForVisitRoute()
      : super(
          ReasonForVisitRoute.name,
          path: '/reason-visit',
        );

  static const String name = 'ReasonForVisitRoute';
}

/// generated route for
/// [_i24.MyReportView]
class MyReportRoute extends _i42.PageRouteInfo<void> {
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
    extends _i42.PageRouteInfo<VitalsItemDetailsRouteArgs> {
  VitalsItemDetailsRoute({
    _i43.Key? key,
    required String title,
    required String img,
    required String subtitle,
    required _i46.Vitals v,
    List<_i47.PatientsVs>? allData,
    required int index,
    required String icon,
    required String unitId,
    required String color,
  }) : super(
          VitalsItemDetailsRoute.name,
          path: '/vitals-detail',
          args: VitalsItemDetailsRouteArgs(
            key: key,
            title: title,
            img: img,
            subtitle: subtitle,
            v: v,
            allData: allData,
            index: index,
            icon: icon,
            unitId: unitId,
            color: color,
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
    required this.v,
    this.allData,
    required this.index,
    required this.icon,
    required this.unitId,
    required this.color,
  });

  final _i43.Key? key;

  final String title;

  final String img;

  final String subtitle;

  final _i46.Vitals v;

  final List<_i47.PatientsVs>? allData;

  final int index;

  final String icon;

  final String unitId;

  final String color;

  @override
  String toString() {
    return 'VitalsItemDetailsRouteArgs{key: $key, title: $title, img: $img, subtitle: $subtitle, v: $v, allData: $allData, index: $index, icon: $icon, unitId: $unitId, color: $color}';
  }
}

/// generated route for
/// [_i26.AddMedicalHistoryView]
class AddMedicalHistoryRoute extends _i42.PageRouteInfo<void> {
  const AddMedicalHistoryRoute()
      : super(
          AddMedicalHistoryRoute.name,
          path: '/add-medical-history',
        );

  static const String name = 'AddMedicalHistoryRoute';
}

/// generated route for
/// [_i27.MyMedicineView]
class MyMedicineRoute extends _i42.PageRouteInfo<void> {
  const MyMedicineRoute()
      : super(
          MyMedicineRoute.name,
          path: '/medicine',
        );

  static const String name = 'MyMedicineRoute';
}

/// generated route for
/// [_i28.RXView]
class RXRoute extends _i42.PageRouteInfo<void> {
  const RXRoute()
      : super(
          RXRoute.name,
          path: '/rx',
        );

  static const String name = 'RXRoute';
}

/// generated route for
/// [_i29.RXDetailView]
class RXDetailRoute extends _i42.PageRouteInfo<RXDetailRouteArgs> {
  RXDetailRoute({
    _i43.Key? key,
    required String title,
    required bool isCurrentRxView,
  }) : super(
          RXDetailRoute.name,
          path: '/details',
          args: RXDetailRouteArgs(
            key: key,
            title: title,
            isCurrentRxView: isCurrentRxView,
          ),
        );

  static const String name = 'RXDetailRoute';
}

class RXDetailRouteArgs {
  const RXDetailRouteArgs({
    this.key,
    required this.title,
    required this.isCurrentRxView,
  });

  final _i43.Key? key;

  final String title;

  final bool isCurrentRxView;

  @override
  String toString() {
    return 'RXDetailRouteArgs{key: $key, title: $title, isCurrentRxView: $isCurrentRxView}';
  }
}

/// generated route for
/// [_i30.DailyAndUpcommingView]
class DailyAndUpcommingRoute extends _i42.PageRouteInfo<void> {
  const DailyAndUpcommingRoute()
      : super(
          DailyAndUpcommingRoute.name,
          path: '/daua',
        );

  static const String name = 'DailyAndUpcommingRoute';
}

/// generated route for
/// [_i31.DailyAndUpcommingDetailView]
class DailyAndUpcommingDetailRoute
    extends _i42.PageRouteInfo<DailyAndUpcommingDetailRouteArgs> {
  DailyAndUpcommingDetailRoute({
    _i43.Key? key,
    required String docImage,
    required String docName,
    required String docHospital,
    required String docSpeciality,
    required bool appType,
  }) : super(
          DailyAndUpcommingDetailRoute.name,
          path: '/daua-detail',
          args: DailyAndUpcommingDetailRouteArgs(
            key: key,
            docImage: docImage,
            docName: docName,
            docHospital: docHospital,
            docSpeciality: docSpeciality,
            appType: appType,
          ),
        );

  static const String name = 'DailyAndUpcommingDetailRoute';
}

class DailyAndUpcommingDetailRouteArgs {
  const DailyAndUpcommingDetailRouteArgs({
    this.key,
    required this.docImage,
    required this.docName,
    required this.docHospital,
    required this.docSpeciality,
    required this.appType,
  });

  final _i43.Key? key;

  final String docImage;

  final String docName;

  final String docHospital;

  final String docSpeciality;

  final bool appType;

  @override
  String toString() {
    return 'DailyAndUpcommingDetailRouteArgs{key: $key, docImage: $docImage, docName: $docName, docHospital: $docHospital, docSpeciality: $docSpeciality, appType: $appType}';
  }
}

/// generated route for
/// [_i32.MedicalDocumentsView]
class MedicalDocumentsRoute
    extends _i42.PageRouteInfo<MedicalDocumentsRouteArgs> {
  MedicalDocumentsRoute({
    _i43.Key? key,
    required _i48.PastHistory? history,
  }) : super(
          MedicalDocumentsRoute.name,
          path: '/document-detail',
          args: MedicalDocumentsRouteArgs(
            key: key,
            history: history,
          ),
        );

  static const String name = 'MedicalDocumentsRoute';
}

class MedicalDocumentsRouteArgs {
  const MedicalDocumentsRouteArgs({
    this.key,
    required this.history,
  });

  final _i43.Key? key;

  final _i48.PastHistory? history;

  @override
  String toString() {
    return 'MedicalDocumentsRouteArgs{key: $key, history: $history}';
  }
}

/// generated route for
/// [_i33.UserDetailView]
class UserDetailRoute extends _i42.PageRouteInfo<UserDetailRouteArgs> {
  UserDetailRoute({
    _i43.Key? key,
    required _i49.Patient user,
  }) : super(
          UserDetailRoute.name,
          path: '/user-detail',
          args: UserDetailRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'UserDetailRoute';
}

class UserDetailRouteArgs {
  const UserDetailRouteArgs({
    this.key,
    required this.user,
  });

  final _i43.Key? key;

  final _i49.Patient user;

  @override
  String toString() {
    return 'UserDetailRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i34.ChatView]
class ChatRoute extends _i42.PageRouteInfo<void> {
  const ChatRoute()
      : super(
          ChatRoute.name,
          path: '/chat',
        );

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i35.ChatRTMView]
class ChatRTMRoute extends _i42.PageRouteInfo<void> {
  const ChatRTMRoute()
      : super(
          ChatRTMRoute.name,
          path: '/chat-rtm',
        );

  static const String name = 'ChatRTMRoute';
}

/// generated route for
/// [_i36.VideoCallingView]
class VideoCallingRoute extends _i42.PageRouteInfo<VideoCallingRouteArgs> {
  VideoCallingRoute({
    _i43.Key? key,
    required String token,
    required String channelName,
    required String appId,
    required _i50.AgoraClient client,
  }) : super(
          VideoCallingRoute.name,
          path: '/video-call',
          args: VideoCallingRouteArgs(
            key: key,
            token: token,
            channelName: channelName,
            appId: appId,
            client: client,
          ),
        );

  static const String name = 'VideoCallingRoute';
}

class VideoCallingRouteArgs {
  const VideoCallingRouteArgs({
    this.key,
    required this.token,
    required this.channelName,
    required this.appId,
    required this.client,
  });

  final _i43.Key? key;

  final String token;

  final String channelName;

  final String appId;

  final _i50.AgoraClient client;

  @override
  String toString() {
    return 'VideoCallingRouteArgs{key: $key, token: $token, channelName: $channelName, appId: $appId, client: $client}';
  }
}

/// generated route for
/// [_i36.VideoCallingRTCView]
class VideoCallingRTCRoute
    extends _i42.PageRouteInfo<VideoCallingRTCRouteArgs> {
  VideoCallingRTCRoute({
    _i43.Key? key,
    required String token,
    required String channelName,
    required String appId,
  }) : super(
          VideoCallingRTCRoute.name,
          path: '/video-call-rtc',
          args: VideoCallingRTCRouteArgs(
            key: key,
            token: token,
            channelName: channelName,
            appId: appId,
          ),
        );

  static const String name = 'VideoCallingRTCRoute';
}

class VideoCallingRTCRouteArgs {
  const VideoCallingRTCRouteArgs({
    this.key,
    required this.token,
    required this.channelName,
    required this.appId,
  });

  final _i43.Key? key;

  final String token;

  final String channelName;

  final String appId;

  @override
  String toString() {
    return 'VideoCallingRTCRouteArgs{key: $key, token: $token, channelName: $channelName, appId: $appId}';
  }
}

/// generated route for
/// [_i37.DoctorHomeView]
class DoctorHomeRoute extends _i42.PageRouteInfo<void> {
  const DoctorHomeRoute()
      : super(
          DoctorHomeRoute.name,
          path: '/doctor',
        );

  static const String name = 'DoctorHomeRoute';
}

/// generated route for
/// [_i35.AgoraChatPageView]
class AgoraChatPageRoute extends _i42.PageRouteInfo<AgoraChatPageRouteArgs> {
  AgoraChatPageRoute({
    _i43.Key? key,
    required String chatKey,
    required String userId,
    required String agoraToken,
    required String receiverId,
  }) : super(
          AgoraChatPageRoute.name,
          path: '/chatR',
          args: AgoraChatPageRouteArgs(
            key: key,
            chatKey: chatKey,
            userId: userId,
            agoraToken: agoraToken,
            receiverId: receiverId,
          ),
        );

  static const String name = 'AgoraChatPageRoute';
}

class AgoraChatPageRouteArgs {
  const AgoraChatPageRouteArgs({
    this.key,
    required this.chatKey,
    required this.userId,
    required this.agoraToken,
    required this.receiverId,
  });

  final _i43.Key? key;

  final String chatKey;

  final String userId;

  final String agoraToken;

  final String receiverId;

  @override
  String toString() {
    return 'AgoraChatPageRouteArgs{key: $key, chatKey: $chatKey, userId: $userId, agoraToken: $agoraToken, receiverId: $receiverId}';
  }
}

/// generated route for
/// [_i38.HomeView]
class HomeRoute extends _i42.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i39.SetAppointmentView]
class SetAppointmentRoute extends _i42.PageRouteInfo<void> {
  const SetAppointmentRoute()
      : super(
          SetAppointmentRoute.name,
          path: 'set-appointments',
        );

  static const String name = 'SetAppointmentRoute';
}

/// generated route for
/// [_i40.FavouritesView]
class FavouritesRoute extends _i42.PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: 'favourites',
        );

  static const String name = 'FavouritesRoute';
}

/// generated route for
/// [_i41.BasketView]
class BasketRoute extends _i42.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}
