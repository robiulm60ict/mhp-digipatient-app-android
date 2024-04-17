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
    getCurrentTime();
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
            "${AppUrls.baseUrlPatient}/patient-appointment-queue-number/$docId/$appoitmentId"),
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

  String currentTime = '';

  void getCurrentTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(now);
    setState(() {
      currentTime = formattedTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    // Define the target time (5:00 PM)
    // String formattedTime = widget.todaysPatientAppointment.startTime != null
    //     ? DateFormat('hh:mm a')
    //         .format(widget.todaysPatientAppointment.startTime!)
    //     : 'N/A';
    String message = '';
    DateTime? targetTime;
    // DateTime? nullableDateTime =
    //     DateTime(2024, 2, 18, 17, 30, 0); // nullable DateTime

    String formattedTime = widget.todaysPatientAppointment.startTime != null
        ? DateFormat(' hh:mm a')
            .format(widget.todaysPatientAppointment.startTime!)
        : 'N/A';

    if (formattedTime != 'N/A') {
      // Append the current year to the formatted time string
      String formattedDateTimeString =
          '${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')} ${widget.todaysPatientAppointment.startTime!.hour}:${widget.todaysPatientAppointment.startTime!.minute}';
      print("Formatted DateTime String: $formattedDateTimeString");

// Parse the formatted date-time string into a DateTime object
      targetTime =
          DateFormat('yyyy-MM-dd HH:mm').parse(formattedDateTimeString);
      print("Parsed DateTime: $targetTime");
    }
    if (targetTime != null) {
      // Check if the current time is before or after the target time
      // bool isBeforeTargetTime = now.isBefore(nullableDateTime);
      bool isBeforeTargetTime = now.isBefore(targetTime);

      // Define messages based on the condition
      message = isBeforeTargetTime
          ? "You are in next Queue"
          : "Doctor will call you in next 10 minutes.";
      print("isBeforeTargetTime$isBeforeTargetTime");
      print("message$message");
    } else {
      // Handle the case where targetTime is null
      // This can happen if startTime is null or if parsing fails
      // Define the message accordingly
    }

    print("widget${widget.todaysPatientAppointment.startTime}");
    print("now$now");
    print("targetTime$targetTime");
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Define the target time (2:30 PM)

                    // Compare the current time with the target time

                    // Text(
                    //   'Current Time: $message',
                    //   style: TextStyle(fontSize: 20),
                    // ),

                    Style.distan_size2,
                    Style.distan_size2,
                    Column(
                      children: [
                        Text(
                          "Please wait , ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Style.distan_size20,
                        Text(
                          "${DateFormat("hh:mm a").format(DateTime.parse(widget.todaysPatientAppointment.startTime.toString()))}",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Style.distan_size20,
                        dataList.toString() != "0"
                            ? Text(
                                "You are in next Queue",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    dataList.toString() == "0"
                        ? Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : Text(
                            dataList.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                    const Text(
                      "Please  do not close the app ",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Style.distan_size20,
                  ],
                );
              }
            },
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
