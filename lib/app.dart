import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:governmentjob/controllers/authprovider.dart';
import 'package:governmentjob/controllers/job_controller.dart';
import 'package:governmentjob/pages/initial_screen.dart';
import 'package:governmentjob/services/navigation_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JobProvider(),),
        ChangeNotifierProvider(create: (context) => AuthProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: GetIt.I<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home:  InitialScreen(),
      ),
    );
  }
}
