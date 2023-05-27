import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:governmentjob/controllers/authprovider.dart';
import 'package:governmentjob/controllers/job_controller.dart';
import 'package:governmentjob/pages/initial_screen.dart';
import 'package:governmentjob/services/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
        theme: FlexThemeData.light(scheme: FlexScheme.mallardGreen,useMaterial3: true),
        home:  InitialScreen(),
      ),
    );
  }
}
