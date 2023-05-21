import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:governmentjob/pages/singup/signup_screen.dart';

import '../constants/colors.dart';
import '../constants/images.dart';
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
              const Text("Wholesaler Side",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
              Image(
                  image: const AssetImage(myShopingBasket),
                  height: height * 0.55),
              Column(
                children: [
                  Text("B2B Exchange",
                      style: Theme.of(context).textTheme.displaySmall),
                  Text(
                      "Welcome to the ultimate wholesale-retail solution\nRevolutionize your wholesale-retail business with our app",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(width: 10.0),
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
