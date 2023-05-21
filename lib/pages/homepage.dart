import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Jobs").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            // print("lenght${data.length}");

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var time = data[index]['last_date'].toDate();

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 4),
                              child: ExpandablePanel(
                                header: ListTile(
                                  tileColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  title: Text("${data[index]['job_name']}",
                                      style:
                                          const TextStyle(color: Colors.black)),
                                  subtitle: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                              "Last date to apply : " +
                                                  intl.DateFormat('d/M/y')
                                                      .format(time),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12)),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.payment,
                                              color: Colors.grey),
                                          SizedBox(width: 10),
                                          Text(
                                              "${data[index]['other_details']}",
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12)),
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
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.red,
                                ),
                              )

                              // ListTile(
                              //   onTap: () {},
                              //   tileColor: Colors.white,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(12)),
                              //   title: Text("${data[index]['job_name']}",
                              //       style: const TextStyle(color: Colors.black)),
                              //   subtitle: Column(
                              //     children: [
                              //       Row(
                              //         children: [
                              //           const Icon(
                              //             Icons.calendar_month,
                              //             color: Colors.grey,
                              //           ),
                              //           SizedBox(width: 10),
                              //           Text(
                              //               "Last date to apply : " +
                              //                   intl.DateFormat('d/M/y')
                              //                       .format(time),
                              //               style: const TextStyle(
                              //                   color: Colors.grey,
                              //                   fontWeight: FontWeight.bold,
                              //                   fontSize: 12)),
                              //         ],
                              //       ),
                              //       Row(
                              //         children: [
                              //           const Icon(Icons.payment,
                              //               color: Colors.grey),
                              //           SizedBox(width: 10),
                              //           Text("${data[index]['other_details']}",
                              //               style: const TextStyle(
                              //                   color: Colors.red,
                              //                   fontWeight: FontWeight.bold,
                              //                   fontSize: 12)),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              //   trailing: ElevatedButton(
                              //     onPressed: () {},
                              //     child: Text("Apply"),
                              //   ),
                              // ),
                              ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Center(
                child: SizedBox(
                    width: 35.0,
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.red))));
          }
        },
      ),
    ));
  }
}
//home







