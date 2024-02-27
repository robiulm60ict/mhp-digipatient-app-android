import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/user.dart';
import '../../view/daily_upcomming_appointment/daily_and_upcomming_appointments_view.dart';
import '../../view/my_medicine/uploaded_rx.dart';

Future<void> initializeNotifications() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );
}

class NotificationService {
  String token = "";
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User declined or has not accepted   permission");
    }
  }

  Future<String> getDeviceToken() async {
    // String? token = await messaging.getToken();
    String? token =
        "eUPMI5O5RSmFVTMKpKEIG5:APA91bE8Hm9-ZalZzx4rFr7dZIoauLP7sgYZnPOA3Prl1mPPBYDUI2Y70tXchb4Qdsd01yEOpRhkVindp5QjqMU_50XF-BcjxxF0xnEKLcL9LvTqjkP2V0eUfWxfskHn0obmKUEkVUHX";
    return token!;
  }

  void getToken() async {
    await messaging.getToken().then((tokendata) {
      token = tokendata!;
      print("My Token  $token");
    });
    // saveToken(token);
  }

  void isTokenrefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }

  // void saveToken(String token) async {
  //   await FirebaseFirestore.instance.collection("UserTokens").doc("User1").set({
  //     'token': token,
  //   });
  // }

  initLocalNotification(BuildContext context, RemoteMessage message) async {
    var androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings =
        InitializationSettings(android: androidInitialize);

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
        print("payload $payload");
        handleMessage(context, message);
      },
    );

    // var androidInitialize =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    //
    // var initializationSettings =
    //     InitializationSettings(android: androidInitialize);
    //
    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onDidReceiveNotificationResponse: (payload) async {
    //   print("payloadaaaaaaaaaaaaaaaaaaa$payload");
    //   handleMessage(context, message);
    // });
  }

  firbaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) async {
      print("...................onMessage.......................");
      print("onMessage: ${message.notification ?? 'No title'} }");

      // print(
      //     "onMessage: ${message.notification!.title.toString()} / ${message.notification!.body}  / ${message.notification}");

      // print(message.data["id"]);
      if (Platform.isIOS) {
        forgroundMessage();
      }

      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        showNotification(context, message);
      } else {
        showNotification(context, message);
      }
    });
  }

  Future<void> showNotification(
      BuildContext context, RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      Random.secure().nextInt(1000).toString(),
      "name",
      importance: Importance.max,
      showBadge: true,
    );
    BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(

        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true);

    final notificationData = message.data;
    // final title = notificationData['title'] ?? 'Default Title';
    // final body = notificationData['body'] ?? 'Default Body';
    // final imageUrl = notificationData['image'] ??
    //     "https://proshort.ai/static/img/ps_logo.png";
    // BigPictureStyleInformation bigPictureStyle = BigPictureStyleInformation(
    //   FilePathAndroidBitmap(imageUrl.toString()),
    //   contentTitle: title,
    //   summaryText: body,
    // );
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: "Hiiii",
            importance: Importance.max,
            priority: Priority.high,
            ticker: "ticker",
            styleInformation: bigTextStyleInformation,
            playSound: true);
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails platformChannelSpecifiics = NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () async {
      await flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifiics,
        // payload: message.data['data'],
      );
    });
  }

  void handleMessage(BuildContext context, RemoteMessage message) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt(UserP.id);
    if (message.notification!.title.toString() ==
        'Your Appointment Request Accepted') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DailyAndUpcommingView()));
    } else if (message.notification!.title.toString() ==
        "Your Appointment Completed") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UploadPrescription(

                  )));
    }
  }

  Future<void> setupInteractMessage(BuildContext context) async {
    // when app is terminated
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      handleMessage(context, initialMessage);
    }

    //when app ins background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      handleMessage(context, event);
    });
  }

  Future forgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  Future<void> sendPushNotification(data) async {
    final String serverKey =
        'AAAAUtHfsDo:APA91bFEesZ9FMbqyk2dnmac6oJQ78Npv2whZkEIuZATSpTLytvwpeGxzft9YU5evLB7jUuxrbjOUcMepozU__8zHu6oNuP_Ej-AtEm1rTK4dnuhpz7jUDUaEIob-zVHSGXm909qmCMf';
    final String apiUrl = 'https://fcm.googleapis.com/fcm/send';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
      );

      print("ddddd${response.body}");
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('Notification sent successfully');
      } else {
        print('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
