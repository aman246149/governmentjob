import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  final String jobName;
  final String jobCategory;
  final String description;
  final String applyLink;
  final String websiteLink;
  final DateTime dateUploaded;
  final DateTime lastDate;
  final String? salaryRange;
  final String? qualification;

  const JobModel({
    required this.jobName,
    required this.jobCategory,
    required this.description,
    required this.applyLink,
    required this.websiteLink,
    required this.dateUploaded,
    required this.lastDate,
    this.salaryRange,
    this.qualification,
  });

  // firebase does not stores data directly we need to convert data into json format
  toJson() {
    return {
      "jobName": jobName,
      "jobCategory": jobCategory,
      "description": description,
      "applyLink": applyLink,
      "websiteLink": websiteLink,
      "dateUploaded": dateUploaded,
      "lastDate": lastDate,
      "salaryRange": salaryRange,
      "qualification": qualification,
    };
  }

  //fetching model
  // Map user fetched from firebase to userModel
  factory JobModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document
        .data()!; //.data provides complete object .get provides particular value e.g. email

    return JobModel(
      jobName: data["jobName"],
      //here "jobName" is namne of field in database
      jobCategory: data["jobCategory"],
      description: data["description"],
      applyLink: data["applyLink"],
      websiteLink: data["websiteLink"],
      dateUploaded: data["dateUploaded"].toDate(),
      lastDate: data["lastDate"].toDate(),
      salaryRange: data["salaryRange"],
      qualification: data["qualification"],
    );
  }
}
