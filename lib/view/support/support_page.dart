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

        centerTitle: true,
        title: Text(
          "Support",
          style: Style.alltext_appbar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 14, right: 10, top: 10, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "We’re here to help",
                style: Style.alltext_default_balck_blod,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Text(
                "If you have any queries regarding the DigiPatient app, you can review our FAQs, watch our tutorial videos and go through our user manual.",
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
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "⦁	Email: ⦁	info@macrohealthplus.org",
                      style: Style.alltext_default_balck,
                    ),
                    Style.distan_size2,
                    Text(
                      "⦁	Call: +880-1855-777766",
                      style: Style.alltext_default_balck,
                    ),
                    Style.distan_size2,
                    Text(
                      "⦁	LiveChat",
                      style: Style.alltext_default_balck,
                    ),
                    Style.distan_size2,
                    Text(
                      "⦁	Get helpful tips and information for the day of your appointment",
                      style: Style.alltext_default_balck,
                    ),
                  ],
                ),
              ),
              Style.distan_size5,
              Text(
                "Frequently Asked Questions (FAQ)",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. Who is DigiPatient?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. DigiPatient is an application specializing in digital healthcare solutions for individuals who require medical attention for any illness. We offer tools and resources that allow patients to manage their care. We provide valuable data insights to healthcare providers and researchers, which can be used to enhance treatment options and improve overall healthcare outcomes. Our company's headquarters is in Australia, while our branch office is in Bangladesh.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. What does the DigiPatient app do?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. The DigiPatient app is a digital solution for patients across various services. It enables people to track their disease through integrated monitors, allowing them to manage their treatment. We also provide a solution for healthcare professionals to monitor patients",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. Is DigiPatient available for everyone?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. Anyone can download the DigiPatient app using an Android or iOS device. The app can be used with connected internet to record health measurements and track medications, appointments, and more. The DigiPatient for Patient app is only for those people who have been linked with any healthcare institute or professionals. Users can download the app and register with their email address or valid mobile number.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. How can I use the DigiPatient app with or without my doctor or healthcare provider?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. The DigiPatient app can be used in two ways."
                "           \n     ⦁	Your healthcare provider may enroll you in a home monitoring program for your health condition. You will use your DigiPatient app and connected devices to monitor your health data - such as your lung function, blood pressure, and oxygen saturation. The data you record will be shared in real-time with your healthcare team, enabling them to track your progress while you are at home."
                "             \n   ⦁	You can also use the DigiPatient app for day-to-day appointments and laboratory results without being moved to any diagnostic center. This will enable you to track your progress and better manage your condition. You can also download your health data to a report or share your data directly with your healthcare professional. This can help you have valuable discussions with your healthcare team.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. Can I record my health data more often than the app prompts?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. You can record your data more frequently than the app prompts you should you wish to do so. However, please be aware that if a healthcare professional has enrolled you in the DigiPatient program, the clinical team may not view extra readings recorded outside of regular clinical hours. If you feel unwell or have deteriorating symptoms, contact your General Practitioner or attend your local emergency department.",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. I still need help; who can I contact for technical support?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. For support, you can contact us via "
                "\n⦁	Phone- +880-1855-777766"
                "\n⦁	LiveChat"
                "\n⦁ Email- info@macrohealthplus.org"
                "\n ⦁ Or Visit Our Office- House # 35, Road # East Rampura, Dhaka, Bangladesh",
                style: Style.alltext_default_balck,
                textAlign: TextAlign.justify,
              ),
              Style.distan_size5,
              Style.distan_size5,
              Text(
                "Q. How is my health information being used?",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size5,
              Text(
                "Ans. Your health information can be used in two ways:"
                "      \n         ⦁	If you were enrolled in a home monitoring program by your healthcare provider, your data might be reviewed by your healthcare team. Your healthcare provider may use DigiPatient to monitor your progress between your normal clinic visits or use it with telephone or video calling to replace a face-to-face check-up."
                "        \n      ⦁	You can allow your de-identified data to be shared with healthcare researchers to be used in research into your condition. If you consent, your de-identified information (where your name or contact details cannot identify you) will be shared with approved healthcare researchers.",
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
