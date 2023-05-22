import 'package:flutter/material.dart';

class Hspace extends StatelessWidget {
  final double hspace;
  const Hspace(this.hspace, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: hspace,
    );
  }
}
