import 'dart:developer';

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
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import 'package:zego_zpns/zego_zpns.dart';
import '/resources/colors.dart';
import '/routes/routes.gr.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'firebase_options.dart';
import 'view_model/mydoctor/new_my_doctor_view_model.dart';
import 'view_model/push_notification/notification_service.dart';
import 'view_model/qr_code_dr_profile_view_model/profile_view_model.dart';
import 'view_model/resources_view_model/resources_view_model.dart';


// @pragma('vm:entry-point')
// Future<void> _zpnsMessagingBackgroundHandler(ZPNsMessage message) async {
//   print("good job");
// }
@pragma('vm:entry-point')
Future<void> firbaseMessageBackgroundHandeler(RemoteMessage message) async {
  print('Handler a background messahe${message.messageId}');
}

class ZPNsEventHandlerManager {
  static loadingEventHandler() {
    ZPNsEventHandler.onRegistered = (pushID) {
      print(pushID.pushID.toString());
    };
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

// final navigationService = NavigationService(appRouter.navigatorKey);

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

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
  // ZPNsEventHandlerManager.loadingEventHandler();
  //
  // if (kIsWeb) {
  //   ZIMAppConfig appConfig = ZIMAppConfig();
  //   appConfig.appID = 1293432009;
  //   appConfig.appSign =
  //       "ce9d090d86cd6d51344033934af611515fdb0fc5760cfd02df1f99c06b0b94cf";
  //
  //   ZIM.create(appConfig);
  //   return;
  // }

  // ZPNs.setBackgroundMessageHandler(_zpnsMessagingBackgroundHandler);
  // ZPNsConfig config = ZPNsConfig();
  // config.enableFCMPush = true;
  // ZPNs.setPushConfig(config);
  // // Request notification rights from the user when appropriate,iOS only
  // ZPNs.getInstance().applyNotificationPermission();
  //
  // ZPNsEventHandler.onNotificationClicked = (ZPNsMessage zpnsMessage) {
  //   if (zpnsMessage.pushSourceType == ZPNsPushSourceType.APNs) {
  //     Map aps = Map.from(zpnsMessage.extras['aps'] as Map);
  //     String payload = aps['payload'];
  //     log("My payload is $payload");
  //   } else if (zpnsMessage.pushSourceType == ZPNsPushSourceType.FCM) {
  //     // FCM does not support this interface,please use Intent get payload at Android Activity.
  //   }
  //   log("user clicked the offline push notification,title is ${zpnsMessage.title},content is ${zpnsMessage.content}");
  // };
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
          builder: (BuildContext context, Widget? child) {
            return Stack(
              children: [
                child!,

                ///  Step 3/3: Insert ZegoUIKitPrebuiltCallMiniOverlayPage into Overlay, and return the context of NavigatorState in contextQuery.
                ZegoUIKitPrebuiltCallMiniOverlayPage(
                  contextQuery: () {
                    return navigatorKey.currentState!.context;
                  },
                ),
              ],
            );
          },
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
