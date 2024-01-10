import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../generated/assets.dart';
import '../resources/styles.dart';

class PaymentUserDetail extends StatelessWidget {
  const PaymentUserDetail(
      {Key? key,
      required this.name,
      required this.designation,
      required this.visitingTime,
      required this.hospitalName,
      required this.date,
      required this.location,
      required this.shift,
      required this.image})
      : super(key: key);
  final String name;
  final String designation;
  final String visitingTime;
  final String hospitalName;
  final String date;
  final String location;
  final String image;
  final String shift;

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                  child: SizedBox(
                width: 50.0,
                height: 50.0,
                child:image.toString().split("/").last!="null"? Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 50.0,
                  height: 50.0,
                ):Image.asset(  Assets.dummy_image),
              )),
              title: Text(
                name,
                style: Style.alltext_default_balck_blod,
              ),
              subtitle: Text(
                designation,
                style: Style.alltext_default_balck,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              color: const Color(0xFFF1F4F7),
              child: Padding(
                padding: EdgeInsets.all(10.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          size: 12.h,
                          color: const Color(0xFF8A8A8A),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          visitingTime,
                          style: Style.alltext_default_balck,
                        ),
                        const Spacer(),
                        hospitalName != ""
                            ? Icon(
                                Icons.home,
                                size: 12.h,
                                color: const Color(0xFF8A8A8A),
                              )
                            : Container(),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: Text(
                            hospitalName,
                            style: Style.alltext_default_balck,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          size: 12.h,
                          color: const Color(0xFF8A8A8A),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          myRecord.getDate(date),
                          style: Style.alltext_default_balck,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.call,
                          size: 12.h,
                          color: const Color(0xFF8A8A8A),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          location,
                          style: Style.alltext_default_balck,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
