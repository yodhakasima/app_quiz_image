import 'package:app_quiz_image/components/quiz_card.dart';
import 'package:app_quiz_image/components/quiz_controller.dart';
import 'package:app_quiz_image/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizControllerImage _quizController = Get.put(QuizControllerImage());
    QuizControllerImage _controller = Get.put(QuizControllerImage());
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Text.rich(
                      TextSpan(
                        text: 'Quiz ${_quizController.quizNum.value}',
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: bold),
                        children: [
                          TextSpan(
                            text: '/${_quizController.quiz.length}',
                            style: whiteTextStyle.copyWith(
                                fontSize: 18, fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: _controller.nextQuiz,
                    child: Text(
                      'Next Quiz',
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: bold),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: orangeColor,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _quizController.pageController,
                onPageChanged: _quizController.updateQuiz,
                itemCount: _quizController.quiz.length,
                itemBuilder: (context, index) =>
                    QuizCard(quiz: _quizController.quiz[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
