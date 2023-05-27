import 'dart:convert';
import 'dart:developer';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'local_notification_service.dart';

class FirebasePushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initFirebase() async {
    log("Firebase Initilize", error: "FirebaseInitiliaze");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('A new onMessageOpenedApp event was published!');
      if (message.notification != null) {
        var data = message.data;
        debugPrint('notification payload: $data');

        // BuildContext context =
        //     GetIt.I<AppRouter>().navigatorKey.currentContext!;
       

        NotificationService().showLocalNotification(
            id: DateTime.now().second,
            title: message.notification?.title ?? "",
            body: message.notification?.body ?? "",
            payload: jsonEncode(message.data));
      }
    });

    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      print("On Message: ${initialMessage.data.toString()}");
      var data = initialMessage.data;
    }
  }

  static Future<void> requestPermission() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  Future<String?> getFirebaseToken() async {
    String? token = await _firebaseMessaging.getToken();
  
    _firebaseMessaging.subscribeToTopic("jobNotifications");


    return token;
  }
}
