import 'dart:async';

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
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
        title: Text('My Page'),
      ),
      body: Column(
        children: [
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
    );
  }
}