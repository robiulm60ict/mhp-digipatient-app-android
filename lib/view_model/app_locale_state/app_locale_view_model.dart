import 'package:flutter/cupertino.dart';

class AppLocaleViewModel extends ChangeNotifier{
  Locale locale = const Locale('en');

   setLocale({required bool isEnglish}) {

     isEnglish ? locale = const Locale("en") : locale = const Locale("bn");
     debugPrint(locale.languageCode + "  $isEnglish");

   notifyListeners();
   }
}