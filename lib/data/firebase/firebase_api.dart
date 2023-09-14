import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
        handleMessage(message);

      },
      //TODO: please check below for notification error
      onDidReceiveBackgroundNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
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



  Future<void> initNotifications()async{
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    debugPrint("Token: ${fcmToken.toString()}");
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await initPushNotifications();
    await initLocalNotifications();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message)async{
  debugPrint("Title: ${message.notification?.title}");
  debugPrint("Body: ${message.notification?.body}");
  debugPrint("Data: ${message.data}");
}

