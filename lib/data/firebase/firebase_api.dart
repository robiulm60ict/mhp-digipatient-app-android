import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/user.dart';

class FirebaseApi{
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
   String icon = "@drawable/ic_launcher";

  final androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notification",
  importance: Importance.defaultImportance
  );

  final localNotification = FlutterLocalNotificationsPlugin();

  Future<void> handleMessage(RemoteMessage? message)async{
    if(message == null){
      return;
    }else{
      //TODO: Navigate to notification screen using the navigator key
    }
  }

  Future<void> initLocalNotifications()async{
    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("@drawable/ic_launcher");
    const settings = InitializationSettings(android: android, iOS: ios);
    await localNotification.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
        /// checking message response
        debugPrint("---Message from init local notification did receive notification: \n\n\n${message.data.values}\n\n\n");
        handleMessage(message);

      },
      //TODO: please check below for notification error
      onDidReceiveBackgroundNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
        debugPrint("---Message from init local notification did receive background notification: \n\n\n${message.data.values}\n\n\n");
        handleMessage(message);
      },

    );
    final platform = localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(androidChannel);

  }

  Future<void> initPushNotifications()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage((handleBackgroundMessage));
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if(notification == null) return;
      localNotification.show(
          notification.hashCode, notification.title, notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          channelDescription: androidChannel.description,
          icon: icon,
        )
      ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }
  saveTokenLocally(String token)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(UserP.fcmToken, token);
    debugPrint("\n\n\n\n\ntoken saved locally success::: token: $token");
  }


  Future<void> initNotifications()async{
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    saveTokenLocally(fcmToken.toString());
    debugPrint("Token: ${fcmToken.toString()}");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await initPushNotifications();
    await initLocalNotifications();
  }

  Future<void> sendNotification({required String fcmToken, required data})async{
    firebaseMessaging.sendMessage(
      to: fcmToken,
      messageId: "0",
     data: data,

    );
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message)async{
  debugPrint("Title: ${message.notification?.title}");
  debugPrint("Body: ${message.notification?.body}");
  debugPrint("Data: ${message.data}");
}


