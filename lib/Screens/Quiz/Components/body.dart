import 'package:flutter/material.dart';
import 'package:for_test2_time/Controllers/question_controller.dart';
import 'package:for_test2_time/Screens/Quiz/Components/progress_bar.dart';
import 'package:for_test2_time/constants.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return AnimatedBuilder(
        animation: _questionController.animationController,
        builder: (context, _) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: WebsafeSvg.asset(
                  'assets/icons/bg.svg',
                  fit: BoxFit.fill,
                ),
              ),
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding),
                      child: ProgressBar(),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding),
                      child: Obx(
                        () => Text.rich(
                          TextSpan(
                            text:
                                'Question ${_questionController.questionNumber}',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: kSecondaryColor),
                            children: [
                              TextSpan(
                                text:
                                    '/${_questionController.questions.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 4,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        onPageChanged: _questionController.updateTheQnNUmber,
                        itemCount: _questionController.questions.length,
                        itemBuilder: (context, index) => QuestionCard(
                          questionObj: _questionController.questions[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
