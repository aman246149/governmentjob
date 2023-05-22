import 'package:flutter/material.dart';

class Vspace extends StatelessWidget {
  final double vspace;
  const Vspace(this.vspace, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: vspace,
    );
  }
}
