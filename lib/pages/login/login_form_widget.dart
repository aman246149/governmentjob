
import 'package:flutter/material.dart';

import '../../controllers/login_controller.dart';
import 'package:get/get.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: "E-Mail",
                    hintText: "E-Mail",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  // suffixIcon: IconButton(
                  //   onPressed: null,
                  //   icon: Icon(Icons.remove_red_eye_sharp),
                  // ),
                ),
              ),
              const SizedBox(height: 20),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //       onPressed: () {
              //         // WForgetPasswordScreen.buildShowModalBottomSheet(context);
              //       },
              //       child: const Text(myForgetPassword)),
              // ),
              SizedBox(
                width: double.infinity,
                child: controller.isLoading.value ? const Center(child: SizedBox(width:35.0,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.red)))) :ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      LoginController.instance.loginUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  child: const Text("LOGIN"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
