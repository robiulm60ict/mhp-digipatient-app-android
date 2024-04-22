import 'dart:async';

import 'package:digi_patient/resources/styles.dart';
import 'package:digi_patient/view/myClinic/myclinic_our_servic/pathology/pathology_view_add_test.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'package:digi_patient/model/my_record_model/diagnosis_procedure_model.dart';

import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';

import '../../../../model/testmodel/testmodellist.dart';
import '../../../../resources/colors.dart';
import '../../../../view_model/clinic_service_view_model/clinic_service_view_model.dart';
import '../../../../widgets/shimmer.dart';
import '../../payment_clinic/checkout.dart';
import 'pathology_view_add_test.dart';

class PathologyAddTest extends StatefulWidget {
  const PathologyAddTest({super.key});

  @override
  State<PathologyAddTest> createState() => _PathologyAddTestState();
}

class _PathologyAddTestState extends State<PathologyAddTest> {
  int? groupValue;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    context.read<MyRecordViewModel>().getalldata(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context);
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
              Style.distan_size10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Test List",
                    style: Style.alltext_Large_black,
                  ),
                  // FloatingActionButton(
                  //   mini: true,
                  //   elevation: 0,
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           title: Text("Select Test"),
                  //           content: DropdownSearch<TestName>(
                  //             asyncItems: (String filter) =>
                  //                 myRecord.getalltest(context),
                  //             itemAsString: (TestName u) => u.testName ?? "",
                  //             onChanged: (TestName? data) {
                  //               // TestItemsModel newItem = TestItemsModel(
                  //               //     title: data!.testName.toString(),
                  //               //     price: data!.fee.toString());
                  //               // myRecord.  testlist.add(newItem);
                  //               // for (var item in  myRecord.testlist) {
                  //               //   print(
                  //               //       "Title: ${item.title}, Price: ${item.price}");
                  //               // }
                  //               setState(() {});
                  //               Navigator.pop(context);
                  //               // Handle onChanged event if needed
                  //             },
                  //             popupProps: PopupPropsMultiSelection.dialog(
                  //               showSearchBox: true,
                  //               itemBuilder: (context, item, isSelected) =>
                  //                   Card(
                  //                 margin: EdgeInsets.all(5),
                  //                 child: ListTile(
                  //                   title: Text(
                  //                     "${item.testName}",
                  //                     style: Style.alltext_default_balck,
                  //                   ),
                  //                   subtitle: Text(
                  //                     "${item.fee}",
                  //                     style: Style.alltext_default_balck,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             dropdownDecoratorProps: DropDownDecoratorProps(
                  //               dropdownSearchDecoration: InputDecoration(
                  //                 hintText: "Search your desire tests",
                  //                 // helperText: "Search",
                  //                 // labelText: "Condition",
                  //                 labelStyle:
                  //                     TextStyle(color: AppColors.primaryColor),
                  //                 border: OutlineInputBorder(
                  //                   borderSide: BorderSide(
                  //                       color: AppColors.primaryColor),
                  //                 ),
                  //               ),
                  //             ),
                  //             dropdownButtonProps:
                  //                 DropdownButtonProps(icon: Icon(Icons.add)),
                  //             selectedItem: selectedCondition,
                  //           ),
                  //         );
                  //       },
                  //     );
                  //   },
                  //   child: Icon(
                  //     Icons.add,
                  //     size: 20,
                  //   ),
                  // ),
                  FloatingActionButton(
                    mini: true,
                    elevation: 0,
                    onPressed: () {
                      //  myRecord.getalltest(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SearchListDialog();
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
              Consumer<MyRecordViewModel>(builder: (context, data, child) {
                return SizedBox(
                  // height: 100,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: myRecord.testlistfavert.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.cloud_done_rounded,
                                    color: AppColors.primary_color,
                                  ),
                                  Style.widthdistan_size20,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        child: Text(
                                          myRecord
                                              .testlistfavert[index].testName
                                              .toString(),
                                          style: Style.alltext_default_balck,
                                        ),
                                        width: 200,
                                      ),
                                      Style.distan_size2,
                                      Text(
                                        "${myRecord.testlistfavert[index].fee.toString()} BDT",
                                        style: Style.alltext_small_black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  myRecord.testlistfavert.removeAt(index);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }),
              Style.distan_size10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Locate Me",
                    style: Style.alltext_Large_black,
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
                  height: 160,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sample Collection",
                        style: Style.alltext_Large_black,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Radio<int>(
                              value: 10,
                              groupValue: groupValue,
                              onChanged: (int? newValue) {
                                // Update the state to reflect the new value when the radio button is selected
                                setState(() {
                                  groupValue = newValue;
                                });
                              },
                            ),
                          ),
                          Text(
                            ' Clinic',
                            style: Style.alltext_default_balck,
                          ),
                          SizedBox(
                            child: Radio<int>(
                              value: 10,
                              groupValue: groupValue,
                              onChanged: (int? newValue) {
                                // Update the state to reflect the new value when the radio button is selected
                                setState(() {
                                  groupValue = newValue;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Home',
                            style: Style.alltext_default_balck,
                          ), // The ti
                        ],
                      ),
                    ],
                  ),
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

class SearchListDialog extends StatefulWidget {
  @override
  _SearchListDialogState createState() => _SearchListDialogState();
}

class _SearchListDialogState extends State<SearchListDialog> {
  TextEditingController _searchController = TextEditingController();
  List<TestName> _filteredData = [];

  @override
  void initState() {
    _filteredData.addAll(context.read<MyRecordViewModel>().testList);
    // Instead of initializing in initState, use a FutureBuilder
    super.initState();
  }

  void filterSearchResults(String query, List<TestName> testList) {
    List<TestName> dummySearchList = [];
    dummySearchList.addAll(testList);
    if (query.isNotEmpty) {
      List<TestName> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.testName!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(dummyListData);
      });
    } else {
      setState(() {
        _filteredData.clear();
        _filteredData.addAll(testList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context);

    return AlertDialog(
      title: Text("Search List"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Ok"),
        )
      ],
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _searchController,
              onChanged: (value) {
                filterSearchResults(value, myRecord.testList);
              },
              decoration: InputDecoration(
                labelText: "Search",
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 380,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredData[index].testName.toString()),
                    onTap: () {
                      print("Selected item: ${_filteredData[index]}");
                      Navigator.pop(context); // Close the dialog
                    },
                    trailing: IconButton(
                      onPressed: () {
                        // Add or remove the item from the list based on its presence

                        setState(() {
                          if (myRecord.testlistfavert
                              .contains(_filteredData[index])) {
                            myRecord.removeTest(index);
                            // myRecord.testlistfavert
                            //     .remove(_filteredData[index]);
                          } else {
                            myRecord.addTest(_filteredData[index]);
                            // myRecord.testlistfavert.add(_filteredData[index]);
                          }
                        });
                        for (var item in myRecord.testlistfavert) {
                          print("Title: ${item.testName}, Price: ${item.fee}");
                        }
                      },
                      icon:
                          myRecord.testlistfavert.contains(_filteredData[index])
                              ? Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.add_circle,
                                  color: Colors.green,
                                ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
