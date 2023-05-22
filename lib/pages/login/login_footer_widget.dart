
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:governmentjob/widgets/vspace.dart';

import '../singup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(child: Text("OR")),
        // const SizedBox(height: myFormHeight - 20),
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton.icon(
        //     icon: const Image(image: AssetImage(myGoogleLogo), width: 20.0),
        //     onPressed: () {
        //       WLoginController.instance.loginWholesalerWithGoogle();
        //     },
        //     label: const Text(mySignInWithGoogle),
        //   ),
        // ),
        const Vspace(10),
        TextButton(
          onPressed: () {
            Get.offAll(const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
                text: "Don't have an Account? ",
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(text: "Signup", style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}
