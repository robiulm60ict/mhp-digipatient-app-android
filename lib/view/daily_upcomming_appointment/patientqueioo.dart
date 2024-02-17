import 'dart:async';

import 'package:flutter/material.dart';

import '../../resources/colors.dart';
import '../../resources/styles.dart';

class PatientQueioPage extends StatefulWidget {
  @override
  _PatientQueioPageState createState() => _PatientQueioPageState();
}

class _PatientQueioPageState extends State<PatientQueioPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      // if (!_pageClosed) {
        callAPI();
      // }
    });
  }

  Future<void> callAPI() async {
    try {
     // final response = await http.get(Uri.parse('https://example.com/api'));
      // Process the API response as needed
      print('API called');
    } catch (e) {
      print('API call error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary_color,

        centerTitle: true,
        title: Text(
          "Connecting with doctor",
          style: Style.alltext_appbar,
        ),
      ),
      body:  SizedBox(
        width: double.infinity,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Style.distan_size20,
            Text("Please wait your next Queue \n\n 12:00 am",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),

            Text("2",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),

            Style.distan_size20,
            Text("Please apps don't stop",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
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
    );
  }
}