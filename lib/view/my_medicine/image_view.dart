import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

import '../../../resources/app_url.dart';
import '../../../resources/colors.dart';
import '../../../resources/styles.dart';
import '../../../widgets/back_button.dart';
import '../../utils/utils.dart';

class ImageView extends StatelessWidget {
  ImageView({super.key, required this.image});

  var image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.page_background_color,
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,

          title: Text("Prescription Image", style: Style.alltext_appbar),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: PhotoView(
              imageProvider: NetworkImage( "${image}",),
             ),
        ),
      ),
    );
  }
}
