import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:governmentjob/controllers/job_controller.dart';
import 'package:governmentjob/models/job_model.dart';
import 'package:governmentjob/widgets/custom_text.dart';
import 'package:governmentjob/widgets/hspace.dart';
import 'package:governmentjob/widgets/vspace.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(JobController());
  List<JobModel> jobs = [];
  bool isJobAvailable = false;

  @override
  void initState() {
    super.initState();
    getJobs();
  }

  void getJobs() async {
    jobs = await controller.getAllJobs();
    isJobAvailable = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JOBS"),
        ),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: isJobAvailable
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                            itemCount: jobs.length,
                            separatorBuilder: (context, index) => Divider(
                                  thickness: 0.4,
                                  height: 5,
                                  color: Colors.grey[100],
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              var time = jobs[index].lastDate;
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ExpandablePanel(
                                  header: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: TextWidget(
                                      text: "${jobs[index].jobName}",
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Colors.black,
                                            ),
                                            Hspace(10),
                                            TextWidget(
                                                text: "Last date to apply : " +
                                                    intl.DateFormat('d/M/y')
                                                        .format(time),
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons
                                                    .cast_for_education_outlined,
                                                color: Colors.black),
                                            Hspace(10),
                                            TextWidget(
                                                text:
                                                    "Qualififcation : ${jobs[index].qualification}",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Vspace(15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: "Job Category",
                                            fontSize: 16,
                                          ),
                                          TextWidget(
                                            text: "${jobs[index].jobCategory}",
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Vspace(15),
                                      TextWidget(
                                        text: "Job Description",
                                        fontSize: 16,
                                      ),
                                      Vspace(4),
                                      TextWidget(
                                        text: "${jobs[index].description}",
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                      Vspace(15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: "Salary Range",
                                            fontSize: 16,
                                          ),
                                          TextWidget(
                                            text: "${jobs[index].salaryRange}",
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Vspace(15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: "Qualification:",
                                            fontSize: 16,
                                          ),
                                          TextWidget(
                                            text:
                                                "${jobs[index].qualification}",
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Vspace(15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: "Date of creation",
                                            fontSize: 16,
                                          ),
                                          TextWidget(
                                            text:
                                                "${intl.DateFormat('d/M/y').format(jobs[index].dateUploaded)}",
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Vspace(15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextWidget(
                                            text: "Last Date to apply",
                                            fontSize: 16,
                                          ),
                                          TextWidget(
                                            text:
                                                "${intl.DateFormat('d/M/y').format(jobs[index].lastDate)}",
                                            fontSize: 16,
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                      Vspace(15),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () {},
                                              child:
                                                  const Text("VISIT WEBSITE"),
                                            ),
                                          ),
                                          const Hspace(10),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              child: const Text("APPLY"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  )
                : Center(
                    child: SizedBox(
                        width: 35.0,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.red))))));
  }
}

//home
