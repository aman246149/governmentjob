
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_model.dart';
import '../models/user_model.dart';
import '../services/authentication_repository.dart';
import '../services/job_repository.dart';
import '../services/user_repository.dart';

class JobController extends GetxController {
  static JobController get instance => Get.find();

  var isLoading = false.obs;

//TextField Controllers to get data from TextFields
//   final jobName = TextEditingController();
//   final jobCategiry = TextEditingController();
//   final description = TextEditingController();
//   final lastDate = TextEditingController();

  final jobRepo = Get.put(JobRepository());

  Future<void> createJob(JobModel job) async {
    await jobRepo.createJob(job);
    isLoading.value = false;
  }

  Future<List<JobModel>> getAllJobs() async {
    isLoading.value = false;
    return jobRepo.getAllJobs();
  }
}
