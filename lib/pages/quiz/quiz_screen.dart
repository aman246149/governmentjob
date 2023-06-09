import 'package:flutter/material.dart';
import 'package:governmentjob/controllers/quiz_provider.dart';
import 'package:governmentjob/widgets/custom_text.dart';
import 'package:governmentjob/widgets/hspace.dart';
import 'package:governmentjob/widgets/vspace.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../widgets/quiz_widget.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
          controller: context.read<QuizProvider>().controller,
          physics: NeverScrollableScrollPhysics(),
          pageSnapping: true,
          itemCount: 5,
          itemBuilder: (context, index) {
            return QuizWidget();
          },
        ),
      ),
    );
  }
}
