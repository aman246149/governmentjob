import 'package:flutter/material.dart';
import 'package:governmentjob/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:governmentjob/services/local_notification_service.dart';
import 'package:governmentjob/services/navigation_service.dart';
import 'package:governmentjob/services/pushnotificaiton_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(AuthenticationRepository());
  await FirebasePushNotificationService.initFirebase();
  await FirebasePushNotificationService.requestPermission();
  await NotificationService().initializePlatformNotifications();
  setupLocator();
  runApp(const MyApp());
}
