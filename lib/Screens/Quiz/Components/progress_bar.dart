import 'package:flutter/material.dart';
import 'package:for_test2_time/Controllers/question_controller.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xff3f4768),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: GetBuilder<QuestionController>(
              init: QuestionController(),
              builder: (controller) {
                return Stack(
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) => AnimatedContainer(
                        width:
                            constraints.maxWidth * controller.animation.value,
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                          gradient: controller.animation.value * -10 + 10 < 4
                              ? kSecondaryGradient
                              : kPrimaryGradient,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                '${(controller.animation.value * -10 + 10).round()} sec'),
                            WebsafeSvg.asset(
                              'assets/icons/clock.svg',
                              color: controller.animation.value * -10 + 10 < 3.5
                                  ? Colors.red
                                  : const Color(0xFF00FFCB),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
