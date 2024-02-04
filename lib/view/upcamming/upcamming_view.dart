import 'package:digi_patient/resources/colors.dart';
import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';

class Upcamming extends StatelessWidget {
  const Upcamming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: AppColors.primary_color,
        centerTitle: true,
        title: Text("UpComing",style: Style.alltext_appbar,),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset("assets/images/upcamming.jpg")



        ],),
      ),
    );
  }
}
