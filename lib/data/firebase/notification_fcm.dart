import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:digi_patient/routes/routes.gr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;


class NotificationService{

  static const String key = "AAAA3knWO18:APA91bEikTG3hjAdHc0S6VKY_-DvYHCrf2FpxueDOXLVPy8g5HKdQqJ1wH2YHm0An33AFVaNklmHEf-hRBfDRSLRyU8qyjBfXroIFNVCjwUE57THe--D3XJI5uFOxN63R1r1DTA4MihA";

  final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  void initLocalNotification(){

    const ios = DarwinInitializationSettings();
    const android = AndroidInitializationSettings("@drawable/ic_launcher");
    const initializationSettings = InitializationSettings(android: android, iOS: ios);

    flutterLocalNotificationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint(details.payload);
      },
    );
  }

  Future<void> showLocalNotification(RemoteMessage message)async{

    final styleInformation = BigTextStyleInformation(
      message.notification!.body.toString(),
      htmlFormatBigText: true,
      contentTitle: message.notification!.title,
      htmlFormatTitle: true,
    );
    final androidDetails = AndroidNotificationDetails(
      "com.example.digi_patient.urgent",
      "mychannelid",
      importance: Importance.max,
      styleInformation: styleInformation,
      priority: Priority.max,
    );
    final notificationDetails = NotificationDetails(
        android: androidDetails
    );
    await flutterLocalNotificationPlugin.show(
        0, message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: message.data["body"]
    );
  }

  Future<void> requestPermission()async{
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      debugPrint("Authorized");
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      debugPrint("Provisional permission granted");
    }else{
      debugPrint("User declined the permission");
    }
  }

  Future<void> getToken()async{
    final token = await FirebaseMessaging.instance.getToken();

  }


  final String receiverToken = '';

  Future<void> getReceiverToken(String? receiverId)async{

  }


  Future<void> sendNotification(
  {required String body, required String senderId}
      )async{

    try{
      await http.post(Uri.parse("https://fcm.googleapis.com/fcm/send"),
          headers: <String, String> {
            "Content-Type" : "application/json",
            "Authorization" : "key=$key",
          },
          body: jsonEncode(<String, dynamic>{
            "to" : receiverToken,
            "priority" : "high",
            "notification" : <String, dynamic> {
              "body" : body,
              "title" : "New Message!",
            },
            "data" : <String, String>{
              'click_action' : "FLUTTER_NOTIFICATION_CLICK",
              "status" : "done",
              "senderId" : senderId,
            }
          })
      );
    }catch (e){
      debugPrint(e.toString());
    }
  }

  void firebaseNotification(BuildContext context){
    initLocalNotification();
    FirebaseMessaging.onMessageOpenedApp.listen((event) async{
      //TODO: navigate notification Screen
      // context.router.push(VideoCallingRoute(token: token, channelName: channelName, appId: appId))
    });

    FirebaseMessaging.onMessage.listen((event) async{
      await showLocalNotification(event);
    });
  }
}