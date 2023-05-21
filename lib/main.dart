import 'package:flutter/material.dart';
import 'package:governmentjob/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:governmentjob/services/authentication_repository.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthenticationRepository());
  runApp(const MyApp());
}
