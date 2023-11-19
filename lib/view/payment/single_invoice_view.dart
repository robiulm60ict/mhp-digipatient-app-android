import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/utils/route/routes_name.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:digi_patient/widgets/single_invoice_row.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/doctor_model/doctors_model.dart';
import '../../model/myDoctorList/mydoctorList.dart';
import '../../resources/app_url.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../routes/routes.gr.dart';
import '../../utils/utils.dart';
import '../../view_model/user_view_model/user_view_model.dart';
import '../../widgets/back_button.dart';
import '../../widgets/payment_user_detail.dart';

class SingleInvoiceView extends StatefulWidget {
  const SingleInvoiceView(
      {Key? key,
      required this.appointmentDate,
      required this.doctorId,
      required this.patientId,
      required this.amount,
      required this.appointmentType,
      required this.doctor,
      required this.paymentMethod})
      : super(key: key);
  final String appointmentDate;
  final String doctorId;
  final String patientId;
  final String amount;
  final String appointmentType;
  final Datum doctor;
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

  String getDate(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return "${dateObject.day}-${dateObject.month}-${dateObject.year}";
    } else {
      return "null";
    }
  }

  String getTime(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return DateFormat.jm().format(dateObject);
    } else {
      return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    final userVM = Provider.of<UserViewModel>(context);
    final invoice = Provider.of<AppointmentViewModel>(context);

    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamed(context, RoutesName.dashbord);
        return Future.delayed(const Duration(milliseconds: 1000))
            .then((value) => true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          title: Text(
            "Single Invoice",
            style: Style.alltext_appbar,
          ),
          centerTitle: true,
          leadingWidth: leadingWidth,
          leading: InkWell(
            onTap: () => Navigator.pushNamed(context, RoutesName.dashbord),
            child: Card(
              margin: EdgeInsets.all(8),
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(3),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.primaryColor,
                  size: 20.h,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(20.r),
          children: [
            PaymentUserDetail(
              name:
                  "${widget.doctor.doctors!.title!.titleName} ${widget.doctor.doctors!.drGivenName} ${widget.doctor.doctors!.drMiddleName??""} ${widget.doctor.doctors!.drLastName}",
              designation:
                  "${widget.doctor.doctors!.department?.departmentsName}",
              visitingTime: getTime(widget.appointmentDate),
              hospitalName:
                  "${widget.doctor.doctors?.usualProvider?.usualProviderName.toString()}",
              date: widget.appointmentDate,
              location: "${widget.doctor.doctors?.drWorkPhone}",
              image: '${AppUrls.docImage}${widget.doctor.doctors?.drImages}',
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.r),
                          topRight: Radius.circular(5.r))),
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Invoice",
                              textAlign: TextAlign.start,
                              style: Style.alltext_default_balck_blod,
                            )),
                        SizedBox(
                          height: 8.h,
                        ),
                        SingleInvoiceRow(
                          lTitle: "Invoice",
                          rTitle:
                              "${invoice.appointmentList.isNotEmpty ? invoice.appointmentList.first.inoviceNumber : ""}",
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        SingleInvoiceRow(
                          lTitle: "Invoice Number",
                          rTitle:
                          "${userVM.user?.patientHnNumber}",
                        ),

                        SizedBox(
                          height: 3.h,
                        ),

                        SizedBox(
                          height: 12.h,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Date",
                              textAlign: TextAlign.start,
                              style: Style.alltext_default_balck,
                            )),
                        SizedBox(
                          height: 8.h,
                        ),

                        SingleInvoiceRow(
                          lTitle: "Date",
                          rTitle:
                          getDate(widget.appointmentDate),
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
                      children: [
                        SingleInvoiceRow(
                            lTitle: "Patient Name :",
                            rTitle:
                                "${userVM.user?.patientFirstName} ${userVM.user?.patientLastName}"),
                        SingleInvoiceRow(
                            lTitle: "Mobile Number :",
                            rTitle: "${userVM.user?.patientMobilePhone}"),
                        SingleInvoiceRow(
                            lTitle: "Address :",
                            rTitle: "${userVM.user?.patientAddress1}"),
                        SingleInvoiceRow(
                            lTitle: "Payment Method :",
                            rTitle: "${widget.paymentMethod}"),
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
                      Text(
                        "COST",
                        style: Style.alltext_default_balck_blod,
                      ),
                      Text(
                        "PRICE",
                        style: Style.alltext_default_balck_blod,
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      children: [
                        SingleInvoiceRow(
                            lTitle: "Total Charge", rTitle: widget.amount),
                        const SingleInvoiceRow(
                            lTitle: "Discount", rTitle: "0.00"),
                        const SingleInvoiceRow(lTitle: "Due ", rTitle: "0.00"),
                        const SingleInvoiceRow(
                            lTitle: "VAT/TAX", rTitle: "0.00"),
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
                          height: 12.h,
                        ),
                        SingleInvoiceRow(
                            lTitle: "Total Amount ", rTitle: widget.amount),
                      ],
                    ),
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
