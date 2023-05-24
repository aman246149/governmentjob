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

final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    getJobs();
    _scrollController.addListener(() {
  if (_scrollController.position.pixels ==
      _scrollController.position.maxScrollExtent) {
   _fetchNextPage();
  }
});
  }

  void getJobs() async {
    jobs = await controller.getInitialJobs();
    isJobAvailable = true;
    setState(() {});
  }

  
bool isNextDocumentLoading = false;

Future<void> _fetchNextPage() async {
  if (!isNextDocumentLoading) {
    setState(() {
      isNextDocumentLoading = true;
    });

     var resp= await controller.getPaginatedJobs(jobs.length);

    setState(() {
      jobs.addAll(resp);
      isNextDocumentLoading = false;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("JOBS"),
        ),
        backgroundColor: Colors.grey[100],
        body: SafeArea(
            child: isJobAvailable
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          controller: _scrollController,
                            itemCount: jobs.length,
                            separatorBuilder: (context, index) => Divider(
                                  thickness: 0.4,
                                  height: 5,
                                  color: Colors.grey[100],
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              var time = jobs[index].lastDate;
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ExpandablePanel(
                                  header: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: TextWidget(
                                      text: jobs[index].jobName,
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                    subtitle: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Colors.black,size: 14,
                                            ),
                                            const Hspace(10),
                                            TextWidget(
                                                text: "Last date to apply : ${intl.DateFormat('d/M/y')
                                                        .format(time)}",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ],
                                        ),
                                        Vspace(5),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons
                                                    .cast_for_education_outlined,size: 14,
                                                color: Colors.black),
                                            const Hspace(10),
                                            TextWidget(
                                                text:
                                                    "Qualififcation : ${jobs[index].qualification}",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  collapsed: const SizedBox(),
                                  expanded: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Vspace(8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextWidget(
                                            text: "Job Category",
                                            fontSize: 12,
                                          ),
                                          TextWidget(
                                            text: jobs[index].jobCategory,
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),
                                        ],
                                      ),
                                      const Vspace(8),
                                      const TextWidget(
                                        text: "Job Description",
                                        fontSize: 12,
                                      ),
                                      const Vspace(4),
                                      TextWidget(
                                        text: jobs[index].description,
                                        fontSize: 12,
                                        color: Colors.purple,
                                      ),
                                     const Vspace(8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextWidget(
                                            text: "Salary Range",
                                            fontSize: 12,
                                          ),
                                          TextWidget(
                                            text: "${jobs[index].salaryRange}",
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),
                                        ],
                                      ),
                                     const Vspace(8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextWidget(
                                            text: "Qualification:",
                                            fontSize: 12,
                                          ),
                                          TextWidget(
                                            text:
                                                "${jobs[index].qualification}",
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),
                                        ],
                                      ),
                                      const Vspace(8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const TextWidget(
                                            text: "Date of creation",
                                            fontSize: 12,
                                          ),
                                          TextWidget(
                                            text:
                                                intl.DateFormat('d/M/y').format(jobs[index].dateUploaded),
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),
                                        ],
                                      ),
                                     
                                    
                                      const Vspace(15),
                                      Row(
                                        children: [
                                          
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[100]),
                                              onPressed: () {},
                                              child: const TextWidget(text: "APPLY",fontWeight: FontWeight.bold,),
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
                : const Center(
                    child: SizedBox(
                        width: 35.0,
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.red))))));
  }
}

//home
