import 'package:Sipnayan/widgets/quiz_button_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QuestionCard extends StatefulWidget {
  final question;
  final choices;
  final answer;

  final Function addScore;

  QuestionCard({
    @required this.question,
    @required this.choices,
    @required this.answer,
    @required this.addScore,
  });

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  void initState() {
    genRandomButton();
    super.initState();
  }

  var randombuttons = [];

  void genRandomButton() {
    var uniqueList = [];
    var rng = new Random();

    while (true) {
      for (var i = 0; i < 4; i++) {
        uniqueList.add(rng.nextInt(4));
      }

      randombuttons = uniqueList.toSet().toList();

      if (randombuttons.length < 4) {
        continue;
      } else {
        break;
      }
    }
  }

  bool checkAnswer(String value) {
    if (widget.answer == value) {
      widget.addScore();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              "${widget.question}",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Quando",
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                QuizButton(
                  value: widget.choices[randombuttons[0]],
                  checkAnswer: checkAnswer,
                ),
                QuizButton(
                  value: widget.choices[randombuttons[1]],
                  checkAnswer: checkAnswer,
                ),
                QuizButton(
                  value: widget.choices[randombuttons[2]],
                  checkAnswer: checkAnswer,
                ),
                QuizButton(
                  value: widget.choices[randombuttons[3]],
                  checkAnswer: checkAnswer,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
