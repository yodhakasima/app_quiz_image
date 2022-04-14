import 'package:app_quiz_image/components/quiz.dart';
import 'package:app_quiz_image/components/quiz_score.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizControllerImage extends GetxController
    with SingleGetTickerProviderMixin {
  List<Quiz> _quiz = quiz_exam
      .map(
        (quiz) => Quiz(
            id: quiz['id'],
            quiz: quiz['quiz'],
            ask: quiz['ask'],
            optional: quiz['optional'],
            answer: quiz['answer']),
      )
      .toList();

  List<Quiz> get quiz => this._quiz;

  int _selectAns;
  int get selectAns => this._selectAns;

  int _checkAns;
  int get checkAns => this._checkAns;

  bool _answered = false;
  bool get answered => this._answered;

  PageController _quizPage;
  PageController get pageController => this._quizPage;

  RxInt _quizNum = 1.obs;
  RxInt get quizNum => this._quizNum;

  int _numCheckAns = 0;
  int get numcheckAns => this._numCheckAns;

  @override
  void onInit() {
    _quizPage = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _quizPage.dispose();
  }

  void correctAns(Quiz quiz, int selectedIndex, BuildContext context) {
    _answered = true;
    _checkAns = quiz.answer;
    _selectAns = selectedIndex;

    if (_checkAns == _selectAns) {
      _numCheckAns++;
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.green,
        content: Text("Correct!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        duration: Duration(milliseconds: 200),
        backgroundColor: Colors.red,
        content: Text("Incorrect!"),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    update();

    Future.delayed(Duration(seconds: 2), () {
      nextQuiz();
    });
  }

  void nextQuiz() {
    if (_quizNum.value != _quiz.length) {
      _answered = false;
      _quizPage.nextPage(
          duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);
    } else {
      Get.to(() => QuizScore());
    }
  }

  void updateQuiz(int index) {
    _quizNum.value = index + 1;
  }
}
