import 'dart:async';

import 'package:digi_patient/resources/styles.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:digi_patient/model/my_record_model/diagnosis_procedure_model.dart';

import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';

import '../../../../model/testmodel/testmodellist.dart';
import '../../../../resources/colors.dart';
import '../../payment_clinic/checkout.dart';

class PathologyAddTest extends StatefulWidget {
  const PathologyAddTest({super.key});

  @override
  State<PathologyAddTest> createState() => _PathologyAddTestState();
}

class _PathologyAddTestState extends State<PathologyAddTest> {
  List testlist = [];
  int? groupValue;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context, listen: false);
    TestName? selectedCondition;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        height: 60.h,
        child: ListTile(
          title: Text("Total Bill"),
          subtitle: Text("100 BDT"),
          trailing: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckoutPayment()));
            },
            child: Text("Proceed to Payment"),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Diagnostic Tests",
          style: Style.alltext_default_balck_blod,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Style.distan_size20,
              Text(
                "Diagnostic Tests from Home",
                style: Style.alltext_Large_black,
              ),
              Style.distan_size5,
              Text(
                "A certified professional will collect you sample from your location",
                style: Style.alltext_default_balck_blod,
              ),
              Style.distan_size20,
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    side: BorderSide(color: AppColors.primaryColor)),
                child: ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.search_rounded,
                    color: AppColors.primaryColor,
                    size: 25.h,
                  ),
                  title: Text(
                    "Search Clinic",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ),
              ),
              Style.distan_size20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Test List",
                    style: Style.alltext_Large_black,
                  ),
                  FloatingActionButton(
                    mini: true,
                    elevation: 0,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Select Test"),
                            content: DropdownSearch<TestName>(
                              asyncItems: (String filter) =>
                                  myRecord.getalltest(context),
                              itemAsString: (TestName u) =>
                                  u.testName ?? "",
                              onChanged: (TestName? data) {
                                testlist.add(data!.testName);
                                print(testlist);
                                setState(() {});
                                Navigator.pop(context);
                                // Handle onChanged event if needed
                              },
                              popupProps: PopupPropsMultiSelection.dialog(
                                showSearchBox: true,
                                itemBuilder: (context, item, isSelected) =>
                                    Card(
                                  margin: EdgeInsets.all(5),
                                  child: ListTile(
                                    title: Text(
                                      "${item.testName}",
                                      style: Style.alltext_default_balck,
                                    ),
                                    subtitle: Text(
                                      "${item.fee}",
                                      style: Style.alltext_default_balck,
                                    ),
                                  ),
                                ),
                              ),
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  hintText: "Search your desire tests",
                                  // helperText: "Search",
                                  // labelText: "Condition",
                                  labelStyle:
                                      TextStyle(color: AppColors.primaryColor),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                              dropdownButtonProps:
                                  DropdownButtonProps(icon: Icon(Icons.add)),
                              selectedItem: selectedCondition,
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.add,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: testlist.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(
                          Icons.cloud_done_rounded,
                          color: AppColors.primary_color,
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            testlist.removeAt(index);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                        title: Text(
                          testlist[index].toString(),
                        ),
                      );
                    }),
              ),
              Style.distan_size20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Locate Me",
                    style: Style.alltext_block_text_style,
                  ),
                  IconButton(
                      onPressed: _goToTheLake,
                      icon: Icon(
                        Icons.location_disabled,
                        size: 25,
                        color: AppColors.primary_color,
                      ))
                ],
              ),
              Style.distan_size5,
              Card(
                elevation: 0,
                child: SizedBox(
                  height: 130,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    RadioListTile<int>(
                      value: 20,
                      // The value associated with this radio button
                      groupValue: groupValue,
                      // The currently selected value in the group
                      onChanged: (int? newValue) {
                        // Update the state to reflect the new value when the radio button is selected
                        setState(() {
                          groupValue = newValue;
                        });
                      },
                      title: Text(
                          'Booking request at Clinic'), // The title displayed next to the radio button
                    ),
                    RadioListTile<int>(
                      value: 10,
                      // The value associated with this radio button
                      groupValue: groupValue,
                      // The currently selected value in the group
                      onChanged: (int? newValue) {
                        // Update the state to reflect the new value when the radio button is selected
                        setState(() {
                          groupValue = newValue;
                        });
                      },
                      title: Text(
                          'Sample Collection Request'), // The title displayed next to the radio button
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}