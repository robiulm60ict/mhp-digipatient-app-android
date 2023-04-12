import 'package:auto_route/annotations.dart';
import 'package:digi_patient/view/anatomy/anatomy_view.dart';
import 'package:digi_patient/view/appointment/book_appointment_view.dart';
import 'package:digi_patient/view/authentications/create_account_view.dart';
import 'package:digi_patient/view/authentications/sign_in_view.dart';
import 'package:digi_patient/view/authentications/sign_up_view.dart';
import 'package:digi_patient/view/bottom_navigation_buttons/basket_view.dart';
import 'package:digi_patient/view/bottom_navigation_buttons/set_appointment_view.dart';
import 'package:digi_patient/view/home_item_pages/my_doctor_view.dart';
import 'package:digi_patient/view/home_item_pages/my_record_view.dart';
import 'package:digi_patient/view/my_doctor_category_views/all_doctor_search_view.dart';
import 'package:digi_patient/view/my_doctor_category_views/my_doctor_category_wise_view.dart';
import 'package:digi_patient/view/my_record/my_medical_history_view.dart';
import 'package:digi_patient/view/my_record/my_report_view.dart';
import 'package:digi_patient/view/my_record/reason_for_visit_view.dart';
import 'package:digi_patient/view/my_record/self_medical_history_from_great_doc_view.dart';
import 'package:digi_patient/view/my_record/vital_view.dart';
import 'package:digi_patient/view/my_record/vitals/vitals_item_details_view.dart';
import 'package:digi_patient/view/notifications_view.dart';
import 'package:digi_patient/view/onbording_view.dart';
import 'package:digi_patient/view/payment/invoice_view.dart';
import 'package:digi_patient/view/payment/payment_method_view.dart';
import 'package:digi_patient/view/payment/single_invoice_view.dart';
import 'package:digi_patient/view/pincode_verification_view.dart';
import 'package:digi_patient/view/splash_view_2.dart';

import '../view/bottom_navigation_buttons/favourites_view.dart';
import '../view/bottom_navigation_buttons/home_view.dart';
import '../view/dashboard.dart';
import '../view/my_doctor_category_views/doc_details_view.dart';
import '../view/my_medicine/my_medicine_view.dart';
import '../view/my_medicine/rx_detail_view.dart';
import '../view/my_medicine/rx_view.dart';
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
    AutoRoute(
      path: '/doc-detail',
      page: DocDetailsView,
    ),
    AutoRoute(
      path: '/book-appointment',
      page: BookAppointmentView,
    ),
    AutoRoute(
      path: '/payment-method',
      page: PaymentMethodView,
    ),
    AutoRoute(
      path: '/invoice',
      page: InvoiceView,
    ),
    AutoRoute(
      path: '/anatomy',
      page: AnatomyView,
    ),
    AutoRoute(
      path: '/single-invoice',
      page: SingleInvoiceView,
    ),

    /// My Record routes

    AutoRoute(path: '/vital', page: VitalsView,),
    AutoRoute(path: '/my-medical-history', page: MyMedicalHistoryView,),
    AutoRoute(path: '/self-medical-history', page: SelfMedicalHistoryFGDView,),
    AutoRoute(path: '/reason-visit', page: ReasonForVisitView,),
    AutoRoute(path: '/my-report', page: MyReportView,),
    AutoRoute(path: '/vitals-detail', page: VitalsItemDetailsView,),

    /// My Medicine

    AutoRoute(path: '/medicine', page: MyMedicineView,),
    AutoRoute(path: '/rx', page: RXView,),
    AutoRoute(path: '/details', page: RXDetailView,),

  ],
)
class $AppRouter {}
