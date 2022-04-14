import 'package:app_quiz_image/components/quiz_controller.dart';
import 'package:app_quiz_image/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizScore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuizControllerImage _qnController = Get.put(QuizControllerImage());
    return Scaffold(
      backgroundColor: purpleColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Correct Result',
              style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: bold),
            ),
            Text(
              '${_qnController.numcheckAns}/${_qnController.quiz.length}',
              style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
            ),
            SizedBox(
              height: 60,
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/');
              },
              child: Text(
                'back',
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
