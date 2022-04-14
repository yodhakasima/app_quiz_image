import 'package:app_quiz_image/components/quiz_controller.dart';
import 'package:app_quiz_image/services/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';

class Optional extends StatelessWidget {
  const Optional({
    Key key,
    this.image,
    this.index,
    this.press,
  }) : super(key: key);

  final String image;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizControllerImage>(
      init: QuizControllerImage(),
      builder: (qnController) {
        Color getRightColor() {
          if (qnController.answered) {
            if (index == qnController.checkAns) {
              return Colors.white;
            } else if (index == qnController.selectAns &&
                qnController.selectAns != qnController.checkAns) {
              return pinkColor;
            }
          }
          return orangeColor;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border.all(color: getRightColor()),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              '$image',
              height: 100,
              width: 100,
            ),
          ),
        );
      },
    );
  }
}
