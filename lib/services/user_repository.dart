
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // -- Storing data
  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(user.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "Your account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error",
          "User Authentication has been successfull but was not added into databse.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // fetch user details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db
        .collection("Users")
        .where("Email", isEqualTo: email)
        .get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  // fetch all users
  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Users").get();

    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update(user.toJson())
        .whenComplete(
          () {
            Get.snackbar(
                "Success", "Your account has been Edited Successfully.",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green);
            print("Profile Updated");

          })
        .catchError((error, stackTrace) {
      Get.snackbar("Error",
          "Something went wrong please check user repository file.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });

  }
}
