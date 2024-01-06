import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';

class TutrialsView extends StatelessWidget {
  const TutrialsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        //automaticallyImplyLeading: false,

        centerTitle: true,
        title: Text(
          "Tutorial",
          style: Style.alltext_default_white,
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Follow the tutorial guide line to use the app",
                style: Style.alltext_ExtraSmall_red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
