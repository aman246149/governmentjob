
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  var isLoading = false.obs;
  //Textfield controller to get the data from Textfeilds
  final email = TextEditingController();
  final password = TextEditingController();

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    String? error = await AuthenticationRepository.instance
        .LoginWithEmailAndPassword(email, password);
    isLoading.value = false;
    if (error != null) {
      Get.snackbar("Error :", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    } else {
      Get.snackbar("Success :", "You are logged in successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.greenAccent.withOpacity(0.1),
          colorText: Colors.green);
    }
  }

  Future<void> loginUserWithGoogle()async {

    String? error = await AuthenticationRepository.instance.SignInWithGoogle();
    if (error != null)
    {
      Get.snackbar("Error :",error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
    else
    {
      Get.snackbar("Success :", "You are logged in successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.greenAccent.withOpacity(0.1),
          colorText: Colors.green);
    }
  }
}
