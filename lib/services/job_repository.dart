import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_model.dart';

class JobRepository extends GetxController {
  static JobRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // -- Storing data
  createJob(JobModel job) async {
    await _db
        .collection("Jobs")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(job.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "New has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error",
          "Job Authentication has been successfull but was not added into databse.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  // fetch job details
  Future<JobModel> getJobDetails(String jobName) async {
    final snapshot =
        await _db.collection("Jobs").where("jobName", isEqualTo: jobName).get();

    final jobData = snapshot.docs.map((e) => JobModel.fromSnapshot(e)).single;
    return jobData;
  }

  // fetch all jobs
  Future<List<JobModel>> getAllJobs() async {
    final snapshot = await _db.collection("Jobs").get();

    final jobData = snapshot.docs.map((e) => JobModel.fromSnapshot(e)).toList();

    return jobData;
  }
}
