import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:governmentjob/controllers/job_controller.dart';
import 'package:governmentjob/models/job_model.dart';
import 'package:governmentjob/widgets/custom_text.dart';
import 'package:governmentjob/widgets/hspace.dart';
import 'package:governmentjob/widgets/vspace.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../core/common_dialogs/about_us_dialog.dart';
import '../services/inappwebview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    jobs = await context.read<JobProvider>().getInitialJobs(context);
    isJobAvailable = true;
    if (mounted) {
      setState(() {});
    }
  }

  bool isNextDocumentLoading = false;

  Future<void> _fetchNextPage() async {
    if (!isNextDocumentLoading) {
      setState(() {
        isNextDocumentLoading = true;
      });

      var resp = await context.read<JobProvider>().getPaginatedJobs(context);

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
          actions: [
            IconButton(
                onPressed: () {
                  showDialogData(context);
                },
                icon: const Icon(Icons.more_vert)),
            const Hspace(8)
          ],
        ),

        // backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: isJobAvailable
              ? Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          getJobs();
                        },
                        child: jobs.isEmpty
                            ? const Center(
                                child: Text("No Jobs Yet"),
                              )
                            : ListView.separated(
                                controller: _scrollController,
                                itemCount: jobs.length,
                                separatorBuilder: (context, index) => Divider(
                                      thickness: 0.4,
                                      height: 5,
                                    ),
                                itemBuilder: (BuildContext context, int index) {
                                  var time = jobs[index].lastDate;
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 15),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ExpandablePanel(
                                      header: ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: TextWidget(
                                          text: jobs[index].jobName,
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
                                                  size: 14,
                                                ),
                                                const Hspace(10),
                                                TextWidget(
                                                    text:
                                                        "Last date to apply : ${intl.DateFormat('d/M/y').format(time)}",
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13),
                                              ],
                                            ),
                                            const Vspace(5),
                                            //  const Vspace(8),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.currency_rupee,
                                                  color: Colors.black,
                                                  size: 14,
                                                ),
                                                const Hspace(10),
                                                TextWidget(
                                                  text:
                                                      "Salary Range ${jobs[index].salaryRange}",
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
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
                                          const TextWidget(
                                            text: "Job Category",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextWidget(
                                            text: jobs[index].jobCategory,
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),
                                          const Vspace(8),
                                          const TextWidget(
                                            text: "Job Description",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          // const Vspace(4),
                                          TextWidget(
                                            text: jobs[index].description,
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),

                                          const Vspace(8),
                                          const TextWidget(
                                            text: "Qualification",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextWidget(
                                            text:
                                                "${jobs[index].qualification}",
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),

                                          const Vspace(8),
                                          const TextWidget(
                                            text: "Job Source",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          const TextWidget(
                                            text: "Internet",
                                            fontSize: 12,
                                            color: Colors.purple,
                                          ),
                                          const Vspace(8),

                                          const Vspace(15),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    InAppWeb(
                                                                      url: jobs[
                                                                              index]
                                                                          .websiteLink,
                                                                    )));
                                                  },
                                                  child: const TextWidget(
                                                    text: "WEBSITE LINK",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                      ),
                    )
                  ],
                )
              : const Center(
                  child: SizedBox(
                      width: 35.0,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.red)))),
        ));
  }
}

//home
