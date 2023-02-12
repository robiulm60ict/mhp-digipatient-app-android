import 'package:digi_patient/view_model/anatomy/anatomy_model.dart';
import 'package:digi_patient/view_model/app_locale_state/app_locale_view_model.dart';
import 'package:digi_patient/view_model/communication%20view%20model/communication_view_model.dart';
import 'package:digi_patient/view_model/home_view_model.dart';
import 'package:digi_patient/view_model/signup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '/resources/colors.dart';
import '/routes/routes.gr.dart';
import '/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_locale/app_locale.dart';
import 'l10n/l10.dart';

final FlutterLocalization localization = FlutterLocalization.instance;

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();


  // @override
  // void initState() {
  //   localization.init(
  //     mapLocales: [
  //       const MapLocale('en', AppLocale.EN),
  //       const MapLocale('bn', AppLocale.BD),
  //       // const MapLocale('en', AppLocale.PLEN),
  //       // const MapLocale('bn', AppLocale.PLBD),
  //     ],
  //     initLanguageCode: 'en',
  //   );
  //   localization.onTranslatedLanguage = _onTranslatedLanguage;
  //   super.initState();
  // }
  //
  // void _onTranslatedLanguage(Locale? locale) {
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppLocaleViewModel>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          // supportedLocales: localization.supportedLocales,
          // localizationsDelegates: localization.localizationsDelegates,
          // locale: provider.locale,
          theme: ThemeData(
            // useMaterial3: true,

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
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        );
      },
    );
  }
}
