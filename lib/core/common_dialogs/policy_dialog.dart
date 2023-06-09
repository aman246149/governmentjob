import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({
    Key? key,
    this.radius = 2,
    required this.mdFileName,
  })  : assert(mdFileName.contains('.md'),
  'The file must contain the .md extension'),
        super(key: key);

  final double radius;
  final String mdFileName;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 150)).then((value) {
                return rootBundle
                    .loadString('assets/privacyPolicy/$mdFileName');
              }),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(
                    data: snapshot.data.toString(),
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                        .copyWith(
                        p: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () =>  Navigator.of(context).pop(),
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: Text(
                "CLOSE",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.labelLarge!.color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}