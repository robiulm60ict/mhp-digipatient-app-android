import 'package:digi_patient/widgets/single_invoice_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/doctor_model/doctors_model.dart';
import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/payment_user_detail.dart';

class SingleInvoiceView extends StatefulWidget {
  const SingleInvoiceView({Key? key, required this.appointmentDate, required this.doctorId, required this.patientId, required this.amount, required this.appointmentType, required this.doctor, required this.paymentMethod}) : super(key: key);
  final String appointmentDate;
  final String doctorId;
  final String patientId;
  final String amount;
  final String appointmentType;
  final Doctors doctor;
  final String paymentMethod;

  @override
  State<SingleInvoiceView> createState() => _SingleInvoiceViewState();
}

class _SingleInvoiceViewState extends State<SingleInvoiceView> {

  @override
  void initState() {
    super.initState();
    context.read<UserViewModel>().getUserDetails();

  }
  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Single Invoice",
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
        centerTitle: true,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton( poopAllRoute: true,),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
      PaymentUserDetail(
      name: "${widget.doctor.drFullName}",
        designation: "${widget.doctor.department?.departmentsName}",
        visitingTime: "null",
        hospitalName: "${widget.doctor.usualProvider?.usualProviderName}",
        date: widget.appointmentDate,
        location: "${widget.doctor.drMobilePhone}",
        image: '${AppUrls.docImage}${widget.doctor.drImages}',),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.r), topRight: Radius.circular(5.r))

                ),
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Invoice", textAlign: TextAlign.start, style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),)),
                      SizedBox(height: 8.h,),
                      Row(
                        children: [
                          Expanded(child: Text("Invoice Number : ", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),)),
                          Expanded(child: Text("HN Number :", textAlign: TextAlign.start, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),)),
                        ],
                      ),
                      SizedBox(height: 3.h,),
                      Row(
                        children: [
                          Expanded(child: Text("156858485487", style: TextStyle(fontSize: 14.sp,  color: Colors.white),)),
                          Expanded(child: Text("28545815845", textAlign: TextAlign.start, style: TextStyle(fontSize: 14.sp, color: Colors.white),)),
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Date", textAlign: TextAlign.start, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),)),
                      SizedBox(height: 8.h,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.date_range, color: Colors.white, size: 15.h,),
                          SizedBox(width: 5.w,),
                          Text(widget.appointmentDate, style: TextStyle(fontSize: 14.sp, color: Colors.white),),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    children:  [
                      SingleInvoiceRow(lTitle: "Patient Name :", rTitle: "${userVM.user?.patientFirstName} ${userVM.user?.patientMiddleName} ${userVM.user?.patientLastName}"),
                      SingleInvoiceRow(lTitle: "Mobile Number :", rTitle: "${userVM.user?.patientMobilePhone}"),
                      SingleInvoiceRow(lTitle: "Address :", rTitle: "${userVM.user?.patientAddress1}"),
                      SingleInvoiceRow(lTitle: "Payment Method :", rTitle: "${widget.paymentMethod}"),

                    ],
                  ),
                ),
              ),
              Container(
                height: 40.h,
                color: const Color(0xFFE9F3DF),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("COST", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),),
                    Text("PRICE", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.black),),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(15.r),
                  child: Column(
                    children:  [
                       SingleInvoiceRow(lTitle: "Total Charge", rTitle: widget.amount),
                      const SingleInvoiceRow(lTitle: "Discount", rTitle: "0.00"),
                      const SingleInvoiceRow(lTitle: "Due ", rTitle: "0.00"),
                      const SingleInvoiceRow(lTitle: "VAT/TAX", rTitle: "0.00"),
                      SizedBox(height: 12.h,),
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
                      SizedBox(height: 12.h,),
                       SingleInvoiceRow(lTitle: "Total Amount ", rTitle: widget.amount),

                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


