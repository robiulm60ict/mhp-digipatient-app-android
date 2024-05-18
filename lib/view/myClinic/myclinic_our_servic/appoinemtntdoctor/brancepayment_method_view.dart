import 'dart:convert';

import 'package:digi_patient/generated/assets.dart';
import 'package:digi_patient/utils/message.dart';
import 'package:digi_patient/view_model/appointment_view_model/appointment_view_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../model/anatomy/anatomy_symptoms_model.dart';
import '../../../../model/clinic/mydoctorlistbrance.dart';
import '../../../../model/clinic/orgamozationlist_model.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';
import '../../../../utils/utils.dart';
import '../../../../view_model/anatomy/anatomy_view_model.dart';
import '../../../../view_model/appointment_view_model/brance_appointment_view_model.dart';
import '../../../../view_model/user_view_model/user_view_model.dart';
import '../../../../widgets/back_button.dart';

class BrancePaymentMethodView extends StatefulWidget {
  BrancePaymentMethodView({
    Key? key,
    required this.appointmentDate,
    required this.doctorId,
    required this.patientId,
    required this.amount,
    required this.saas_branch_id,
    required this.appointmentType,
    required this.shiftType,
    required this.doctor,
    required this.diseaseList,
    required this.branch,
    required this.DbName,
  }) : super(key: key);
  final String appointmentDate;
  final String doctorId;
  final String patientId;
  final String amount;
  final String saas_branch_id;
  final String appointmentType;
  final String shiftType;
  final MhpDoctorsMaster doctor;
  final List<SymptomsAnatomy> diseaseList;
  Branch? branch;
  String? DbName;

  @override
  State<BrancePaymentMethodView> createState() => _PaymentMethodViewState();
}

class _PaymentMethodViewState extends State<BrancePaymentMethodView> {
  // int _selectedCreditValue = 1;
  int _selectedDigitalValue = 1;

  final List<String> creditCardValue = [
    Assets.imagesVisa,
    Assets.imagesMastercard,
    Assets.imagesAmericanExpress
  ];
  final List<String> digitalPayValue = [
    Assets.imagesBkash,
    Assets.imagesRocket,
    Assets.imagesNagad
  ];

  // PageStorageKey creditKey = const PageStorageKey("credit");

  Payment payment = Payment.cash;
  TextEditingController transaction = TextEditingController();
  TextEditingController transactionphone = TextEditingController();
  TextEditingController transactionrefer = TextEditingController();
  FocusNode transactionFocusNode = FocusNode();

  @override
  void initState() {
    data();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    transaction.dispose();
    transactionphone.dispose();
    transactionrefer.dispose();
    transactionFocusNode.dispose();
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

  List items = [];

  data() {
    for (var i in widget.diseaseList) {
      items.add(i.symptomName);
    }
    print("dfffffddddddddddddddddddddddddddddddfffff${items}");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserViewModel>(context).user;

    final apVM =
        Provider.of<BranceAppointmentViewModel>(context, listen: false);
    final anatomy = Provider.of<AnatomyModelView>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,
        title: Text(
          "Payment Method ",
          style: Style.alltext_appbar,
        ),
        centerTitle: true,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
      ),
      body: ListView(
        padding: EdgeInsets.all(6.r),
        children: [
          // PaymentUserDetail(
          //   name: " ${widget.doctor.doctors?.fullName}",
          //   designation:
          //       "${widget.doctor.doctors!.department!.departmentsName}",
          //   visitingTime: getTime(widget.appointmentDate),
          //   hospitalName:
          //       "${widget.doctor.doctors!.usualProvider != null ? widget.doctor.doctors!.usualProvider?.usualProviderName.toString() : ""}",
          //   date: widget.appointmentDate,
          //   location: "${widget.doctor.doctors?.drWorkPhone}",
          //   image: '${AppUrls.docImage}${widget.doctor.doctors?.drImages}',
          //   shift: widget.shiftType,
          // ),
          SizedBox(
            height: 6.h,
          ),
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
                    style: Style.alltext_default_balck_blod,
                    textAlign: TextAlign.start,
                  ),

                  // ListTile(
                  //   onTap: () {
                  //     payment = Payment.cash;
                  //     setState(() {});
                  //   },
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(2.r),
                  //       side: const BorderSide(color: Colors.black)),
                  //   leading: CircleAvatar(
                  //       radius: 10.r,
                  //       // backgroundColor: Colors.white,
                  //       child: Icon(
                  //         Icons.circle,
                  //         size: 15.h,
                  //         color: payment == Payment.cash
                  //             ? AppColors.primaryColor
                  //             : Colors.white,
                  //       )),
                  //   title: Text(
                  //     "Cash",
                  //     style: TextStyle(
                  //         fontSize: 12.sp,
                  //         fontWeight: FontWeight.w500,
                  //         color: const Color(0xFF8A8A8A)),
                  //   ),
                  //   trailing: Image.asset(
                  //     Assets.imagesCash,
                  //     height: 20.h,
                  //     width: 30.w,
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 8.h,
                  // ),
                  ///
                  // Card(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(2.r),
                  //       side: const BorderSide(color: Colors.black)),
                  //   child: ExpansionTile(
                  //     leading: CircleAvatar(
                  //         radius: 10.r,
                  //         // backgroundColor: Colors.white,
                  //         child: Icon(
                  //           Icons.circle,
                  //           size: 15.h,
                  //           color: payment == Payment.credit
                  //               ? AppColors.primaryColor
                  //               : Colors.white,
                  //         )),
                  //     trailing: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       mainAxisAlignment: MainAxisAlignment.end,
                  //       children: [
                  //         Image.asset(
                  //           Assets.imagesVisa,
                  //           height: 15.h,
                  //           width: 30.w,
                  //           fit: BoxFit.fill,
                  //         ),
                  //         SizedBox(
                  //           width: 5.w,
                  //         ),
                  //         Image.asset(
                  //           Assets.imagesMastercard,
                  //           height: 15.h,
                  //           width: 30.w,
                  //           fit: BoxFit.fill,
                  //         ),
                  //         SizedBox(
                  //           width: 5.w,
                  //         ),
                  //         Image.asset(
                  //           Assets.imagesAmericanExpress,
                  //           height: 15.h,
                  //           width: 30.w,
                  //           fit: BoxFit.fill,
                  //         ),
                  //       ],
                  //     ),
                  //     onExpansionChanged: (value) {
                  //       setState(() {
                  //         payment = Payment.credit;
                  //       });
                  //     },
                  //     title: Text(
                  //       "Credit / Devid Card",
                  //       style: TextStyle(
                  //           fontSize: 12.sp,
                  //           fontWeight: FontWeight.w500,
                  //           color: const Color(0xFF8A8A8A)),
                  //     ),
                  //     children: [
                  //       Row(
                  //         children: creditCardValue.map((value) {
                  //           return Expanded(
                  //             child: RadioListTile(
                  //               title: Image.asset(
                  //                 value,
                  //                 height: 15.h,
                  //                 width: 10.w,
                  //                 // fit: BoxFit.fill,
                  //               ),
                  //               value: creditCardValue.indexOf(value) + 1,
                  //               groupValue: _selectedCreditValue,
                  //               onChanged: (newValue) {
                  //                 setState(() {
                  //                   _selectedCreditValue = newValue!;
                  //                 });
                  //               },
                  //             ),
                  //           );
                  //         }).toList(),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.all(8.0.r),
                  //         child: Row(
                  //           children: [
                  //             Text(
                  //               "Card Number",
                  //               style: TextStyle(
                  //                   fontSize: 11.sp,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Colors.grey),
                  //             ),
                  //             SizedBox(
                  //               width: 15.w,
                  //             ),
                  //             Expanded(
                  //                 child: TextField(
                  //               decoration: InputDecoration(
                  //                   filled: true,
                  //                   fillColor: Colors.grey.shade200,
                  //                   border: InputBorder.none,
                  //                   focusedBorder: InputBorder.none,
                  //                   enabledBorder: InputBorder.none,
                  //                   hintText: "place here",
                  //                   hintStyle:
                  //                       TextStyle(color: Colors.grey.shade500)),
                  //             ))
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),

                  widget.doctor!.drHomePhone == null ||
                          widget.doctor!.drHomePhone.toString() == "null"
                      ? SizedBox(
                          child: const Card(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              "Doctor No Payment Number",
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        ))
                      : Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.r),
                              side: const BorderSide(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Digital Payment",
                                          style:
                                              Style.alltext_default_balck_blod,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Text(
                                          "Send Money To \n ${widget.doctor!.drHomePhone.toString()}",
                                          style:
                                              Style.alltext_default_balck_blod,
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      Assets.imagesBkash,
                                      height: 45.h,
                                      width: 50.w,
                                      //fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
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
                                          controller: transactionphone,
                                          keyboardType: TextInputType.number,
                                          maxLength: 11,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey.shade200,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText: "pay number",
                                            hintStyle:
                                                Style.alltext_default_balck,
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
                                          controller: transaction,
                                          maxLength: 10,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey.shade200,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText: "xxxxxxxxxxx",
                                            hintStyle:
                                                Style.alltext_default_balck,
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
                                          controller: transactionrefer,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.grey.shade200,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            hintText: "xxxxxxxxxxx",
                                            hintStyle:
                                                Style.alltext_default_balck,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )

                          // ExpansionTile(
                          //     initiallyExpanded: true,
                          //
                          //
                          //
                          //   // leading: CircleAvatar(
                          //   //     radius: 10.r,
                          //   //     // backgroundColor: Colors.white,
                          //   //     child: Icon(
                          //   //       Icons.circle,
                          //   //       size: 15.h,
                          //   //       color: payment == Payment.digital
                          //   //           ? AppColors.primaryColor
                          //   //           : Colors.white,
                          //   //     )),
                          //   trailing: Image.asset(
                          //     Assets.imagesBkash,
                          //     height: 45.h,
                          //     width: 50.w,
                          //     //fit: BoxFit.fill,
                          //   ),
                          //
                          //   // Row(
                          //   //   mainAxisSize: MainAxisSize.min,
                          //   //   mainAxisAlignment: MainAxisAlignment.center,
                          //   //   children: [
                          //   //     Image.asset(
                          //   //       Assets.imagesBkash,
                          //   //       height: 45.h,
                          //   //       width: 50.w,
                          //   //       fit: BoxFit.fill,
                          //   //     ),
                          //   //     // SizedBox(
                          //   //     //   width: 5.w,
                          //   //     // ),
                          //   //     // Image.asset(
                          //   //     //   Assets.imagesRocket,
                          //   //     //   height: 15.h,
                          //   //     //   width: 30.w,
                          //   //     //   fit: BoxFit.fill,
                          //   //     // ),
                          //   //     // SizedBox(
                          //   //     //   width: 5.w,
                          //   //     // ),
                          //   //     // Image.asset(
                          //   //     //   Assets.imagesNagad,
                          //   //     //   height: 15.h,
                          //   //     //   width: 30.w,
                          //   //     //   fit: BoxFit.fill,
                          //   //     // ),
                          //   //   ],
                          //   // ),
                          //   // onExpansionChanged: (value) {
                          //   //   setState(() {
                          //   //     payment = Payment.digital;
                          //   //   });
                          //   // },
                          //   title: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.center,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         "Digital Payment",
                          //         style: Style.alltext_default_balck_blod,
                          //       ),
                          //       SizedBox(
                          //         height: 4.h,
                          //       ),
                          //       Text(
                          //         "Send Money To \n ${widget.doctor.doctors!.drHomePhone.toString()}",
                          //         style: Style.alltext_default_balck_blod,
                          //       ),
                          //     ],
                          //   ),
                          //   children: [
                          //     // Row(
                          //     //   children: digitalPayValue.map((value) {
                          //     //     return Expanded(
                          //     //       child: RadioListTile(
                          //     //         title: Image.asset(
                          //     //           value,
                          //     //           height: 15.h,
                          //     //           width: 30.w,
                          //     //           fit: BoxFit.fill,
                          //     //         ),
                          //     //         value: digitalPayValue.indexOf(value) + 1,
                          //     //         groupValue: _selectedDigitalValue,
                          //     //         onChanged: (newValue) {
                          //     //           setState(() {
                          //     //             _selectedDigitalValue = newValue!;
                          //     //           });
                          //     //         },
                          //     //       ),
                          //     //     );
                          //     //   }).toList(),
                          //     // ),
                          //     // Center(
                          //     //   child: Text(
                          //     //     "Send Money To ${widget.doctor.doctors!.drHomePhone.toString()}",
                          //     //     style: Style.alltext_default_balck_blod,
                          //     //   ),
                          //     // ),
                          //     Padding(
                          //       padding: EdgeInsets.all(8.0.r),
                          //       child: Row(
                          //
                          //         children: [
                          //           SizedBox(
                          //             width: 70.w,
                          //             child: Text(
                          //               "Payment Number *",
                          //               style: Style.alltext_default_balck,
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: 5.w,
                          //           ),
                          //           Expanded(
                          //             child: TextField(
                          //               controller: transactionphone,
                          //               keyboardType: TextInputType.number,
                          //               maxLength: 11,
                          //               decoration: InputDecoration(
                          //                 filled: true,
                          //                 fillColor: Colors.grey.shade200,
                          //                 border: InputBorder.none,
                          //                 focusedBorder: InputBorder.none,
                          //                 enabledBorder: InputBorder.none,
                          //                 hintText: "pay number",
                          //                 hintStyle: Style.alltext_default_balck,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.all(8.0.r),
                          //       child: Row(
                          //         children: [
                          //           SizedBox(
                          //             width: 70.w,
                          //             child: Text(
                          //               "Trans ID *",
                          //               style: Style.alltext_default_balck,
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: 5.w,
                          //           ),
                          //           Expanded(
                          //             child: TextField(
                          //               keyboardType: TextInputType.text,
                          //               controller: transaction,
                          //               maxLength: 10,
                          //               decoration: InputDecoration(
                          //                 filled: true,
                          //                 fillColor: Colors.grey.shade200,
                          //                 border: InputBorder.none,
                          //                 focusedBorder: InputBorder.none,
                          //                 enabledBorder: InputBorder.none,
                          //                 hintText: "xxxxxxxxxxx",
                          //                 hintStyle: Style.alltext_default_balck,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: EdgeInsets.all(8.0.r),
                          //       child: Row(
                          //         children: [
                          //           SizedBox(
                          //             width: 70.w,
                          //             child: Text(
                          //               "Reference Name *",
                          //               style: Style.alltext_default_balck,
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: 5.w,
                          //           ),
                          //           Expanded(
                          //             child: TextField(
                          //               controller: transactionrefer,
                          //               decoration: InputDecoration(
                          //                 filled: true,
                          //                 fillColor: Colors.grey.shade200,
                          //                 border: InputBorder.none,
                          //                 focusedBorder: InputBorder.none,
                          //                 enabledBorder: InputBorder.none,
                          //                 hintText: "xxxxxxxxxxx",
                          //                 hintStyle: Style.alltext_default_balck,
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Invoice Preview",
                    textAlign: TextAlign.start,
                    style: Style.alltext_default_balck_blod,
                  ),
                  // SizedBox(
                  //   height: 8.h,
                  // ),
                  //  Text("Support Number : 0100000000",style: Style.alltext_ExtraSmall_red,),

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
                                widget.amount,
                                style: Style.alltext_default_balck,
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 6.h,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Discount",
                          //       style: Style.alltext_default_balck,
                          //     ),
                          //     Text(
                          //       "00.00",
                          //       style: Style.alltext_default_balck,
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(
                          //   height: 6.h,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       "Vat/Tax",
                          //       style: Style.alltext_default_balck,
                          //     ),
                          //     Text(
                          //       "00.00",
                          //       style: Style.alltext_default_balck,
                          //     ),
                          //   ],
                          // ),
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
                                widget.amount,
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
                  SizedBox(
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

                        if (transactionphone.text.isEmpty) {
                          Messages.snackBar(context, "Enter Payment Number");
                        } else if (transactionphone.text.length != 11) {
                          Messages.snackBar(
                              context, "Enter Payment Number must be 11 digit");
                        } else if (transaction.text.isEmpty) {
                          Messages.snackBar(context, "Enter Transaction Id");
                        } else if (transaction.text.length != 10) {
                          Messages.snackBar(
                              context, "Enter Trans ID must be 10 digit");
                        } else if (transactionrefer.text.isEmpty) {
                          Messages.snackBar(context, "Enter reference name");
                        } else {
                          // DateTime dateTime = DateFormat('yyyy-MM-dd').parseStrict( widget.appointmentDate);

                          Map body = {
                            "doctor_id": widget.doctorId,
                            // "patient_id": "2",
                            "patient_hn_number": widget.patientId,
                            "date": widget.appointmentDate.split(" ").first,
                            "appointment_type": widget.appointmentType,
                            "disease": jsonEncode(items),
                            "payment_type": "bKash",
                            // getPaymentMethod(),
                            "amount": widget.amount,
                            "saas_branch_id": widget.saas_branch_id,
                            "transaction_no": transaction.text,
                            "referred_name": transactionrefer.text,
                            "transaction_phone_number": transactionphone.text,
                            "shift": widget.shiftType,
                            "registration_phone_no":
                                user!.patientMobilePhone.toString(),
                          };
                          print(body);

                          await apVM.bookAppointmentbrance(context,
                              body: body,
                              doctor: widget.doctor,
                              DbName: widget.DbName);
                        }
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getPaymentMethod() {
    if (payment == Payment.cash) {
      return "Cash";
    } else {
      if (_selectedDigitalValue == 1) {
        return "bKash";
      } else if (_selectedDigitalValue == 2) {
        return "Rocket";
      } else {
        return "Nagad";
      }
    }
  }
}

enum Payment { cash, digital, credit }
