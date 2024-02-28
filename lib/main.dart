// Flutter imports:
import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

// Project imports:
import 'constants.dart';
import 'data/firebase/firebase_api.dart';
import 'firebase_options.dart';
import 'login_service.dart';
import 'utils/route/routes.dart';
import 'utils/route/routes_name.dart';
import 'view_model/anatomy/anatomy_view_model.dart';
import 'view_model/app_locale_state/app_locale_view_model.dart';
import 'view_model/appointment_view_model/appointment_view_model.dart';
import 'view_model/auth_view_model.dart';
import 'view_model/communication view model/communication_view_model.dart';
import 'view_model/daily_appointments_view_model/daily_appointments_view_model.dart';
import 'view_model/doctor/my_doctor_view_model.dart';
import 'view_model/doctor_screen_view_model/all_patient_list_view_model.dart';
import 'view_model/home_view_model.dart';
import 'view_model/my_medicine_view_model/my_medicine_view_model.dart';
import 'view_model/my_record_view_model/my_record_view_model.dart';
import 'view_model/mydoctor/new_my_doctor_view_model.dart';
import 'view_model/mypayment/my_payment_view.dart';
import 'view_model/qr_code_dr_profile_view_model/profile_view_model.dart';
import 'view_model/real_communication/video_call_view_model.dart';
import 'view_model/resources_view_model/resources_view_model.dart';
import 'view_model/signup_model.dart';
import 'view_model/user_view_model/user_view_model.dart';

@pragma('vm:entry-point')
Future<void> firbaseMessageBackgroundHandeler(RemoteMessage message) async {
  print('Handler a background messahe${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  final prefs = await SharedPreferences.getInstance();
  final cacheUserID = prefs.get(cacheUserIDKey) as String? ?? '';
  final name = prefs.getString(UserP.name) ?? "";
  if (cacheUserID.isNotEmpty) {
    currentUser.id = cacheUserID;
    currentUser.name = '$name';
  }

  /// 1/5: define a navigator key
  final navigatorKey = GlobalKey<NavigatorState>();

  /// 2/5: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    name: "digi_patient",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  // print("FCM Token: $token");
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(firbaseMessageBackgroundHandeler);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await FirebaseApi().initNotifications();
  ZegoUIKit().initLog().then((value) {
    ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

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
          ),
          ChangeNotifierProvider(
            create: (context) => ResourcesViewModel(),
          ),
        ],
        child: MyApp(
          navigatorKey: navigatorKey,
        ),
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  AppUpdateInfo? _updateInfo;
  InAppUpdate inAppUpdate = InAppUpdate();

  @override
  void initState() {
    super.initState();
    // Initialize the InAppUpdate object
    checkForUpdate();
    if (currentUser.id.isNotEmpty) {
      onUserLogin();
    }
  }

  Future<void> checkForUpdate() async {
    try {
      final AppUpdateInfo info = await InAppUpdate.checkForUpdate();
      print("Update check result: ${info.toString()}");

      if (info?.updateAvailability == UpdateAvailability.updateAvailable) {
        // An update is available, prompt the user to update
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Update Available'),
              content:
                  Text('An update is available. Do you want to update now?'),
              actions: <Widget>[
                TextButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    // Start the immediate update
                    InAppUpdate.performImmediateUpdate();
                  },
                ),
                TextButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                ),
              ],
            );
          },
        );
      } else {
        print('No update available.');
      }
    } catch (e) {
      print('Error checking for update: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        // routes: routes,
        // initialRoute:
        //     currentUser.id.isEmpty ? PageRouteNames.login : PageRouteNames.home,

        initialRoute:
            currentUser.id.isEmpty ? RoutesName.splash : RoutesName.dashbord,
        onGenerateRoute: Routes.generateRoute,
        color: AppColors.primaryColor,

        /// 3/5: register the navigator key to MaterialApp
        navigatorKey: widget.navigatorKey,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              child!,

              /// support minimizing
              ZegoUIKitPrebuiltCallMiniOverlayPage(
                contextQuery: () {
                  return widget.navigatorKey.currentState!.context;
                },
              ),
            ],
          );
        },

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
      ),
    );
  }
}
