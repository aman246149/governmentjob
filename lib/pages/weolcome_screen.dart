import 'package:flutter/material.dart';
import 'package:governmentjob/pages/singup/signup_screen.dart';
import 'package:governmentjob/widgets/hspace.dart';
import 'package:governmentjob/widgets/vspace.dart';

import '../constants/images.dart';
import '../widgets/custom_text.dart';
import 'login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    // var brightness = mediaQuery.platformBrightness;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                const Text("Job News",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0)),
              Image(image: const AssetImage(promotion), height: height * 0.65),
              Column(
                children: [
                  const TextWidget(
                    text: "Job Employment Guide",
                    fontSize: 20,
                  ),
                  Text("Unlock Endless Job Opportunities with Ease",
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
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginScreen())),
                  child: const Text("LOGIN"),
                ),
              ),
              const Hspace(10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const SignUpScreen())),
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
