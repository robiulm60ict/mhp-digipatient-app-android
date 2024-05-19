import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sslcommerz/model/SSLCAdditionalInitializer.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../generated/assets.dart';
import '../../../../model/anatomy/anatomy_symptoms_model.dart';
import '../../../../model/clinic/mydoctorlistbrance.dart';
import '../../../../model/clinic/orgamozationlist_model.dart';
import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';
import '../../../../utils/message.dart';
import '../../../../utils/user.dart';
import '../../../../utils/utils.dart';
import '../../../../view_model/anatomy/anatomy_view_model.dart';
import '../../../../view_model/appointment_view_model/brance_appointment_view_model.dart';
import '../../../../view_model/user_view_model/user_view_model.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/shimmer.dart';
import '../../../anatomy/anatomy_view.dart';
import '../../../my_record/my_report_upload_view.dart';
import '../../../my_record/uploaded_myreport.dart';

import 'package:flutter_sslcommerz/flutter_sslcommerz.dart';

import 'brancepayment_method_view.dart';

class BranceBookAppointmentView extends StatefulWidget {
  BranceBookAppointmentView({Key? key,
    required this.doctors,
    required this.amount,
    required this.branch,
    required this.DbName})
      : super(key: key);
  final MhpDoctorsMaster doctors;
  Branch? branch;
  String? DbName;

  final String amount;

  @override
  State<BranceBookAppointmentView> createState() => _BookAppointmentViewState();
}

class _BookAppointmentViewState extends State<BranceBookAppointmentView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAmount();
    });
  }

  getAmount() {
    print(
        "apicccccccccccccccccccccccccccccccccccccccccccccccccccc${widget
            .DbName}");
    // context.read<MyDoctorViewModel>().getDoctorFee(widget.doctors.id);
    // context.read<AppointmentViewModel>().setWeekDays();
    context.read<BranceAppointmentViewModel>().getDocChamberTime(
        context, "", widget.DbName, widget.branch!.id,
        docId: widget.doctors.id);
    context.read<BranceAppointmentViewModel>().getDocChamberTimeCalender(
        context, "", widget.DbName, widget.branch!.id,
        docId: widget.doctors.id);
    // context.read<AnatomyModelView>().getSelectedSymptomsList();
  }

  bool isHospitalSelected = true;

  var morning = "";
  var evenimg = "";

  @override
  Widget build(BuildContext context) {
    final user = Provider
        .of<UserViewModel>(context)
        .user;
    final apVM =
    Provider.of<BranceAppointmentViewModel>(context, listen: false);
    // final myDocVM = Provider.of<MyDoctorViewModel>(context,listen: false);
    final anatomy = Provider.of<AnatomyModelView>(context);

    return Consumer<BranceAppointmentViewModel>(
        builder: (context, appointmentViewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.page_background_color,
            appBar: AppBar(
              backgroundColor: AppColors.primary_color,
              title: Text(
                "Book Appointment ",
                style: Style.alltext_appbar,
              ),
              centerTitle: true,
              leadingWidth: leadingWidth,
              leading: const CustomBackButton(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BottomAppBar(
                elevation: 5,
                height: 50,
                color: AppColors.primary_color,
                child: MaterialButton(
                  onPressed: () async {
                    List<SymptomsAnatomy> diseaseList =
                    anatomy.getSelectedSymptomsList();
                    print(appointmentViewModel.selectedDatee.toString());
                    if (appointmentViewModel.selectedDatee == null) {
                      Messages.snackBar(context, "Please Select Date!");
                    } else
                    if (appointmentViewModel.isChamber.toString() == "") {
                      Messages.snackBar(
                          context, "Please Select Appointment Type!");
                    } else if (appointmentViewModel.morningeveingButton
                        .toString() ==
                        "") {
                      Messages.snackBar(context, "Please Select Shift Type!");
                    } else if (anatomy.favourite.isEmpty) {
                      Messages.snackBar(context, "Please Select Symptoms!");
                    } else {
                      List items = [];


                        for (var i in anatomy.favourite) {
                          items.add(i.symptomName);
                        }
                        print(
                            "dfffffddddddddddddddddddddddddddddddfffff${items}");


                      // print(
                      //   "${DateFormat("dd-MM-yyyy H:m").format(DateTime.parse("${appointmentViewModel.selectedDatee.toString()}"))}",
                      // );
                      print(appointmentViewModel.selectedDatee.toString());

                      // DateTime dateTime = DateFormat('yyyy-MM-dd').parseStrict( widget.appointmentDate);
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      String? patientId = prefs.getString(UserP.hnnumber);
                      if (appointmentViewModel.isChamber == "Chamber") {
                        Map body = {
                          "doctor_id": widget.doctors.id.toString(),
                          // "patient_id": "2",
                          "patient_hn_number": patientId.toString(),
                          "date": "${appointmentViewModel.selectedDatee!}",
                          "appointment_type":
                          appointmentViewModel.isChamber == "Chamber"
                              ? "Chamber"
                              : "Telehealth",
                          "disease": jsonEncode(items),
                          "payment_type": "Chamber Payment",
                          // getPaymentMethod(),
                          "amount": widget.amount,
                          "saas_branch_id": widget.doctors.saasBranchId
                              .toString(),
                          "transaction_no": "",
                          "referred_name": "",
                          "transaction_phone_number": "",
                          "calling_type": "clinic",
                          "shift":
                          appointmentViewModel.morningeveingButton == "morning"
                              ? "Morning"
                              : "Evening",
                          "registration_phone_no":
                          user!.patientMobilePhone.toString(),
                        };
                        print(body);

                        await apVM.bookAppointmentbrance(context,
                            body: body,
                            doctor: widget.doctors,
                            DbName: widget.DbName);
                      } else {
                        final String ipnUrl = "https://www.ipnurl.com";
                        // final String storeId = "digit6422946de99d0";
                        // final String storePassword = "digit6422946de99d0@ssl";// digital

                        // final String storeId = "cattl6519ad5ac55ab";
                        // final String storePassword = "cattl6519ad5ac55ab@ssl";
                        //

                        final String storeId = "macrohealthplussoftwareptyltd0live";
                        final String storePassword = "64B3B72032AB585960";
                        final String transactionId =
                            'tran_${DateTime
                            .now()
                            .millisecondsSinceEpoch}';

                        // Logging the initialization values
                        debugPrint('Store ID: $storeId');
                        debugPrint('Store Password: $storePassword');
                        debugPrint('Transaction ID: $transactionId');

                        Sslcommerz sslcommerz = Sslcommerz(
                          initializer: SSLCommerzInitialization(
                            // ipn_url: ipnUrl, // Ensure this is valid if uncommented
                            multi_card_name: "visa,master,bkash",
                            currency: SSLCurrencyType.BDT,
                            product_category: "doctor",
                            sdkType: SSLCSdkType.LIVE,
                            // Use LIVE for production
                            store_id: storeId,
                            store_passwd: storePassword,
                            total_amount: double.parse(
                                widget.amount.toString()),
                            tran_id: transactionId, // Unique transaction ID
                          ),
                        );

                        sslcommerz.addAdditionalInitializer(
                          sslcAdditionalInitializer: SSLCAdditionalInitializer(
                            user_refer: patientId.toString(),
                          ),
                        );

                        try {
                          debugPrint('Calling payNow method...');
                          SSLCTransactionInfoModel result = await sslcommerz
                              .payNow();
                          debugPrint('Transaction result: ${result.toJson()}');

                          if (result.status != null) {
                            switch (result.status!.toLowerCase()) {
                              case "failed":
                                debugPrint('Transaction Failed');
                                break;
                              case "closed":
                                debugPrint('SDK Closed by User');
                                break;
                              default:
                                debugPrint('Transaction successful: ID=${result
                                    .tranId}, Amount=${result.amount}');
                                Map body = {
                                  "doctor_id": widget.doctors.id.toString(),
                                  "patient_hn_number": patientId.toString(),
                                  "date": "${appointmentViewModel
                                      .selectedDatee!}",
                                  "appointment_type": appointmentViewModel
                                      .isChamber == "Chamber"
                                      ? "Chamber"
                                      : "Telehealth",
                                  "disease": jsonEncode(items),
                                  "payment_type": "Chamber Payment",
                                  "amount": widget.amount,
                                  "saas_branch_id": widget.doctors.saasBranchId
                                      .toString(),
                                  "transaction_no": "",
                                  "referred_name": "",
                                  "transaction_phone_number": "",
                                  "calling_type": "clinic",
                                  "shift": appointmentViewModel
                                      .morningeveingButton == "morning"
                                      ? "Morning"
                                      : "Evening",
                                  "registration_phone_no": user!
                                      .patientMobilePhone.toString(),
                                };
                                print(body);
                                debugPrint(
                                    'Booking appointment with body: $body');

                                await apVM.bookAppointmentbrance(
                                  context,
                                  body: body,
                                  doctor: widget.doctors,
                                  DbName: widget.DbName,
                                );
                            }
                          } else {
                            debugPrint('Transaction status is null');
                          }
                        } catch (e, stackTrace) {
                          debugPrint('Error: $e');
                          debugPrint('StackTrace: $stackTrace');
                        }
                      }
                    }

                    // await appointmentViewModel.getPatientId().then((value) =>
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => BrancePaymentMethodView(
                    //                 appointmentDate:
                    //                     "${appointmentViewModel.selectedDatee!}",
                    //                 appointmentType:
                    //                     appointmentViewModel.isChamber ==
                    //                             "Chamber"
                    //                         ? "Chamber"
                    //                         : "Telehealth",
                    //                 doctorId: "${widget.doctors.id}",
                    //                 patientId: "$value",
                    //                 amount: widget.amount,
                    //                 doctor: widget.doctors!,
                    //                 diseaseList: anatomy.favourite,
                    //                 shiftType: appointmentViewModel
                    //                             .morningeveingButton ==
                    //                         "morning"
                    //                     ? "Morning"
                    //                     : "Evening", branch: widget.branch, DbName: widget.DbName, saas_branch_id: widget.branch!.id.toString(),))));

                    // setState(() {
                    //   // appointmentViewModel.selectedDatee = null;
                    //   // appointmentViewModel.isChamber = "";
                    //   // appointmentViewModel.morningeveingButton = "";
                    //   //
                    //   // appointmentViewModel.date = DateTime.now();
                    //   // anatomy.favourite.clear();
                    //   //
                    //   // anatomy.symptomsList.clear();
                    //   //
                    //   // anatomy.getSymptomsList.clear();
                    // });
                  },
                  child: Text(
                    "Confirm Appointment",
                    style: Style.alltext_appbar,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerFloat,
            body: ListView(
              padding: EdgeInsets.all(10.r),
              children: [
                MaterialButton(
                    height: 50,
                    color: AppColors.primary_color,
                    onPressed: () async {
                      await appointmentViewModel.selectDate(
                          context,
                          widget.doctors.id.toString(),
                          widget.DbName.toString(),
                          widget.branch!.id.toString());
                      // await appointmentViewModel.selectDate();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appointmentViewModel.selectedDatee == null
                            ? Text("")
                            : Text(
                          "${appointmentViewModel.selectedDatee!
                              .day}-${appointmentViewModel.selectedDatee!
                              .month}-${appointmentViewModel.selectedDatee!
                              .year}",
                          style: Style.alltext_appbar,
                        ),
                        Style.widthdistan_size20,
                        Text(
                          "Selected Date",
                          style: Style.alltext_appbar,
                        )
                      ],
                    )),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: appointmentViewModel.isChamber.toString() ==
                            "Telehealth"
                            ? AppColors.primaryColor
                            : Colors.white,
                        child: ListTile(
                          onTap: () {
                            appointmentViewModel.appoinmentchamber(
                                "Telehealth");
                          },
                          leading: Image.asset(Assets.imagesMobile,
                              height: 20.h,
                              width: 10.w,
                              fit: BoxFit.fill,
                              color: AppColors.primaryColor),
                          title: Text(
                            "Online".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: appointmentViewModel.isChamber
                                    .toString() ==
                                    "Telehealth"
                                    ? AppColors.whiteColor
                                    : AppColors.primary_color),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color:
                        appointmentViewModel.isChamber.toString() == "Chamber"
                            ? AppColors.primaryColor
                            : Colors.white,
                        child: ListTile(
                          onTap: () {
                            appointmentViewModel.appoinmentchamber("Chamber");
                          },
                          leading: Image.asset(
                            Assets.imagesChamber,
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            "Chamber".toUpperCase(),
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: appointmentViewModel.isChamber
                                    .toString() ==
                                    "Chamber"
                                    ? Colors.white
                                    : AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: appointmentViewModel.morningeveingButton ==
                            "morning"
                            ? AppColors.primaryColor
                            : Colors.white,
                        child: ListTile(
                          onTap: () {
                            morning = "morning";
                            evenimg = "";
                            print(morning);
                            print(evenimg);

                            setState(() {});
                            appointmentViewModel.appoinmentmorningeveing(
                                "morning");
                          },
                          leading: Image.asset(
                            appointmentViewModel.morningeveingButton ==
                                "morning"
                                ? Assets.imagesDayInActive
                                : Assets.imagesDayActive,
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            "MORNING",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: appointmentViewModel
                                    .morningeveingButton ==
                                    "morning"
                                    ? Colors.white
                                    : AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        color: appointmentViewModel.morningeveingButton ==
                            "evening"
                            ? AppColors.primaryColor
                            : Colors.white,
                        child: ListTile(
                          onTap: () {
                            // evenimg = "evening";
                            // morning = "";
                            // print(morning);
                            // print(evenimg);
                            setState(() {});
                            appointmentViewModel.appoinmentmorningeveing(
                                "evening");
                          },
                          leading: Image.asset(
                            appointmentViewModel.morningeveingButton ==
                                "evening"
                                ? Assets.imagesNightActive
                                : Assets.imagesNightInActive,
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.fill,
                            color: AppColors.primaryColor,
                          ),
                          title: Text(
                            "EVENING",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: appointmentViewModel
                                    .morningeveingButton ==
                                    "evening"
                                    ? AppColors.whiteColor
                                    : AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                appointmentViewModel.doctorTimeSlotList.isEmpty
                    ? SizedBox()
                    : SizedBox(
                    height: 150.h,
                    child: Consumer<BranceAppointmentViewModel>(
                        builder: (context, data, child) {
                          if (data.doctorTimeSlotList.isEmpty) {
                            return data.isDocChamberTimeLoading == true
                                ? ListView.builder(
                              itemCount: 6,
                              // scrollDirection: Axis.vertical,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: bannerShimmereffect(
                                      90.toDouble(), 385.toDouble()),
                                );
                              },
                            )
                                : noDataFounForList(
                                "Currently you have no records");
                          } else {
                            return Column(
                              children: [
                                SizedBox(
                                    height: appointmentViewModel
                                        .morningeveingButton
                                        .toString() !=
                                        "" ||
                                        appointmentViewModel.isChamber
                                            .toString() !=
                                            ""
                                        ? 130.h
                                        : 0.h,
                                    child: ListView.builder(
                                      itemCount: data.doctorTimeSlotList.length,
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        var docTime =
                                        data.doctorTimeSlotList[index];

                                        if ((docTime.type ==
                                            appointmentViewModel
                                                .morningeveingButton
                                                .toString()) &&
                                            (docTime.appointmentType ==
                                                appointmentViewModel.isChamber
                                                    .toString())) {
                                          return Center(
                                            child: Card(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(
                                                      "${docTime.day}",
                                                      style: Style
                                                          .alltext_default_balck,
                                                    ),
                                                    Text(
                                                      "${formatSpecificTime(
                                                          docTime.slotFrom
                                                              .toString())} To ${formatSpecificTime(
                                                          docTime.slotTo
                                                              .toString())}",
                                                      style: Style
                                                          .alltext_default_balck,
                                                    ),
                                                    Text(
                                                      docTime.status
                                                          .toString() ==
                                                          "off_duty"
                                                          ? "Off Day"
                                                          : "",
                                                      style: Style
                                                          .alltext_default_balck,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          // Return an empty container for items that don't match the filter criteria
                                          return Container();
                                        }
                                      },
                                    )),
                                appointmentViewModel.morningeveingButton
                                    .toString() !=
                                    "" ||
                                    appointmentViewModel.isChamber.toString() !=
                                        ""
                                    ? Container()
                                    : Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Style.distan_size20,
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.green,
                                      size: 50,
                                    ),
                                    Style.distan_size20,
                                    Text(
                                      "Please Choose your prefer date for an appointment",
                                      style: Style.alltext_default_balck_blod,
                                    ),
                                  ],
                                )
                              ],
                            );
                          }
                        })),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadReportView()));
                          anatomy.favourite.clear();
                        },
                        child: Card(
                          color: Colors.green.shade500,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, vertical: 10.h),
                            child: Text(
                              "Upload Report",
                              textAlign: TextAlign.center,
                              style: Style.alltext_appbar,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UploadMyReport()));
                          anatomy.favourite.clear();
                        },
                        child: Card(
                          color: Colors.green.shade400,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.w, vertical: 10.h),
                            child: Text(
                              "View Report",
                              textAlign: TextAlign.center,
                              style: Style.alltext_appbar,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Consumer<AnatomyModelView>(builder: (context, anatomy, child) {
                  return Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnatomyView()));
                            anatomy.favourite.clear();
                            // setState(() {
                            //   anatomy.selecteddata.clear();
                            //   print( anatomy.selecteddata);
                            // });
                            // context.router.push(const AnatomyRoute());
                          },
                          child: Card(
                            color: AppColors.primaryColor,
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0.w, vertical: 10.h),
                              child: Text(
                                "Select Symptoms",
                                textAlign: TextAlign.center,
                                style: Style.alltext_appbar,
                              ),
                            ),
                          ),
                        ),
                        // Visibility(
                        //   visible: anatomy.getSelectedSymptomsList().isNotEmpty,
                        //   child: Text(
                        //     "Selected Symptoms",
                        //     style: TextStyle(
                        //         fontSize: 12.sp,
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        SizedBox(
                          height: anatomy.favourite.isEmpty ? 0 : 100.h,
                          child: ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                            //  anatomy.selecteddata.length,
                            anatomy.favourite.length,
                            itemBuilder: (context, index) {
                              var at = anatomy.favourite[index];
                              //   etSelectedSymptomsList()[index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    "${at.symptomName}",
                                    style: Style.alltext_default_balck,
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: AppColors.primary_color,
                                    ),
                                    onPressed: () {
                                      anatomy.favourite.removeAt(index);
                                      setState(() {});
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                SizedBox(
                  height: 5.h,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          // width: 250.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${widget.doctors!.title == null ? '' : widget
                                      .doctors!.title!.titleName} ${widget
                                      .doctors!.fullName.toString()}"),
                              Style.distan_size2,
                              widget.doctors!.usualProvider != null
                                  ? Text(
                                  "${widget.doctors!.usualProvider!
                                      .usualProviderName.toString()}")
                                  : Container(),
                              Style.distan_size2,
                              appointmentViewModel.isChamber.toString() == ""
                                  ? Container()
                                  : Row(
                                children: [
                                  Text("Appointment Type "),
                                  Text(": "),
                                  Text(appointmentViewModel.isChamber
                                      .toString() ==
                                      "Chamber"
                                      ? "Chamber"
                                      : "Online"),
                                ],
                              ),
                              Style.distan_size2,
                              appointmentViewModel.morningeveingButton
                                  .toString() ==
                                  ""
                                  ? Container()
                                  : Row(
                                children: [
                                  Text("Appointment Time "),
                                  Text(": "),
                                  Text(appointmentViewModel
                                      .morningeveingButton
                                      .toString() ==
                                      "morning"
                                      ? "Morning"
                                      : "Evening"),
                                ],
                              ),
                              Style.distan_size2,
                              Row(
                                children: [
                                  Text("Appointment Fees "),
                                  Text(": "),
                                  Text(
                                    //
                                    // appointmentViewModel.isChamber
                                    // ?
                                      widget.amount
                                    // : appointmentViewModel.online_amount
                                    //     .toString()
                                  ),
                                ],
                              ),
                              Style.distan_size2,
                              appointmentViewModel.selectedDatee != null
                                  ? Row(
                                children: [
                                  Text("Appointment Date"),
                                  Text(": "),
                                  Text(
                                      "${appointmentViewModel.selectedDatee!
                                          .day}-${appointmentViewModel
                                          .selectedDatee!
                                          .month}-${appointmentViewModel
                                          .selectedDatee!.year}"
                                    // DateFormat("dd-MM-yyyy").format(DateTime.parse(
                                    //     appointmentViewModel.date.toString())),
                                  ),
                                ],
                              )
                                  : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                appointmentViewModel.doctorTimeSlotList.isEmpty
                    ? Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 8, right: 6),
                  child: SizedBox(
                    child: Image.asset(Assets.noappoinment),
                  ),
                )
                    : SizedBox(),
              ],
            ),
          );
        });
  }

  Future<void> sslCommerzCustomCall(BuildContext contex, patientMobilePhone,
      patient_hn_number, ChamberType, shift, selectedDatee) async {}

  String formatSpecificTime(String inputTime) {
    // Assuming the inputTime is in the "HH:mm" format
    DateTime dateTime = DateFormat('HH:mm').parse(inputTime);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }
}
