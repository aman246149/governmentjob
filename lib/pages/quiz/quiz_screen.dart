import 'package:flutter/material.dart';
import 'package:governmentjob/widgets/custom_text.dart';

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
      body: Center(
        child: TextWidget(text: "Feature Coming SOON"),
      ),
    );
  }
}
