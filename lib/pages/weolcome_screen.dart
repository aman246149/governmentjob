import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:governmentjob/pages/singup/signup_screen.dart';
import 'package:governmentjob/widgets/hspace.dart';
import 'package:governmentjob/widgets/vspace.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
import '../widgets/custom_text.dart';
import 'login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? mySecondaryColor : Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Government Job Hub",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
              Image(
                  image: const AssetImage(promotion),
                  height: height * 0.65),
              Column(
                children: [
                  TextWidget(text:"Government Employment Guide",fontSize: 20,),
                  Text(
                      "Unlock Endless Government Job Opportunities with Ease",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center),
                ],
              ),
              const Vspace(15),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text("LOGIN"),
                ),
              ),
              const Hspace(10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SignUpScreen()),
                  child: const Text("SIGNUP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
