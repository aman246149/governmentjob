
import 'package:flutter/material.dart';

import '../../constants/images.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(job),
            height: size.height * 0.2),
        Text("Welcome Back,", style: Theme.of(context).textTheme.displaySmall),
        Text("Make it work, make it right, make it fast.", style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
