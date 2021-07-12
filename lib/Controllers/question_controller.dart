import 'package:flutter/material.dart';
import 'package:for_test2_time/Models/questions_class.dart';
import 'package:for_test2_time/Screens/Score/score_screen.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => _animation;
  AnimationController get animationController => _animationController;
  late PageController pageController;

// LIST OF QUESTIONS.....
  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options'],
        ),
      )
      .toList();

  List get questions => _questions;

//.................................................
  //VARIABLES...
  bool isAnswered = false;
  late int correctAns;
  late int selectedAns;
  late int numOfCorrectAnswers = 0;
  final RxInt questionNumber = 1.obs;

  @override
  void onInit() {
    super.onInit();
    _animationController =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward().whenComplete(
          nextQuestion,
        );
    pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    pageController.dispose();
  }

  void checkAns(Question questionObj, int selectedIndex) {
    isAnswered = true;
    correctAns = questionObj.answer;
    selectedAns = selectedIndex;
    if (correctAns == selectedAns) numOfCorrectAnswers++;

    _animationController.stop();
    update();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        nextQuestion();
      },
    );
  }

  void nextQuestion() {
    if (questionNumber.value != questions.length) {
      isAnswered = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(() => const ScoreScreen());
    }
  }

  void updateTheQnNUmber(int index) {
    questionNumber.value = index + 1;
  }
}
