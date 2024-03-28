import 'package:flutter/cupertino.dart';

class Utils {

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

const double defaultPadding = 16;
const double leadingWidth = 70;