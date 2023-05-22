import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:governmentjob/widgets/vspace.dart';

import '../../controllers/signup_controller.dart';
import '../../models/user_model.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: formKey,
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text("Full Name"),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const Vspace(10),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text("E-Mail"),
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const Vspace(10),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.fingerprint)),
              ),
              const Vspace(20),
              SizedBox(
                width: double.infinity,
                child: controller.isLoading.value
                    ? const Center(
                        child: SizedBox(
                            width: 35.0,
                            child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.red))))
                    : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final user = UserModel(
                              email: controller.email.text.trim(),
                              password: controller.password.text.trim(),
                              fullName: controller.fullName.text.trim(),
                            );
                            controller.registerUser(user);
                          }
                        },
                        child: const Text("SIGNUP"),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
