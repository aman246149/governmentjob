
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/job_model.dart';
import '../services/job_repository.dart';

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

  Future<List<JobModel>> getInitialJobs() async {
    isLoading.value = false;
    return jobRepo.getIntialAllJobs();
  }
  Future<List<JobModel>> getPaginatedJobs() async {
  
    return jobRepo.getPaginatedAllJobs();
  }
}
