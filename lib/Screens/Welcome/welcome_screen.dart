import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_test2_time/Screens/Quiz/quiz_screen.dart';
import 'package:for_test2_time/constants.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  final textFieldController = TextEditingController();

  void textEdit() {
    if (textFieldController.text.isNotEmpty) {
      Get.to(() => const QuizScreen());
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    'Let\'s Play Quiz',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Text('Enter your name below:'),
                  const Spacer(),
                  TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff1c2341),
                      hintText: 'Your Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Material(
                    child: InkWell(
                      onTap: textEdit,
                      child: Container(
                        padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Let\'s start quiz',
                          style: Theme.of(context)
                              .textTheme
                              .button!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
