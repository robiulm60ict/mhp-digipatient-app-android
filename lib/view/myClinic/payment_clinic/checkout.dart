import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/resources/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/styles.dart';

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: BottomAppBar(
        elevation: 0,
        child:      Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40.h,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor),
              onPressed: () async {
                // if (payment != Payment.digital) {
                //   Messages.snackBar(context, "Select Digital Payment");
                // } else
                //

                // if (transactionphone.text.isEmpty) {
                //   Messages.snackBar(context, "Enter Payment Number");
                // } else if (transactionphone.text.length != 11) {
                //   Messages.snackBar(
                //       context, "Enter Payment Number must be 11 digit");
                // } else if (transaction.text.isEmpty) {
                //   Messages.snackBar(context, "Enter Transaction Id");
                // } else if (transaction.text.length != 10) {
                //   Messages.snackBar(context,
                //       "Enter Trans ID must be 10 digit");
                // } else if (transactionrefer.text.isEmpty) {
                //   Messages.snackBar(context, "Enter reference name");
                // } else {
                //   // DateTime dateTime = DateFormat('yyyy-MM-dd').parseStrict( widget.appointmentDate);
                //
                //   Map body = {
                //     "doctor_id": widget.doctorId,
                //     "patient_id": widget.patientId,
                //     "date": widget.appointmentDate.split(" ").first,
                //     "appointment_type": widget.appointmentType,
                //     "disease": jsonEncode(items),
                //     "payment_type": "bKash",
                //     // getPaymentMethod(),
                //     "amount": widget.amount,
                //     "transaction_no": transaction.text,
                //     "referred_name": transactionrefer.text,
                //     "transaction_phone_number": transactionphone.text,
                //     "shift": widget.shiftType,
                //     "registration_phone_no":
                //     user!.patientMobilePhone.toString(),
                //   };
                //   print(body);
                //
                //   await apVM.bookAppointment(context,
                //       body: body, doctor: widget.doctor);
                // }
              },
              child: Text(
                "Pay Now",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Advance Payment",
          style: Style.alltext_default_balck_blod,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Style.distan_size10,
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/picturebuttons1.png",
                      height: 70,
                    ),
                    Style.widthdistan_size5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            Text(
                              "4.0 (76)",
                              style: Style.alltext_small_black,
                            )
                          ],
                        ),
                        Style.distan_size2,
                        Text("IBN SINA DGABNIBDi brabch"),
                        Style.distan_size2,
                        Text("Dhaka ,Bangladesh"),
                        Style.distan_size10,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text("500"), Text("/"), Text("month")],
                        ),
                        Style.distan_size10,
                      ],
                    )
                  ],
                ),
              ),
            ),

            Style.distan_size10,
            Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(6.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Method",
                      textAlign: TextAlign.start,
                      style: Style.alltext_default_balck_blod,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),

                    Text(
                      "Pay the doctor’s consultation fee in bkash. Please remember bkash number and 10-digit transaction ID to confirm doctor’s follow-up appointment ",
                      style: Style.alltext_default_balck_blod,textAlign: TextAlign.start,
                    ),



                    Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.r),
                            side: const BorderSide(color: Colors.black)),
                        child:Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(children: [

                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Digital Payment",
                                      style: Style.alltext_default_balck_blod,
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      "Send Money To \n 01900001019",
                                      style: Style.alltext_default_balck_blod,
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  Assets.imagesBkash,
                                  height: 45.h,
                                  width: 50.w,
                                  //fit: BoxFit.fill,
                                ),
                              ],),
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Row(

                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    child: Text(
                                      "Payment Number *",
                                      style: Style.alltext_default_balck,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: null,
                                      keyboardType: TextInputType.number,
                                      maxLength: 11,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: "pay number",
                                        hintStyle: Style.alltext_default_balck,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    child: Text(
                                      "Trans ID *",
                                      style: Style.alltext_default_balck,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      controller:null,
                                      maxLength: 10,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: "xxxxxxxxxxx",
                                        hintStyle: Style.alltext_default_balck,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0.r),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 70.w,
                                    child: Text(
                                      "Reference Name *",
                                      style: Style.alltext_default_balck,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller:null,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        hintText: "xxxxxxxxxxx",
                                        hintStyle: Style.alltext_default_balck,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],),
                        )

                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Invoice Preview",
                      textAlign: TextAlign.start,
                      style: Style.alltext_default_balck_blod,
                    ),

                    SizedBox(
                      height: 8.h,
                    ),
                    Card(
                      color: Colors.green.shade200,
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: Style.alltext_default_balck,
                                ),
                                Text(
                                 "000",
                                  style: Style.alltext_default_balck,
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 12.h,
                            ),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Colors.black,
                              dashGradient: const [Colors.red, Colors.blue],
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapGradient: const [Colors.red, Colors.blue],
                              dashGapRadius: 0.0,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total Amount",
                                  style: Style.alltext_default_balck,
                                ),
                                Text(
                                 "00.0",
                                  style: Style.alltext_default_balck,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
          ],
        ),
      ),
    );
  }
}
