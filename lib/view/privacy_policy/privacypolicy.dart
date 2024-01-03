import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,

        centerTitle: true,
        title: Text(
          "Privacy & Policy",
          style: Style.alltext_appbar,
        ),
      ),      body: Container(
        padding: EdgeInsets.only(left: 14,right: 10,top: 10,bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About the DigitPatient App",
                style: Style.alltext_default_balck_blod,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Text(
                "Welcome to MacroHealthPlus, where our esteemed team of medical professionals, including doctors, and specialists, collaboratively strive to provide exceptional healthcare services. In order to provide optimal assistance to our esteemed patients and dedicated carers throughout their healthcare journey, we are pleased to offer access to our cutting-edge patient portal, DigiPatient. DigiPatient for Patient app is for people in Bangladesh who have been enrolled in the Patient remote monitoring programme by a healthcare professional. It gives you the tools to manage your condition and take control of your health.",
                style: Style.alltext_default_balck,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size2,
              Text(
                "Stay connected to your care with DigiPatient",
                textAlign: TextAlign.justify,
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size2,
              Text(
                "Before your first appointment, you can use DigiPatient to:",
                textAlign: TextAlign.justify,
                style: Style.alltext_default_balck,
              ),
              Style.distan_size5,
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⦁	Upload medical records",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Choose your Doctor.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Manage appointments.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Get helpful tips and information for the day of your appointment",
                      style: Style.alltext_default_balck,
                    ),
                  ],
                ),
              ),
              Style.distan_size5,
              Text(
                "After your first appointment, you can do even more with DigiPatient, including :",
                textAlign: TextAlign.justify,
                style: Style.alltext_default_balck,
              ),
              Style.distan_size5,
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⦁	See your medical information.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	View your test results.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Manage your appointments.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Connect to a telemedicine visit.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Message your provider.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Request a prescription refill.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Fill out health questionnaires.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Read patient education information. ",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	View and pay bills.",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Upload your family’s medical records as well ",
                      style: Style.alltext_default_balck,
                    ),
                  ],
                ),
              ),
              Style.distan_size5,
              Text(
                "How to enroll in DigiPatient",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size2,
              Text(
                "You can create a DigiPatient account on the DigiPatient app using your username or email address and a password.",
                textAlign: TextAlign.justify,
                style: Style.alltext_default_balck,
              ),
              Style.distan_size2,
              Text(
                "All you need to do is log in into the app with the username and password that you set.",
                textAlign: TextAlign.justify,
                style: Style.alltext_default_balck,
              ),
              Style.distan_size5,
              Text(
                "⦁  Download the DigiPatient app",
                style: Style.alltext_default_balck,
              ), Style.distan_size2,
              Text(
                "⦁	You can access DigiPatient anytime and anywhere with the DigiPatient app. Just search for “DigiPatient” in the Apple App Store or Google Play. Learn more about ",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ), Style.distan_size2,
              Text(
                "⦁	how to download the DigiPatient app and read frequently asked questions about the DigiPatient app.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ), Style.distan_size2,
              Text(
                "⦁	To use the app, Log-In with your DigiPatient username and password.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ), Style.distan_size2,
              Text(
                "⦁	With the app, you have access all the features of DigiPatient. You can save appointment details to the calendar on your mobile device, download and share your test results, and more.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
