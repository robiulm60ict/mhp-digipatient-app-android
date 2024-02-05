import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class Upcamming extends StatelessWidget {
  const Upcamming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        backgroundColor: AppColors.primary_color,
        centerTitle: true,
        title: Text(
          "UpComing",
          style: Style.alltext_appbar,
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/icons/ringing.png",height: 100,),
            Style.distan_size10,
            Style.distan_size10,
            Style.distan_size10,
            Text(
              "Upcoming....",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
