import 'package:digi_patient/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../generated/assets.dart';
import '../resources/styles.dart';

class AppointmentNotificationCard extends StatelessWidget {
  const AppointmentNotificationCard(
      {Key? key,
      required this.docImage,
      required this.title,
      required this.subTitle,
      required this.onTap})
      : super(key: key);
  final String docImage;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: ClipOval(
          child: Image.network(
            docImage,
            fit: BoxFit.cover,
            height: 50,
            width: 50,
            errorBuilder: (context, error, stackTrace) => CircleAvatar(
              backgroundImage: AssetImage(Assets.dummy_image),
            ),
          ),
        ),
        title: RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            children: <TextSpan>[
               TextSpan(text: 'You have an ',style:  TextStyle(fontWeight: FontWeight.bold,color: Colors.green)),
               TextSpan(text: title, style:  TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        subtitle: Text(
          subTitle,
          style: Style.alltext_default_balck,
        ),
      ),
    );
  }
}
