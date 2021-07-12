import 'package:flutter/material.dart';
import 'package:for_test2_time/Controllers/question_controller.dart';
import 'package:get/get.dart';
import 'Components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu_open,
          size: 32,
        ),
        actions: [
          TextButton(
            onPressed: _controller.nextQuestion,
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
