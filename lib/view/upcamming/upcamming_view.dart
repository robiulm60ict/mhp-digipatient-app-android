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
            Stack(
              children: [
                Image.asset("assets/icons/nodataupcaming.jpg"),
                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    "assets/images/upcamming.png",
                    height: 150,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
