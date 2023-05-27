import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/globalvariable.dart';
import '../models/job_model.dart';

class JobRepository {


 static final _db = FirebaseFirestore.instance;

  // fetch job details
static  Future<JobModel> getJobDetails(String jobName) async {
    final snapshot =
        await _db.collection("Jobs").where("jobName", isEqualTo: jobName).get();

    final jobData = snapshot.docs.map((e) => JobModel.fromSnapshot(e)).single;
    return jobData;
  }

  // fetch all jobs
static  Future<List<JobModel>> getIntialAllJobs() async {
    final snapshot = await _db.collection("Jobs").limit(10).orderBy("dateUploaded",descending: true).get();

    final jobData = snapshot.docs.map((e) => JobModel.fromSnapshot(e)).toList();

    if (snapshot.docs.isNotEmpty) {
    lastSnapShot = snapshot.docs.last;
    }
    
    return jobData;
  }

 static Future<List<JobModel>> getPaginatedAllJobs() async {
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
