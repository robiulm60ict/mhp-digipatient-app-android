import 'dart:convert';

import 'package:digi_patient/resources/app_url.dart';
import 'package:digi_patient/utils/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/invoice_model/invoice_show_model.dart';
import '../../resources/colors.dart';
import '../../utils/utils.dart';
import '../../view_model/appointment_view_model/appointment_view_model.dart';
import '../../widgets/back_button.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  List<InvoiceShowModel> invoiceList = [];

  Future<int?> getPatientId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? patientId = prefs.getInt(UserP.id);
    return patientId;

  }

  Future<List<InvoiceShowModel>> getInvoiceList()async{
int? id = await getPatientId();
invoiceList.clear();
    final response = await http.get(Uri.parse("${AppUrls.invoiceView}$id"));
    final json = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(var i in json){
        invoiceList.add(InvoiceShowModel.fromJson(i));
      }
      return invoiceList;
    }else{
      return invoiceList;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){

       context.read<AppointmentViewModel>().getInvoiceList(context);

    });
  }
  String getDate(String? date) {
    DateTime? dateObject = DateTime.tryParse(date ?? "");
    if (dateObject != null) {
      return "${dateObject.day}-${dateObject.month}-${dateObject.year}";
    } else {
      return "null";
    }
  }
  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<AppointmentViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: leadingWidth,
        centerTitle: true,
        title: Text("Invoice and Payments", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
      ),
      // body: invoice.isInvoiceLoading ? const Center(child: CircularProgressIndicator(),) : ListView.builder(
      //     padding: EdgeInsets.all(20.r),
      //     itemCount: invoice.invoiceList.length,
      //     itemBuilder: (context, index) {
      //       final iv = invoice.invoiceList[index];
      //       return Card(
      //         child: ListTile(
      //           title: Text("${iv.amount}",),
      //           subtitle: Text(getDate(iv.date)),
      //           trailing: Text("${iv.paymentType}"),
      //         ),
      //       );
      //     },),
      body: FutureBuilder(
        future: getInvoiceList(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                    padding: EdgeInsets.all(20.r),
                    itemCount: invoiceList.length,
                    itemBuilder: (context, index) {
                      final iv = invoiceList[index];
                      return Card(
                        child: ListTile(
                          title: Text("${iv.amount}",),
                          subtitle: Text(getDate(iv.date.toString())),
                          trailing: Text("${iv.paymentType}"),
                        ),
                      );
                    },);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
