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
        body: SafeArea(
            child: isJobAvailable
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: jobs.length,
                            itemBuilder: (BuildContext context, int index) {
                              var time = jobs[index].lastDate;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    child: ExpandablePanel(
                                      header: ListTile(
                                        tileColor: Colors.deepPurple,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          side: BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: TextWidget(
                                            text: "${jobs[index].jobName}",
                                            color: Colors.white),
                                        subtitle: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                ),
                                                Hspace(10),
                                                TextWidget(
                                                    text:
                                                        "Last date to apply : " +
                                                            intl.DateFormat(
                                                                    'd/M/y')
                                                                .format(time),
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons
                                                        .cast_for_education_outlined,
                                                    color: Colors.white),
                                                Hspace(10),
                                                TextWidget(
                                                    text:"Qualififcation : ${jobs[index].qualification}",
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 12),
                                              ],
                                            ),
                                          ],
                                        ),
                                        // trailing: ElevatedButton(
                                        //   onPressed: () {},
                                        //   child: Text("Apply"),
                                        // ),
                                      ),
                                      collapsed: SizedBox(),
                                      expanded: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                            ),
                                          ],
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        // padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                          text: "Job Category"),
                                                      TextWidget(
                                                          text:
                                                              "${jobs[index].jobCategory}",
                                                          color: Colors.green),
                                                    ]),
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                          text:
                                                              "Job Description"),
                                                      TextWidget(
                                                          text:
                                                              "${jobs[index].description}",
                                                          color: Colors.green),
                                                    ]),
                                              ],
                                            ),
                                            Vspace(4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                          text: "Salary Range"),
                                                      TextWidget(
                                                        text:
                                                            "${jobs[index].salaryRange}",
                                                        color: Colors.green,
                                                      ),
                                                    ]),
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                          text: "Qulification"),
                                                      Vspace(4),
                                                      TextWidget(
                                                        text:
                                                            "${jobs[index].qualification}",
                                                        color: Colors.green,
                                                      ),
                                                    ]),
                                              ],
                                            ),
                                            Vspace(4),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                          text:
                                                              "Date of creation"),
                                                      Vspace(4),
                                                      TextWidget(
                                                          text: intl.DateFormat(
                                                                  'd/M/y')
                                                              .format(jobs[
                                                                      index]
                                                                  .dateUploaded),
                                                          color: Colors.green),
                                                    ]),
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextWidget(
                                                          text:
                                                              "Last Date to apply "),
                                                      Vspace(4),
                                                      TextWidget(
                                                          text: intl.DateFormat(
                                                                  'd/M/y')
                                                              .format(jobs[
                                                                      index]
                                                                  .lastDate),
                                                          color: Colors.green)
                                                    ]),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: OutlinedButton(
                                                      onPressed: () {},
                                                      child: const Text(
                                                          "VISIT WEBSITE"),
                                                    ),
                                                  ),
                                                  const Hspace(10),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {},
                                                      child:
                                                          const Text("APPLY"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
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
