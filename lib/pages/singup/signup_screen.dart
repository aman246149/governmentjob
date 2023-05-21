
import 'package:flutter/material.dart';
import 'package:governmentjob/pages/singup/signup_footer_widget.dart';
import 'package:governmentjob/pages/singup/signup_form_widget.dart';
import 'package:governmentjob/pages/singup/signup_header_widget.dart';

import '../../constants/images.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: const [
                SignUpHeaderWidget(
                  image: myShopingBasketWithPhone,
                  title: "Get On Board!",
                  subTitle: "Create your profile to start your Journey.",
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
