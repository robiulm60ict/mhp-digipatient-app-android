import 'dart:async';

import 'package:digi_patient/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:digi_patient/view_model/my_record_view_model/my_record_view_model.dart';
import '../../../../model/testmodel/testmodellist.dart';
import '../../../../resources/colors.dart';
import '../../../../utils/utils.dart';
import '../../../../view_model/clinic/my_clinic_view_model/my_clinic_lav_view_model.dart';
import '../../../../widgets/back_button.dart';
import '../../payment_clinic/checkout.dart';

class PathologyAddTest extends StatefulWidget {
  PathologyAddTest({super.key, required this.branceid, required this.DbName});

  String branceid;
  String DbName;

  @override
  State<PathologyAddTest> createState() => _PathologyAddTestState();
}

class _PathologyAddTestState extends State<PathologyAddTest> {
  String? groupValue = "Clinic";
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
  LatLng target = _kLake.target;

  @override
  void initState() {
    context.read<MyRecordViewModel>().getalldatapathology(context);
    // TODO: implement initState
    super.initState();
  }

  bool isLocating = false;

  @override
  Widget build(BuildContext context) {
    final myRecord = Provider.of<MyRecordViewModel>(context);
    final myLab = Provider.of<MyClinicLabViewModel>(context);
    TestName? selectedCondition;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        height: 55.h,
        child: ListTile(
          title: Text(
            "Total Bill",
            style: Style.alltext_Large_black,
          ),
          subtitle: Text(
            "${calculateTotal(myRecord.testlistfavert)}BDT",
            style: Style.alltext_default_balck_blod,
          ),
          trailing: ElevatedButton(
            onPressed: () {
              print(target.latitude);
              List<Map<String, dynamic>> dataList = [];
              print(myRecord.testlistfavert);
              for (var i in myRecord.testlistfavert) {
                // Using null-aware operator to handle nullable strings
                if (i.testName != null && i.fee != null) {
                  // Adding each testName and fee as separate entries in the list of maps
                  dataList.add({
                    'id': i.id!,
                    'testName': i.testName!,
                    'fee': i.fee!,
                  });
                }
              }
              print(dataList);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutPayment(
                            branch_id: widget.branceid.toString(),
                            amount:
                                "${calculateTotal(myRecord.testlistfavert)}",
                            lat: target.latitude.toString(),
                            long: target.longitude.toString(),
                            sample_collection: groupValue.toString(),
                            test_name: dataList.toString(),
                            test_type: "pathology",DbName: widget.DbName.toString(),
                          )));
            },
            child: Text(
              "Proceed to Payment",
              style: Style.drawer_button_style,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        leadingWidth: leadingWidth,
        leading: const CustomBackButton(),
        backgroundColor: AppColors.linearGradient2,
        title: Text(
          "Diagnostic Tests",
          style: Style.alltext_appbar,
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
                        return Row(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        myRecord.testlistfavert[index].testName
                                            .toString(),
                                        style: Style.alltext_default_balck,
                                      ),
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
                                myRecord.removeTest(index);
                              },
                              icon: Icon(
                                Icons.remove_circle,
                                color: Colors.red,
                              ),
                            ),
                          ],
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
                      onPressed: () {
                        // Toggle the button state when clicked
                        setState(() {
                          isLocating = !isLocating;
                        });
                        // Call the _goToTheLake function
                        _goToTheLake();
                      },
                      // Set the icon based on the button state
                      icon: Icon(
                        isLocating
                            ? Icons.location_on
                            : Icons.location_disabled,
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
                            child: Radio<String>(
                              value: "Clinic",
                              groupValue: groupValue,
                              onChanged: (String? newValue) {
                                // Update the state to reflect the new value when the radio button is selected
                                setState(() {
                                  groupValue = newValue;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Clinic',
                            style: Style.alltext_default_balck,
                          ),
                          SizedBox(
                            child: Radio<String>(
                              value: "Home",
                              // Adjust value for Home if needed
                              groupValue: groupValue,
                              onChanged: (String? newValue) {
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
      ),
    ));
  }

  static double calculateTotal(List<TestName> paymentHistoryList) {
    double total = 0;
    for (var history in paymentHistoryList) {
      total += double.parse(history.fee
          .toString()); // Assuming amount is a property of PaymentHistory
    }
    return total;
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    print(
        'Target latitude: ${target.latitude}, Target longitude: ${target.longitude}');
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
