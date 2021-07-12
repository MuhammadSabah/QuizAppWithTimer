import 'package:flutter/material.dart';
import 'package:for_test2_time/Controllers/question_controller.dart';
import 'package:for_test2_time/Models/questions_class.dart';
import 'package:for_test2_time/constants.dart';
import 'package:get/get.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.questionObj}) : super(key: key);
  final Question questionObj;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            questionObj.question,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
          ),
          ...List.generate(
            questionObj.options.length,
            (index) => Expanded(
              child: Option(
                index: index,
                text: questionObj.options[index],
                press: () => _controller.checkAns(questionObj, index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
