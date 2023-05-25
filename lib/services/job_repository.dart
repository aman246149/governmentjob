import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/globalvariable.dart';
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
  Future<List<JobModel>> getIntialAllJobs() async {
    final snapshot = await _db.collection("Jobs").limit(10).orderBy("dateUploaded",descending: true).get();

    final jobData = snapshot.docs.map((e) => JobModel.fromSnapshot(e)).toList();

    if (snapshot.docs.isNotEmpty) {
    lastSnapShot = snapshot.docs.last;
    }
    
    return jobData;
  }

  Future<List<JobModel>> getPaginatedAllJobs() async {
      if (lastSnapShot == null) {
    return []; // No more documents to fetch
  }
    final snapshot = await _db.collection("Jobs").orderBy('dateUploaded',descending: true).startAfter([lastSnapShot!['dateUploaded']]).limit(10).get();

    final jobData = snapshot.docs.map((e) => JobModel.fromSnapshot(e)).toList();
    if (snapshot.docs.isNotEmpty) {
    lastSnapShot = snapshot.docs.last;
    }
    return jobData;
  }
}
