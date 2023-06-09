import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:governmentjob/widgets/vspace.dart';
import 'package:provider/provider.dart';

import '../controllers/quiz_provider.dart';
import 'custom_text.dart';
import 'hspace.dart';


class QuizWidget extends StatelessWidget {
  const QuizWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          text: "Who is The PrimeMinister of India ?",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        Vspace(20),
        ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: CheckboxListTile(
                    value: true,
                    onChanged: (value) {},
                    title: TextWidget(text: "Narendra Modi")),
              );
            },
            separatorBuilder: (context, index) => Vspace(10),
            itemCount: 4),
        Vspace(50),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizProvider>().controller.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  child: Text("Previous")),
            ),
            Hspace(10),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<QuizProvider>().controller.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                  child: Text("Next")),
            ),
          ],
        )
      ],
    ).animate().fadeIn().then().shimmer();
  }
}
