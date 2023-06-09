import 'package:flutter/material.dart';

class QuizProvider extends ChangeNotifier {
  PageController controller = PageController();

  void setPageController(int index) {
    controller.jumpToPage(index);
  }
}
