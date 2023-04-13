import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentUserDetail extends StatelessWidget {
  const PaymentUserDetail({Key? key, required this.name, required this.designation, required this.visitingTime, required this.hospitalName, required this.date, required this.location, required this.image}) : super(key: key);
  final String name;
  final String designation;
  final String visitingTime;
  final String hospitalName;
  final String date;
  final String location;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: 50.0,
          height: 50.0,
        )
      ),
              title: Text(
                name,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF646464)),
              ),
              subtitle: Text(
                designation,
                style: TextStyle(
                    fontSize: 12.sp, color: const Color(0xFF8A8A8A)),
              ),
            ),
            SizedBox(
              height: 20.h,
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
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8A8A8A),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.home,
                          size: 12.h,
                          color: const Color(0xFF8A8A8A),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          hospitalName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8A8A8A),
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
                          date,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8A8A8A),
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.location_on,
                          size: 12.h,
                          color: const Color(0xFF8A8A8A),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8A8A8A),
                          ),
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
