import 'dart:async';
import 'dart:convert';

import 'package:digi_patient/resources/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/appointment_model/todays_appointment_model.dart';
import '../../resources/colors.dart';
import '../../resources/styles.dart';
import '../../utils/user.dart';

class PatientQurio extends StatefulWidget {
  PatientQurio({super.key, required this.todaysPatientAppointment});

  TodaysPatientAppointment todaysPatientAppointment;

  @override
  State<PatientQurio> createState() => _PatientQurioState();
}

class _PatientQurioState extends State<PatientQurio> {
  late StreamController<String> _streamController;
  String data = ''; // Initial data
  @override
  void initState() {
    super.initState();
    _streamController = StreamController<String>();
    fetchData(widget.todaysPatientAppointment.doctorsId,
        widget.todaysPatientAppointment.id); //

    startTimer(); // Fetch initial data
  }

  @override
  void dispose() {
    _streamController.close();
    _timer?.cancel();
    super.dispose();
  }

  Future<void> fetchData(docId, appoitmentId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(UserP.fcmToken) ?? "";
    try {
      final response = await http.get(
        Uri.parse(
            "https://gdbackend.macrohealthplus.org/api/v1/patient-appointment-queue-number/$docId/$appoitmentId"),
        headers: {
          'token': "$token",
          'databaseName': '${AppUrls.databasename}',
          'Accept': 'application/json',
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final newData =
            responseData['data'].toString(); // Convert integer data to string
        print(responseData['data']);

        setState(() {
          data = newData; // Update the data variable with string type
          print("newData$newData");
          print("rr$data");
        });
        _streamController.add(data);
      } else {
        throw Exception(
            'Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to fetch data: $e');
    }
  }

  Timer? _timer;

  @override
  void didUpdateWidget(covariant PatientQurio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print(oldWidget);
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (_) {
      // if (!_pageClosed) {
      fetchData(widget.todaysPatientAppointment.doctorsId,
          widget.todaysPatientAppointment.id); //
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary_color,
          centerTitle: true,
          title: Text(
            "Connecting with doctor",
            style: Style.alltext_appbar,
          ),
          actions: [
            TextButton.icon(
                onPressed: () {
                  fetchData(widget.todaysPatientAppointment.doctorsId,
                      widget.todaysPatientAppointment.id); //
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: Text(
                  "Refresh",
                  style: Style.drawer_button_style,
                ))
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Style.distan_size20,
              Column(
                children: [
                  Text(
                    "Please wait , ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Style.distan_size20,
                  Text(
                    "You are in next Queue \n\n ${DateFormat("hh:mm a").format(DateTime.parse(widget.todaysPatientAppointment.startTime.toString()))}",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              SizedBox(
                height: 100,
                child: StreamBuilder<String>(
                  stream: _streamController.stream,
                  builder: (context, snapshot) {
                    print(snapshot.connectionState);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child:
                              CircularProgressIndicator()); // Display a loading indicator while waiting for data
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Display an error message if fetching data fails
                    } else {
                      final String dataList = snapshot.data ?? "";
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          dataList.toString() == "0"
                              ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                      "Please wait doctor will call you in next 10 miniets",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,
                                    ),
                                ),
                              )
                              : Text(dataList.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)
                        ],
                      );
                    }
                  },
                ),
              ),

              const Text(
                "Please  do not close the app ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Style.distan_size20,
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         _pageClosed = true;
              //       });
              //       Navigator.pop(context);
              //     },
              //     child: Text('Close Page'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// class PatientQueioPage extends StatefulWidget {
//   @override
//   _PatientQueioPageState createState() => _PatientQueioPageState();
// }
//
// class _PatientQueioPageState extends State<PatientQueioPage> {
//   Timer? _timer;
//
//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
//
//   void startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 2), (_) {
//       // if (!_pageClosed) {
//         callAPI();
//       // }
//     });
//   }
//
//   Future<void> callAPI() async {
//     try {
//      // final response = await http.get(Uri.parse('https://example.com/api'));
//       // Process the API response as needed
//       print('API called');
//     } catch (e) {
//       print('API call error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primary_color,
//
//         centerTitle: true,
//         title: Text(
//           "Connecting with doctor",
//           style: Style.alltext_appbar,
//         ),
//       ),
//       body:  SizedBox(
//         width: double.infinity,
//         child: const Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             Style.distan_size20,
//             Text("Please wait your next Queue \n\n 12:00 am",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
//
//             Text("2",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
//
//             Style.distan_size20,
//             Text("Please apps don't stop",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
//             // Center(
//             //   child: ElevatedButton(
//             //     onPressed: () {
//             //       setState(() {
//             //         _pageClosed = true;
//             //       });
//             //       Navigator.pop(context);
//             //     },
//             //     child: Text('Close Page'),
//             //   ),
//             // ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
