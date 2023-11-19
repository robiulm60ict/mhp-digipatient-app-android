import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/back_button.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text(
          "Support",
          style: Style.alltext_appbar,
        ),
      ),      body: Container(
        padding: EdgeInsets.only(left: 14,right: 10,top: 10,bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We’re here to help",
                style: Style.alltext_default_balck_blod,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Text("If you have any queries regarding the DigiPatient app, you can review our FAQs, watch our tutorial videos and go through our user manual.",
                style: Style.alltext_default_balck,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size2,
              Text(
                "For further assistance, you can always contact our 24/7 active Customer Support via:",
                textAlign: TextAlign.justify,
                style: Style.alltext_default_balck_blod,
              ),

              Style.distan_size5,
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⦁	Email: ⦁	info@macrohealthplus.org",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	Call: +880-1855-777766",
                      style: Style.alltext_default_balck,
                    ), Style.distan_size2,
                    Text(
                      "⦁	LiveChat",
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
              Text("Frequently Asked Questions (FAQ)",style: Style.alltext_default_balck_blod,),

            ],
          ),
        ),
      ),
    );
  }
}
