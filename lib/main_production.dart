import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:governmentjob/app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:governmentjob/services/local_notification_service.dart';
import 'package:governmentjob/services/navigation_service.dart';
import 'package:governmentjob/services/pushnotificaiton_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);

    return true;
  };
  await FirebasePushNotificationService.initFirebase();
  await FirebaseMessaging.instance.subscribeToTopic("jobNotifications");
  await FirebasePushNotificationService.requestPermission();
  await NotificationService().initializePlatformNotifications();
  setupLocator();
  runApp(const MyApp(flavour: "Production",));
}
