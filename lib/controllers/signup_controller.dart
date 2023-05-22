
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import '../services/authentication_repository.dart';
import '../services/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  var isLoading = false.obs;

//TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  //Call this Function from Design & it will do the rest

  Future<void> registerUser(UserModel user) async {
    isLoading.value = true;
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(
            user.email, user.password);
    if (error != null) {
      Get.snackbar("Error :", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      isLoading.value = false;
    } else {
      createUser(user);
    }
  }

  final userRepo = Get.put(UserRepository());

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    isLoading.value = false;
  }
}
