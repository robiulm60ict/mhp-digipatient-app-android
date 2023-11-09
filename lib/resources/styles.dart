// ignore_for_file: non_constant_identifier_names, constant_identifier_names, duplicate_ignore



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';



class Style {
  // static double width=MediaQuery.of(context as BuildContext).size.width;
  // static double fontSizeExtraSmall =width >= 1300 ? 14 : 10;
  // static double fontSizeSmall = width >= 1300 ? 16 : 12;
  //  static double fontSizeDefault = width >= 1300 ? 18 : 14;
  //  static double fontSizeLarge = width >= 1300 ? 20 : 16;
  // static double fontSizeExtraLarge = width >= 1300 ? 22 : 18;
  //  static double fontSizeOverLarge = width >= 1300 ? 28 : 24;
  static TextStyle alltext_small_black = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: AppColors.text_primary_color,
    fontSize: 10.sp,
  );
  static TextStyle alltext_default_balck_dashbord = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 14.sp,
  ); static TextStyle alltext_default_balck = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 14.sp,
  );
  static TextStyle alltext_default_balck_w700 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.text_primary_color,
    fontSize: 14.sp,
  );
  static TextStyle alltext_default_balck_blod = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.text_primary_color,
    fontSize: 14.sp,
  );

  static TextStyle alltext_ExtraSmall_black = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 10.sp,
  );
  static TextStyle alltext_ExtraSmall_red = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.snackbar_error_color,
    fontSize: 10.sp,
  );
  static TextStyle alltext_Extra_ExtraSmall_black = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize:10.sp,
  );
  static TextStyle alltext_ExtraLarge_black = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 22.sp,
  );
  static TextStyle alltext_Large_black = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.text_primary_color,
    fontSize: 16.sp,
  );
  static TextStyle alltext_OverLarge_black = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 24.sp,
  );
// ignore: constant_identifier_names
  static TextStyle drawer_heading_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.drawer_button_colors,
    fontSize: 20,
  );
  static TextStyle alltext_small_white = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 12.sp,
  );
  static TextStyle alltext_default_white = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize:14.sp,
  );
  static TextStyle alltext_Large_white = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 16.sp,
  );
  static TextStyle alltext_ExtraSmall_white = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 10.sp,
  );
  static TextStyle alltext_ExtraLarge_white = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 18.sp,
  );
  static TextStyle alltext_OverLarge_white = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 24.sp,
  );
  static TextStyle alltext_small_primary = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.primary_color,
    fontSize: 14.sp,
  );

  static TextStyle alltext_default_primary = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.primary_color,
    fontSize: 14.sp,
  );
  static TextStyle alltext_Large_primary = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.primary_color,
    fontSize: 16.sp,
  );

  static TextStyle alltext_ExtraSmall_primary = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.primary_color,
    fontSize: 18.sp,
  );
  static TextStyle alltext_ExtraLarge_primary = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.primary_color,
    fontSize: 18.sp,
  );
  static TextStyle alltext_OverLarge_primary = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.primary_color,
    fontSize: 24.sp,
  );





  //
  // // ignore: constant_identifier_names
  // static const landscript_text_filed_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w600,
  //   color: ColorsCode.text_primary_color,
  //   fontSize: 12,
  // );
  //
  // ignore: constant_identifier_names
  static TextStyle drawer_button_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.drawer_button_colors,
    fontSize: 12,
  );
  // ignore: constant_identifier_names
  static TextStyle alltext_block_text_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 14,
  );
  // ignore: constant_identifier_names
  static TextStyle alltext_white_text_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 10,
  );

  // ignore: constant_identifier_names
  static TextStyle drawer_button_selected_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 12,
  );
  static TextStyle drawer_button_selected_style_home = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 12,
  );
  static TextStyle drawer_button_selected_style_home1 = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 12,
  );
  static const drawer_logoutbutton_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    color: AppColors.drawer_button_colors,
    fontSize: 16,
  );
  // // ignore: constant_identifier_names
  // static const text_hind_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w400,
  //   color: ColorsCode.hint_text_color,
  //   fontSize: 15,
  // );
  // static const dashboardBlackText400 = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w400,
  //   color: ColorsCode.text_primary_color,
  //   fontSize: 15,
  // );
  //
  // // ignore: constant_identifier_names
  // static const text_block_text_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w400,
  //   color: ColorsCode.page_background_color,
  //   fontSize: 14,
  // );
  //
  // ignore: constant_identifier_names
  static TextStyle level_heading_text_block_text_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.page_background_color,
    fontSize: 15,
  );
  // ignore: constant_identifier_names
  static TextStyle level_heading_text_block1_text_style = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: AppColors.text_primary_color,
    fontSize: 15,
  );
  //
  // static const robotoHeader15primaryColor = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w700,
  //   color: ColorsCode.primary_color,
  //   fontSize: 15,
  // );
  //
  // // ignore: constant_identifier_names
  // static const text_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w400,
  //   color: ColorsCode.snackbar_error_color,
  //   fontSize: 15,
  // );
  // static const text_style_primary = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w400,
  //   color: ColorsCode.primary_color,
  //   fontSize: 15,
  // );
  // // ignore: constant_identifier_names
  // static const block_text_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w600,
  //   color: ColorsCode.text_primary_color,
  //   fontSize: 15,
  // );
  //
  // // ignore: constant_identifier_names
  // static const error_text_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w400,
  //   color: ColorsCode.snackbar_error_color,
  //   fontSize: 12,
  // );
  //
  // static const orderError = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w500,
  //   color: ColorsCode.text_field_error_colors,
  //   fontSize: 15,
  // );
  //
  // // ignore: constant_identifier_names
  // static const submit_button_style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w900,
  //   color: ColorsCode.submit_button_text_primary_color,
  //   fontSize: 15,
  // );
  // // ignore: constant_identifier_names
  // static const button_style = ButtonStyle(
  //   backgroundColor: MaterialStatePropertyAll(ColorsCode.primary_color),
  // );
  //
  // // ignore: constant_identifier_names
  // static const submit_button_style_black = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontWeight: FontWeight.w700,
  //   color: ColorsCode.submit_button_text_primary_colorblack,
  //   fontSize: 15,
  // );



  // ignore: constant_identifier_names
  static const distan_size20 = SizedBox(
    height: 20,
  );
  // ignore: constant_identifier_names
  static const distan_size15 = SizedBox(
    height: 15,
  );
  // ignore: constant_identifier_names
  static const distan_size10 = SizedBox(
    height: 10,
  );
  // ignore: constant_identifier_names
  static const distan_size5 = SizedBox(
    height: 5,
  );
  static const distan_size3 = SizedBox(
    height: 3,
  );
  // ignore: constant_identifier_names
  static const distan_size2 = SizedBox(
    height: 2,
  );
  // ignore: constant_identifier_names
  static const distan_size1 = SizedBox(
    height: 2,
  );
  // ignore: constant_identifier_names
  static const widthdistan_size20 = SizedBox(
    width: 20,
  );
  // ignore: constant_identifier_names
  static const widthdistan_size15 = SizedBox(
    width: 15,
  );
  // ignore: constant_identifier_names
  static const widthdistan_size10 = SizedBox(
    width: 10,
  );
  // ignore: constant_identifier_names
  static const widthdistan_size5 = SizedBox(
    width: 5,
  );
  // ignore: constant_identifier_names
  static const widthdistan_size2 = SizedBox(
    width: 2,
  );
  // ignore: constant_identifier_names
  static const widthdistan_size1 = SizedBox(
    width: 2,
  );

  // ignore: constant_identifier_names
  static const drawe_icon_size = 30;


}