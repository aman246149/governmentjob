
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:governmentjob/widgets/vspace.dart';

import '../login/login_screen.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        // const SizedBox(height: myFormHeight - 20),
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton.icon(
        //     onPressed: () {
        //       WSignUpController.instance.registerWholesalerWithGoogle();
        //     },
        //     icon: const Image(
        //       image: AssetImage(myGoogleLogo),
        //       width: 20.0,
        //     ),
        //     label: Text(mySignInWithGoogle.toUpperCase()),
        //   ),
        //
        // ),
        const Vspace(10),
        TextButton(
          onPressed: () {
            Get.offAll(const LoginScreen());
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: "Already have an Account? ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const TextSpan(text: "LOGIN")
          ])),
        )
      ],
    );
  }
}
