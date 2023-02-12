import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// final smallFontStyle = GoogleFonts.poppins(fontSize: 12.sp, color: Palette.palette);
// final smallFontStyle2 = GoogleFonts.poppins(fontSize: 11.sp, color: Colors.grey);

class CustomText extends StatelessWidget {
  const CustomText({Key? key, required this.title, this.fontSize = 14, this.color = Colors.white}) : super(key: key);
  final String title;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: fontSize.sp, color: color),);
  }
}
