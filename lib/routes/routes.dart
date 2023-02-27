import 'package:auto_route/annotations.dart';
import 'package:digi_patient/view/authentications/create_account_view.dart';
import 'package:digi_patient/view/authentications/sign_in_view.dart';
import 'package:digi_patient/view/authentications/sign_up_view.dart';
import 'package:digi_patient/view/bottom_navigation_buttons/basket_view.dart';
import 'package:digi_patient/view/bottom_navigation_buttons/set_appointment_view.dart';
import 'package:digi_patient/view/home_item_pages/my_doctor_view.dart';
import 'package:digi_patient/view/home_item_pages/my_record_view.dart';
import 'package:digi_patient/view/my_doctor_category_views/all_doctor_search_view.dart';
import 'package:digi_patient/view/my_doctor_category_views/my_doctor_category_wise_view.dart';
import 'package:digi_patient/view/notifications_view.dart';
import 'package:digi_patient/view/onbording_view.dart';
import 'package:digi_patient/view/pincode_verification_view.dart';
import 'package:digi_patient/view/splash_view_2.dart';

import '../view/bottom_navigation_buttons/favourites_view.dart';
import '../view/bottom_navigation_buttons/home_view.dart';
import '../view/dashboard.dart';
import '../view/splash_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/splash',
      page: SplashView,
      initial: true,
    ),
    AutoRoute(
      path: '/splash',
      page: Splash2View,
    ),
    // AutoRoute(path: '/login', page: LoginView),
    AutoRoute(
      path: '/sign-in',
      page: SignInView,
    ),
    AutoRoute(
      path: '/signup',
      page: SignUpView,
    ),
    AutoRoute(
      path: '/onBoarding',
      page: OnBoardingView,
    ),
    AutoRoute(
      path: '/pinCode',
      page: PinCodeVerificationView,
    ),
    AutoRoute(
      path: '/create-account',
      page: CreateAccountView,
    ),

    AutoRoute(
      path: '/dashboard',
      page: DashboardView,
      children: [
         // AutoRoute(path: 'appointments', page: MyAppointmentsView),
        AutoRoute(path: 'home', page: HomeView, initial: true),
        AutoRoute(path: 'set-appointments', page: SetAppointmentView),
                AutoRoute(path: 'favourites', page: FavouritesView),
                AutoRoute(path: 'basket', page: BasketView),
         //        AutoRoute(path: 'notifications', page: NotificationsView),
         //        AutoRoute(path: 'profile', page: ProfileView),
      ],
    ),
    AutoRoute(
      path: '/notification',
      page: NotificationsView,
    ),
    AutoRoute(
      path: '/my-doctor',
      page: MyDoctorView,
    ),
    AutoRoute(
      path: '/my-record',
      page: MyRecordView,
    ),
    AutoRoute(
      path: '/my-doctor-category-wise',
      page: MyDoctorCategoryWiseView,
    ),
    AutoRoute(
      path: '/all-doctor-search',
      page: AllDoctorSearchView,
    ),
  ],
)
class $AppRouter {}
