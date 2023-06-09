import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

class CurrentAffair extends StatefulWidget {
  const CurrentAffair({super.key});

  @override
  State<CurrentAffair> createState() => _CurrentAffairState();
}

class _CurrentAffairState extends State<CurrentAffair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Affairs"),
      ),
      body: Center(
        child: TextWidget(text: "Feature Coming SOON"),
      ),
    );
  }
}
