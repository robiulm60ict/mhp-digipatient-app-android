import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/data/firebase/firebase_api.dart';
import 'package:digi_patient/data/firebase/notification_fcm.dart';
import 'package:digi_patient/utils/route/routes.dart';
import 'package:digi_patient/utils/route/routes_name.dart';
import 'package:digi_patient/view_model/anatomy/anatomy_view_model.dart';
import 'package:digi_patient/view_model/app_locale_state/app_locale_view_model.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:digi_patient/view_model/communication%20view%20model/communication_view_model.dart';
import 'package:digi_patient/view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import 'package:digi_patient/view_model/doctor_screen_view_model/all_patient_list_view_model.dart';
import 'package:digi_patient/view_model/home_view_model.dart';
import 'package:digi_patient/view_model/doctor/my_doctor_view_model.dart';
import 'package:digi_patient/view_model/my_medicine_view_model/my_medicine_view_model.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:digi_patient/view_model/mypayment/my_payment_view.dart';
import 'package:digi_patient/view_model/real_communication/video_call_view_model.dart';
import 'package:digi_patient/view_model/signup_model.dart';
import 'package:digi_patient/view_model/user_view_model/user_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '/resources/colors.dart';
import '/routes/routes.gr.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'view_model/mydoctor/new_my_doctor_view_model.dart';
import 'view_model/qr_code_dr_profile_view_model/profile_view_model.dart';
import 'view_model/resources_view_model/resources_view_model.dart';

// final FlutterLocalization localization = FlutterLocalization.instance;

// Future<void> backgroundMessageHandler(RemoteMessage message)async{
//   await Firebase.initializeApp();
// }

final navigatorKey = GlobalKey<NavigatorState>();

// final navigationService = NavigationService(appRouter.navigatorKey);

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  final navigatorKey = GlobalKey<NavigatorState>();

  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    name: "digi",
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseMessaging.instance.getInitialMessage();
  //  FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
  //  await NotificationService().getToken();
  // await FirebaseApi().initNotifications();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AnatomyModelView(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommunicationViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppLocaleViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyDoctorViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyDoctorDelaisViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppointmentViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyMedicineViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DailyAndUpcommingViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyRecordViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoCallViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrProfileViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DoctorScreenViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyPaymentViewModel(),
        ), ChangeNotifierProvider(
          create: (context) => ResourcesViewModel(),
        ),
      ],
      child: MyApp(
        navigatorKey: navigatorKey,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: widget.navigatorKey,
          theme: ThemeData(
             useMaterial3: false,

            fontFamily: 'RobotoMono',
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
            ),

            appBarTheme: AppBarTheme(
              elevation: 0,
              toolbarHeight: 50.h,

              backgroundColor: const Color(0xFFe6e6e6),
              // backgroundColor: const Color(0xFFf2f2f2),
              titleTextStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF646464),
              ),
            ),
            scaffoldBackgroundColor: const Color(0xFFe6e6e6),
            iconTheme: IconThemeData(size: 25.h, color: Colors.grey),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,

        );

      },
    );
  }
}
