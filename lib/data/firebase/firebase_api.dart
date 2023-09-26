import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/view/real_communication/video_call.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import '../../routes/routes.gr.dart';
import '../../utils/user.dart';
import '../../view/real_communication/data.dart';

Future<void> handleBackgroundMessage(RemoteMessage message)async{
  debugPrint("Title: ${message.notification?.title}");
  debugPrint("Body: ${message.notification?.body}");
  debugPrint("Data: ${message.data}");
  // appRoute.push(VideoCallingRoute(token: message.data['token'], channelName: message.data['channelName'], appId: appId)) ;

  // appRouter.push(VideoCallingRoute(token: "", channelName: "", appId: appId)) ;

}

class FirebaseApi{
  static const String key = "AAAA3knWO18:APA91bEikTG3hjAdHc0S6VKY_-DvYHCrf2FpxueDOXLVPy8g5HKdQqJ1wH2YHm0An33AFVaNklmHEf-hRBfDRSLRyU8qyjBfXroIFNVCjwUE57THe--D3XJI5uFOxN63R1r1DTA4MihA";

  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
   String icon = "@drawable/ic_launcher";
   // String icon = "app_icon";

  final androidChannel = const AndroidNotificationChannel(
      "high_importance_channel", "High Importance Notification",
  description: "This channel is used for important notification",
  importance: Importance.defaultImportance
  );

  final localNotification = FlutterLocalNotificationsPlugin();



  Future<void> initLocalNotifications()async{
    // const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("@drawable/ic_launcher");
    const settings = InitializationSettings(android: android,);
    await localNotification.initialize(
      settings,
      onSelectNotification: (payload) {
        final message = RemoteMessage.fromMap(jsonDecode(payload!));
        handleMessage(message);
      },
      // onDidReceiveNotificationResponse: (details) {
      //   final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
      //   /// checking message response
      //   debugPrint("---Message from init local notification did receive notification: \n\n\n${message.data.values}\n\n\n");
      //   handleMessage(message);
      //
      // },
      // //TODO: please check below for notification error
      // onDidReceiveBackgroundNotificationResponse: (details) {
      //   final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
      //   debugPrint("---Message from init local notification did receive background notification: \n\n\n${message.data.values}\n\n\n");
      //   handleMessage(message);
      // },

    );
    final platform = localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(androidChannel);

  }

  Future initPushNotifications()async{
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
     initPushNotifications();
     initLocalNotifications();
  }

  Future<void> sendNotification({required String fcmToken, required data})async{
    debugPrint("\n\n\n\n\n\n\n\n\n\n\nSender Fcm Token is $fcmToken");
    await firebaseMessaging.sendMessage(
      to: fcmToken,
      messageId: "0",
     data: data,
    );
  }

  Future<void> sendApiNotification(
      {required String fcmToken, required String videoCallToken, required channelName,}
      )async{

    try{
      await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
          headers: <String, String> {
            "Content-Type" : "application/json",
            "Authorization" : "key=$key",
          },
          body: jsonEncode(<String, dynamic>{
            "to" : fcmToken,
            "priority" : "high",
            "notification" : <String, dynamic> {
              "body" : "null",
              "title" : "New Message!",
            },
            "data" : <String, String>{
              'click_action' : "FLUTTER_NOTIFICATION_CLICK",
              "status" : "done",
              "senderId" : "senderId",
              "token" : videoCallToken,
              "channelName" : channelName,
            }
          })
      ).then((value) => debugPrint("\n\n\n\n\n\nMessage send success"));
    }catch (e){
      debugPrint("\n\n\n\n\n\nSending notification Error: $e");
    }
  }
}


// final appRouter = AppRouter(navigatorKey);


 handleMessage(RemoteMessage? message) {
  if(message == null) return;

    //TODO: Navigate to notification screen using the navigator key
    debugPrint("\n\n\n\n\n\n\n Notification tapped  ${message.ttl} Token: ${message.data['token']} Channel Name: ${message.data['channelName']}");
    // router.navigateTo(VideoCallingRoute(token: message.data['token'], channelName: message.data['channelName'], appId: appId));
    // context.router.push(VideoCallingRoute(token: message.data['token'], channelName: message.data['channelName'], appId: appId));
  // appRoute.push(VideoCallingRoute(token: message.data['token'], channelName: message.data['channelName'], appId: appId)) ;
  appRoute.push(VideoCallingRTCRoute(token: message.data['token'], channelName: message.data['channelName'], appId: appId)) ;
  // const AutoRouter().navigatorKey?.currentState?.push(MaterialPageRoute(builder: (BuildContext context) => VideoCallingView(token: "", channelName: message.data['channelName'], appId: appId)));

}