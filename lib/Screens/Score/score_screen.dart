import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_test2_time/Controllers/question_controller.dart';
import 'package:for_test2_time/constants.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController2 = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            width: double.infinity,
            child: WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.fill),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Text(
                'Score:',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: kSecondaryColor, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Text(
                '${_qnController2.numOfCorrectAnswers * 10} / ${_qnController2.questions.length * 10}',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: kSecondaryColor,
                    ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ],
      ),
    );
  }
}
