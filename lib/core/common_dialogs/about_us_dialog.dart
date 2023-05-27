
import 'package:flutter/material.dart';
import 'package:governmentjob/core/common_dialogs/policy_dialog.dart';
import 'package:provider/provider.dart';

import '../../controllers/authprovider.dart';
import '../../widgets/vspace.dart';
import 'common_dialog.dart';

void showDialogData(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          title: Text(
            "About Us",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DialogRowWidget(
                    context: context,
                    text: "Privacy Policy",
                    icon: Icons.privacy_tip_outlined,
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PolicyDialog(
                            mdFileName: 'privacy.md',
                          );
                        },
                      );
                    },
                  ),
                  const Vspace(8),
                  DialogRowWidget(
                    context: context,
                    icon: Icons.control_point_duplicate_outlined,
                    text: "Terms & Condition",
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PolicyDialog(
                            mdFileName: 'terms.md',
                          );
                        },
                      );
                    },
                  ),
                  const Vspace(8),
                  DialogRowWidget(
                    context: context,
                    icon: Icons.person,
                    text: "About App",
                    ontap: () {
                      Navigator.pop(context);
                      showCommonDialog(context, "About App",
                          "Our government job listing application features a user-friendly interface with two key sections: Job Listings, providing an extensive collection of government job openings, and Website Redirection, enabling users to effortlessly navigate to the official websites and apply directly to their desired positions. It streamlines the job search process by offering a centralized platform for users to explore opportunities and seamlessly connect with the relevant job portals, enhancing their chances of securing government employment.");
                    },
                  ),
                  const Vspace(8),
                  DialogRowWidget(
                    context: context,
                    text: "Acknowledgment",
                    icon: Icons.ac_unit_outlined,
                    ontap: () {
                      Navigator.pop(context);
                      showCommonDialog(context, "Acknowledgment",
                          "Thanks you.. firebase flutter for providing opensource platform to develop such effective application .");
                    },
                  ),
                  const Vspace(8),
                  DialogRowWidget(
                    context: context,
                    text: "Sign Out",
                    icon: Icons.logout_outlined,
                    ontap: () {
                      context.read<AuthProvider>().logOut(context);
                    },
                  ),
                  const Vspace(8),
                  const Vspace(4),
                ],
              ),
            )
          ],
        );
      });
}

class DialogRowWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() ontap;
  const DialogRowWidget({
    Key? key,
    required this.context,
    required this.text,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}